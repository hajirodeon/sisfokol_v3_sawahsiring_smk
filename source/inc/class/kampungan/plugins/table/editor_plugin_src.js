/**
 * $RCSfile: editor_plugin_src.js,v $
 * $Revision: 1.38 $
 * $Date: 2006/02/11 18:53:51 $
 *
 * @author Moxiecode
 * @copyright Copyright © 2004-2006, Moxiecode Systems AB, All rights reserved.
 */

/* Import plugin specific language pack */
kampungan.importPluginLanguagePack('table', 'en,tr,ar,cs,da,de,el,es,fi,fr_ca,hu,it,ja,ko,nl,nb,pl,pt,pt_br,sv,tw,zh_cn,fr,de,he,nb,ru,ru_KOI8-R,ru_UTF-8,nn,cy,is,zh_tw,zh_tw_utf8,sk');

var kampungan_TablePlugin = {
	getInfo : function() {
		return {
			longname : 'Tables',
			author : 'Moxiecode Systems',
			authorurl : 'http://kampungan.moxiecode.com',
			infourl : 'http://kampungan.moxiecode.com/kampungan/docs/plugin_table.html',
			version : kampungan.majorVersion + "." + kampungan.minorVersion
		};
	},

	initInstance : function(inst) {
		if (kampungan.isGecko) {
			var doc = inst.getDoc();
			kampungan.addEvent(doc, "mouseup", kampungan_TablePlugin._mouseDownHandler);
		}

		inst.tableRowClipboard = null;
	},

	/**
	 * Returns the HTML contents of the table control.
	 */
	getControlHTML : function(control_name) {
		var controls = new Array(
			['table', 'table.gif', 'lang_table_desc', 'mceInsertTable', true],
			['delete_col', 'table_delete_col.gif', 'lang_table_delete_col_desc', 'mceTableDeleteCol'],
			['delete_row', 'table_delete_row.gif', 'lang_table_delete_row_desc', 'mceTableDeleteRow'],
			['col_after', 'table_insert_col_after.gif', 'lang_table_col_after_desc', 'mceTableInsertColAfter'],
			['col_before', 'table_insert_col_before.gif', 'lang_table_col_before_desc', 'mceTableInsertColBefore'],
			['row_after', 'table_insert_row_after.gif', 'lang_table_row_after_desc', 'mceTableInsertRowAfter'],
			['row_before', 'table_insert_row_before.gif', 'lang_table_row_before_desc', 'mceTableInsertRowBefore'],
			['row_props', 'table_row_props.gif', 'lang_table_row_desc', 'mceTableRowProps', true],
			['cell_props', 'table_cell_props.gif', 'lang_table_cell_desc', 'mceTableCellProps', true],
			['split_cells', 'table_split_cells.gif', 'lang_table_split_cells_desc', 'mceTableSplitCells', true],
			['merge_cells', 'table_merge_cells.gif', 'lang_table_merge_cells_desc', 'mceTableMergeCells', true]);

		// Render table control
		for (var i=0; i<controls.length; i++) {
			var but = controls[i];
			var cmd = 'kampungan.execInstanceCommand(\'{$editor_id}\',\'' + but[3] + '\', ' + (but.length > 4 ? but[4] : false) + (but.length > 5 ? ', \'' + but[5] + '\'' : '') + ');return false;';

			if (but[0] == control_name)
				return kampungan.getButtonHTML(control_name, but[2], '{$pluginurl}/images/'+ but[1], but[3], (but.length > 4 ? but[4] : false));
		}

		// Special tablecontrols
		if (control_name == "tablecontrols") {
			var html = "";

			html += kampungan.getControlHTML("table");
			html += kampungan.getControlHTML("separator");
			html += kampungan.getControlHTML("row_props");
			html += kampungan.getControlHTML("cell_props");
			html += kampungan.getControlHTML("separator");
			html += kampungan.getControlHTML("row_before");
			html += kampungan.getControlHTML("row_after");
			html += kampungan.getControlHTML("delete_row");
			html += kampungan.getControlHTML("separator");
			html += kampungan.getControlHTML("col_before");
			html += kampungan.getControlHTML("col_after");
			html += kampungan.getControlHTML("delete_col");
			html += kampungan.getControlHTML("separator");
			html += kampungan.getControlHTML("split_cells");
			html += kampungan.getControlHTML("merge_cells");

			return html;
		}

		return "";
	},

	/**
	 * Executes the table commands.
	 */
	execCommand : function(editor_id, element, command, user_interface, value) {
		// Is table command
		switch (command) {
			case "mceInsertTable":
			case "mceTableRowProps":
			case "mceTableCellProps":
			case "mceTableSplitCells":
			case "mceTableMergeCells":
			case "mceTableInsertRowBefore":
			case "mceTableInsertRowAfter":
			case "mceTableDeleteRow":
			case "mceTableInsertColBefore":
			case "mceTableInsertColAfter":
			case "mceTableDeleteCol":
			case "mceTableCutRow":
			case "mceTableCopyRow":
			case "mceTablePasteRowBefore":
			case "mceTablePasteRowAfter":
			case "mceTableDelete":
				var inst = kampungan.getInstanceById(editor_id);

				inst.execCommand('mceBeginUndoLevel');
				kampungan_TablePlugin._doExecCommand(editor_id, element, command, user_interface, value);
				inst.execCommand('mceEndUndoLevel');

				return true;
		}

		// Pass to next handler in chain
		return false;
	},

	handleNodeChange : function(editor_id, node, undo_index, undo_levels, visual_aid, any_selection) {
		var colspan = "1", rowspan = "1";

		var inst = kampungan.getInstanceById(editor_id);

		// Reset table controls
		kampungan.switchClass(editor_id + '_table', 'mceButtonNormal');
		kampungan.switchClass(editor_id + '_row_props', 'mceButtonDisabled');
		kampungan.switchClass(editor_id + '_cell_props', 'mceButtonDisabled');
		kampungan.switchClass(editor_id + '_row_before', 'mceButtonDisabled');
		kampungan.switchClass(editor_id + '_row_after', 'mceButtonDisabled');
		kampungan.switchClass(editor_id + '_delete_row', 'mceButtonDisabled');
		kampungan.switchClass(editor_id + '_col_before', 'mceButtonDisabled');
		kampungan.switchClass(editor_id + '_col_after', 'mceButtonDisabled');
		kampungan.switchClass(editor_id + '_delete_col', 'mceButtonDisabled');
		kampungan.switchClass(editor_id + '_split_cells', 'mceButtonDisabled');
		kampungan.switchClass(editor_id + '_merge_cells', 'mceButtonDisabled');

		// Within a td element
		if (tdElm = kampungan.getParentElement(node, "td,th")) {
			kampungan.switchClass(editor_id + '_cell_props', 'mceButtonSelected');
			kampungan.switchClass(editor_id + '_row_before', 'mceButtonNormal');
			kampungan.switchClass(editor_id + '_row_after', 'mceButtonNormal');
			kampungan.switchClass(editor_id + '_delete_row', 'mceButtonNormal');
			kampungan.switchClass(editor_id + '_col_before', 'mceButtonNormal');
			kampungan.switchClass(editor_id + '_col_after', 'mceButtonNormal');
			kampungan.switchClass(editor_id + '_delete_col', 'mceButtonNormal');

			colspan = kampungan.getAttrib(tdElm, "colspan");
			rowspan = kampungan.getAttrib(tdElm, "rowspan");

			colspan = colspan == "" ? "1" : colspan;
			rowspan = rowspan == "" ? "1" : rowspan;

			if (colspan != "1" || rowspan != "1")
				kampungan.switchClass(editor_id + '_split_cells', 'mceButtonNormal');
		}

		// Within a tr element
		if (kampungan.getParentElement(node, "tr"))
			kampungan.switchClass(editor_id + '_row_props', 'mceButtonSelected');

		// Within table
		if (kampungan.getParentElement(node, "table")) {
			kampungan.switchClass(editor_id + '_table', 'mceButtonSelected');
			kampungan.switchClass(editor_id + '_merge_cells', 'mceButtonNormal');
		}
	},

	// Private plugin internal methods

	_mouseDownHandler : function(e) {
		var elm = kampungan.isMSIE ? event.srcElement : e.target;
		var focusElm = kampungan.selectedInstance.getFocusElement();

		// If press on special Mozilla create TD/TR thingie
		if (elm.nodeName == "BODY" && (focusElm.nodeName == "TD" || focusElm.nodeName == "TH" || (focusElm.parentNode && focusElm.parentNode.nodeName == "TD") ||(focusElm.parentNode && focusElm.parentNode.nodeName == "TH") )) {
			window.setTimeout(function() {
				var tableElm = kampungan.getParentElement(focusElm, "table");
				kampungan.handleVisualAid(tableElm, true, kampungan.settings['visual'], kampungan.selectedInstance);
			}, 10);
		}
	},

	/**
	 * Executes the table commands.
	 */
	_doExecCommand : function(editor_id, element, command, user_interface, value) {
		var inst = kampungan.getInstanceById(editor_id);
		var focusElm = inst.getFocusElement();
		var trElm = kampungan.getParentElement(focusElm, "tr");
		var tdElm = kampungan.getParentElement(focusElm, "td,th");
		var tableElm = kampungan.getParentElement(focusElm, "table");
		var doc = inst.contentWindow.document;
		var tableBorder = tableElm ? tableElm.getAttribute("border") : "";

		// Get first TD if no TD found
		if (trElm && tdElm == null)
			tdElm = trElm.cells[0];

		// ------- Inner functions ---------
		function inArray(ar, v) {
			for (var i=0; i<ar.length; i++) {
				// Is array
				if (ar[i].length > 0 && inArray(ar[i], v))
					return true;

				// Found value
				if (ar[i] == v)
					return true;
			}

			return false;
		}

		function makeTD() {
			var newTD = doc.createElement("td");
			newTD.innerHTML = "&nbsp;";
		}

		function getColRowSpan(td) {
			var colspan = kampungan.getAttrib(td, "colspan");
			var rowspan = kampungan.getAttrib(td, "rowspan");

			colspan = colspan == "" ? 1 : parseInt(colspan);
			rowspan = rowspan == "" ? 1 : parseInt(rowspan);

			return {colspan : colspan, rowspan : rowspan};
		}

		function getCellPos(grid, td) {
			for (var y=0; y<grid.length; y++) {
				for (var x=0; x<grid[y].length; x++) {
					if (grid[y][x] == td)
						return {cellindex : x, rowindex : y};
				}
			}

			return null;
		}

		function getCell(grid, row, col) {
			if (grid[row] && grid[row][col])
				return grid[row][col];

			return null;
		}

		function getTableGrid(table) {
			var grid = new Array();
			var rows = table.rows;

			for (var y=0; y<rows.length; y++) {
				for (var x=0; x<rows[y].cells.length; x++) {
					var td = rows[y].cells[x];
					var sd = getColRowSpan(td);

					// All ready filled
					for (xstart = x; grid[y] && grid[y][xstart]; xstart++) ;

					// Fill box
					for (var y2=y; y2<y+sd['rowspan']; y2++) {
						if (!grid[y2])
							grid[y2] = new Array();

						for (var x2=xstart; x2<xstart+sd['colspan']; x2++) {
							grid[y2][x2] = td;
						}
					}
				}
			}

			return grid;
		}

		function trimRow(table, tr, td, new_tr) {
			var grid = getTableGrid(table);
			var cpos = getCellPos(grid, td);

			// Time to crop away some
			if (new_tr.cells.length != tr.childNodes.length) {
				var cells = tr.childNodes;
				var lastElm = null;

				for (var x=0; td = getCell(grid, cpos.rowindex, x); x++) {
					var remove = true;
					var sd = getColRowSpan(td);

					// Remove due to rowspan
					if (inArray(cells, td)) {
						new_tr.childNodes[x]._delete = true;
					} else if ((lastElm == null || td != lastElm) && sd.colspan > 1) { // Remove due to colspan
						for (var i=x; i<x+td.colSpan; i++)
							new_tr.childNodes[i]._delete = true;
					}

					if ((lastElm == null || td != lastElm) && sd.rowspan > 1)
						td.rowSpan = sd.rowspan + 1;

					lastElm = td;
				}

				deleteMarked(tableElm);
			}
		}

		function prevElm(node, name) {
			while ((node = node.previousSibling) != null) {
				if (node.nodeName == name)
					return node;
			}

			return null;
		}

		function nextElm(node, names) {
			var namesAr = names.split(',');

			while ((node = node.nextSibling) != null) {
				for (var i=0; i<namesAr.length; i++) {
					if (node.nodeName.toLowerCase() == namesAr[i].toLowerCase() )
						return node;
				}
			}

			return null;
		}

		function deleteMarked(tbl) {
			if (tbl.rows == 0)
				return;

			var tr = tbl.rows[0];
			do {
				var next = nextElm(tr, "TR");

				// Delete row
				if (tr._delete) {
					tr.parentNode.removeChild(tr);
					continue;
				}

				// Delete cells
				var td = tr.cells[0];
				if (td.cells > 1) {
					do {
						var nexttd = nextElm(td, "TD,TH");

						if (td._delete)
							td.parentNode.removeChild(td);
					} while ((td = nexttd) != null);
				}
			} while ((tr = next) != null);
		}

		function addRows(td_elm, tr_elm, rowspan) {
			// Add rows
			td_elm.rowSpan = 1;
			var trNext = nextElm(tr_elm, "TR");
			for (var i=1; i<rowspan && trNext; i++) {
				var newTD = doc.createElement("td");
				newTD.innerHTML = "&nbsp;";

				if (kampungan.isMSIE)
					trNext.insertBefore(newTD, trNext.cells(td_elm.cellIndex));
				else
					trNext.insertBefore(newTD, trNext.cells[td_elm.cellIndex]);

				trNext = nextElm(trNext, "TR");
			}
		}

		function copyRow(doc, table, tr) {
			var grid = getTableGrid(table);
			var newTR = tr.cloneNode(false);
			var cpos = getCellPos(grid, tr.cells[0]);
			var lastCell = null;
			var tableBorder = kampungan.getAttrib(table, "border");
			var tdElm = null;

			for (var x=0; tdElm = getCell(grid, cpos.rowindex, x); x++) {
				var newTD = null;

				if (lastCell != tdElm) {
					for (var i=0; i<tr.cells.length; i++) {
						if (tdElm == tr.cells[i]) {
							newTD = tdElm.cloneNode(true);
							break;
						}
					}
				}

				if (newTD == null) {
					newTD = doc.createElement("td");
					newTD.innerHTML = "&nbsp;";
				}

				// Reset col/row span
				newTD.colSpan = 1;
				newTD.rowSpan = 1;

				newTR.appendChild(newTD);

				lastCell = tdElm;
			}

			return newTR;
		}

		// ---- Commands -----

		// Handle commands
		switch (command) {
			case "mceTableRowProps":
				if (trElm == null)
					return true;

				if (user_interface) {
					// Setup template
					var template = new Array();

					template['file'] = '../../plugins/table/row.htm';
					template['width'] = 380;
					template['height'] = 295;

					// Language specific width and height addons
					template['width'] += kampungan.getLang('lang_table_rowprops_delta_width', 0);
					template['height'] += kampungan.getLang('lang_table_rowprops_delta_height', 0);

					// Open window
					kampungan.openWindow(template, {editor_id : inst.editorId, inline : "yes"});
				}

				return true;

			case "mceTableCellProps":
				if (tdElm == null)
					return true;

				if (user_interface) {
					// Setup template
					var template = new Array();

					template['file'] = '../../plugins/table/cell.htm';
					template['width'] = 380;
					template['height'] = 295;

					// Language specific width and height addons
					template['width'] += kampungan.getLang('lang_table_cellprops_delta_width', 0);
					template['height'] += kampungan.getLang('lang_table_cellprops_delta_height', 0);

					// Open window
					kampungan.openWindow(template, {editor_id : inst.editorId, inline : "yes"});
				}

				return true;

			case "mceInsertTable":
				if (user_interface) {
					// Setup template
					var template = new Array();

					template['file'] = '../../plugins/table/table.htm';
					template['width'] = 380;
					template['height'] = 295;

					// Language specific width and height addons
					template['width'] += kampungan.getLang('lang_table_table_delta_width', 0);
					template['height'] += kampungan.getLang('lang_table_table_delta_height', 0);

					// Open window
					kampungan.openWindow(template, {editor_id : inst.editorId, inline : "yes", action : value});
				}

				return true;

			case "mceTableDelete":
				var table = kampungan.getParentElement(inst.getFocusElement(), "table");
				if (table) {
					table.parentNode.removeChild(table);
					inst.repaint();
				}
				return true;

			case "mceTableSplitCells":
			case "mceTableMergeCells":
			case "mceTableInsertRowBefore":
			case "mceTableInsertRowAfter":
			case "mceTableDeleteRow":
			case "mceTableInsertColBefore":
			case "mceTableInsertColAfter":
			case "mceTableDeleteCol":
			case "mceTableCutRow":
			case "mceTableCopyRow":
			case "mceTablePasteRowBefore":
			case "mceTablePasteRowAfter":
				// No table just return (invalid command)
				if (!tableElm)
					return true;

				// Table has a tbody use that reference
				// Changed logic by ApTest 2005.07.12 (www.aptest.com)
				// Now lookk at the focused element and take its parentNode.  That will be a tbody or a table.
				if (tableElm != trElm.parentNode)
					tableElm = trElm.parentNode;

				if (tableElm && trElm) {
					switch (command) {
						case "mceTableInsertRowBefore":
							if (!trElm || !tdElm)
								return true;

							var grid = getTableGrid(tableElm);
							var cpos = getCellPos(grid, tdElm);
							var newTR = doc.createElement("tr");
							var lastTDElm = null;

							cpos.rowindex--;
							if (cpos.rowindex < 0)
								cpos.rowindex = 0;

							// Create cells
							for (var x=0; tdElm = getCell(grid, cpos.rowindex, x); x++) {
								if (tdElm != lastTDElm) {
									var sd = getColRowSpan(tdElm);

									if (sd['rowspan'] == 1) {
										var newTD = doc.createElement("td");

										newTD.innerHTML = "&nbsp;";
										newTD.colSpan = tdElm.colSpan;

										newTR.appendChild(newTD);
									} else
										tdElm.rowSpan = sd['rowspan'] + 1;

									lastTDElm = tdElm;
								}
							}

							trElm.parentNode.insertBefore(newTR, trElm);
						break;

						case "mceTableCutRow":
							if (!trElm || !tdElm)
								return true;

							inst.tableRowClipboard = copyRow(doc, tableElm, trElm);
							inst.execCommand("mceTableDeleteRow");
							break;

						case "mceTableCopyRow":
							if (!trElm || !tdElm)
								return true;

							inst.tableRowClipboard = copyRow(doc, tableElm, trElm);
							break;

						case "mceTablePasteRowBefore":
							if (!trElm || !tdElm)
								return true;

							var newTR = inst.tableRowClipboard.cloneNode(true);

							var prevTR = prevElm(trElm, "TR");
							if (prevTR != null)
								trimRow(tableElm, prevTR, prevTR.cells[0], newTR);

							trElm.parentNode.insertBefore(newTR, trElm);
							break;

						case "mceTablePasteRowAfter":
							if (!trElm || !tdElm)
								return true;
							
							var nextTR = nextElm(trElm, "TR");
							var newTR = inst.tableRowClipboard.cloneNode(true);

							trimRow(tableElm, trElm, tdElm, newTR);

							if (nextTR == null)
								trElm.parentNode.appendChild(newTR);
							else
								nextTR.parentNode.insertBefore(newTR, nextTR);

							break;

						case "mceTableInsertRowAfter":
							if (!trElm || !tdElm)
								return true;

							var grid = getTableGrid(tableElm);
							var cpos = getCellPos(grid, tdElm);
							var newTR = doc.createElement("tr");
							var lastTDElm = null;

							// Create cells
							for (var x=0; tdElm = getCell(grid, cpos.rowindex, x); x++) {
								if (tdElm != lastTDElm) {
									var sd = getColRowSpan(tdElm);

									if (sd['rowspan'] == 1) {
										var newTD = doc.createElement("td");

										newTD.innerHTML = "&nbsp;";
										newTD.colSpan = tdElm.colSpan;

										newTR.appendChild(newTD);
									} else
										tdElm.rowSpan = sd['rowspan'] + 1;

									lastTDElm = tdElm;
								}
							}

							if (newTR.hasChildNodes()) {
								var nextTR = nextElm(trElm, "TR");
								if (nextTR)
									nextTR.parentNode.insertBefore(newTR, nextTR);
								else
									tableElm.appendChild(newTR);
							}
						break;

						case "mceTableDeleteRow":
							if (!trElm || !tdElm)
								return true;
		
							var grid = getTableGrid(tableElm);
							var cpos = getCellPos(grid, tdElm);

							// Only one row, remove whole table
							if (grid.length == 1) {
								tableElm.parentNode.removeChild(tableElm);
								return true;
							}

							// Move down row spanned cells
							var cells = trElm.cells;
							var nextTR = nextElm(trElm, "TR");
							for (var x=0; x<cells.length; x++) {
								if (cells[x].rowSpan > 1) {
									var newTD = cells[x].cloneNode(true);
									var sd = getColRowSpan(cells[x]);

									newTD.rowSpan = sd.rowspan - 1;

									var nextTD = nextTR.cells[x];

									if (nextTD == null)
										nextTR.appendChild(newTD);
									else
										nextTR.insertBefore(newTD, nextTD);
								}
							}

							// Delete cells
							var lastTDElm = null;
							for (var x=0; tdElm = getCell(grid, cpos.rowindex, x); x++) {
								if (tdElm != lastTDElm) {
									var sd = getColRowSpan(tdElm);

									if (sd.rowspan > 1) {
										tdElm.rowSpan = sd.rowspan - 1;
									} else {
										trElm = tdElm.parentNode;

										if (trElm.parentNode)
											trElm._delete = true;
									}

									lastTDElm = tdElm;
								}
							}

							deleteMarked(tableElm);

							cpos.rowindex--;
							if (cpos.rowindex < 0)
								cpos.rowindex = 0;

							inst.selection.selectNode(getCell(grid, cpos.rowindex, 0), true, true);
						break;

						case "mceTableInsertColBefore":
							if (!trElm || !tdElm)
								return true;

							var grid = getTableGrid(tableElm);
							var cpos = getCellPos(grid, tdElm);
							var lastTDElm = null;

							for (var y=0; tdElm = getCell(grid, y, cpos.cellindex); y++) {
								if (tdElm != lastTDElm) {
									var sd = getColRowSpan(tdElm);

									if (sd['colspan'] == 1) {
										var newTD = doc.createElement(tdElm.nodeName);

										newTD.innerHTML = "&nbsp;";
										newTD.rowSpan = tdElm.rowSpan;

										tdElm.parentNode.insertBefore(newTD, tdElm);
									} else
										tdElm.colSpan++;

									lastTDElm = tdElm;
								}
							}
						break;

						case "mceTableInsertColAfter":
							if (!trElm || !tdElm)
								return true;

							var grid = getTableGrid(tableElm);
							var cpos = getCellPos(grid, tdElm);
							var lastTDElm = null;

							for (var y=0; tdElm = getCell(grid, y, cpos.cellindex); y++) {
								if (tdElm != lastTDElm) {
									var sd = getColRowSpan(tdElm);

									if (sd['colspan'] == 1) {
										var newTD = doc.createElement(tdElm.nodeName);

										newTD.innerHTML = "&nbsp;";
										newTD.rowSpan = tdElm.rowSpan;

										var nextTD = nextElm(tdElm, "TD,TH");
										if (nextTD == null)
											tdElm.parentNode.appendChild(newTD);
										else
											nextTD.parentNode.insertBefore(newTD, nextTD);
									} else
										tdElm.colSpan++;

									lastTDElm = tdElm;
								}
							}
						break;

						case "mceTableDeleteCol":
							if (!trElm || !tdElm)
								return true;

							var grid = getTableGrid(tableElm);
							var cpos = getCellPos(grid, tdElm);
							var lastTDElm = null;

							// Only one col, remove whole table
							if (grid.length > 1 && grid[0].length <= 1) {
								tableElm.parentNode.removeChild(tableElm);
								return true;
							}

							// Delete cells
							for (var y=0; tdElm = getCell(grid, y, cpos.cellindex); y++) {
								if (tdElm != lastTDElm) {
									var sd = getColRowSpan(tdElm);

									if (sd['colspan'] > 1)
										tdElm.colSpan = sd['colspan'] - 1;
									else {
										if (tdElm.parentNode)
											tdElm.parentNode.removeChild(tdElm);
									}

									lastTDElm = tdElm;
								}
							}

							cpos.cellindex--;
							if (cpos.cellindex < 0)
								cpos.cellindex = 0;

							inst.selection.selectNode(getCell(grid, 0, cpos.cellindex), true, true);
						break;

					case "mceTableSplitCells":
						if (!trElm || !tdElm)
							return true;

						var spandata = getColRowSpan(tdElm);

						var colspan = spandata["colspan"];
						var rowspan = spandata["rowspan"];

						// Needs splitting
						if (colspan > 1 || rowspan > 1) {
							// Generate cols
							tdElm.colSpan = 1;
							for (var i=1; i<colspan; i++) {
								var newTD = doc.createElement("td");

								newTD.innerHTML = "&nbsp;";

								trElm.insertBefore(newTD, nextElm(tdElm, "TD,TH"));

								if (rowspan > 1)
									addRows(newTD, trElm, rowspan);
							}

							addRows(tdElm, trElm, rowspan);
						}

						// Apply visual aids
						tableElm = kampungan.getParentElement(inst.getFocusElement(), "table");
						break;

					case "mceTableMergeCells":
						var rows = new Array();
						var sel = inst.getSel();
						var grid = getTableGrid(tableElm);

						if (kampungan.isMSIE || sel.rangeCount == 1) {
							if (user_interface) {
								// Setup template
								var template = new Array();
								var sp = getColRowSpan(tdElm);

								template['file'] = '../../plugins/table/merge_cells.htm';
								template['width'] = 250;
								template['height'] = 105 + (kampungan.isNS7 ? 25 : 0);

								// Language specific width and height addons
								template['width'] += kampungan.getLang('lang_table_merge_cells_delta_width', 0);
								template['height'] += kampungan.getLang('lang_table_merge_cells_delta_height', 0);

								// Open window
								kampungan.openWindow(template, {editor_id : inst.editorId, inline : "yes", action : "update", numcols : sp.colspan, numrows : sp.rowspan});

								return true;
							} else {
								var numRows = parseInt(value['numrows']);
								var numCols = parseInt(value['numcols']);
								var cpos = getCellPos(grid, tdElm);

								if (("" + numRows) == "NaN")
									numRows = 1;

								if (("" + numCols) == "NaN")
									numCols = 1;

								// Get rows and cells
								var tRows = tableElm.rows;
								for (var y=cpos.rowindex; y<grid.length; y++) {
									var rowCells = new Array();

									for (var x=cpos.cellindex; x<grid[y].length; x++) {
										var td = getCell(grid, y, x);

										if (td && !inArray(rows, td) && !inArray(rowCells, td)) {
											var cp = getCellPos(grid, td);

											// Within range
											if (cp.cellindex < cpos.cellindex+numCols && cp.rowindex < cpos.rowindex+numRows)
												rowCells[rowCells.length] = td;
										}
									}

									if (rowCells.length > 0)
										rows[rows.length] = rowCells;
								}

								//return true;
							}
						} else {
							var cells = new Array();
							var sel = inst.getSel();
							var lastTR = null;
							var curRow = null;
							var x1 = -1, y1 = -1, x2, y2;

							// Only one cell selected, whats the point?
							if (sel.rangeCount < 2)
								return true;

							// Get all selected cells
							for (var i=0; i<sel.rangeCount; i++) {
								var rng = sel.getRangeAt(i);
								var tdElm = rng.startContainer.childNodes[rng.startOffset];

								if (!tdElm)
									break;

								if (tdElm.nodeName == "TD")
									cells[cells.length] = tdElm;
							}

							// Get rows and cells
							var tRows = tableElm.rows;
							for (var y=0; y<tRows.length; y++) {
								var rowCells = new Array();

								for (var x=0; x<tRows[y].cells.length; x++) {
									var td = tRows[y].cells[x];

									for (var i=0; i<cells.length; i++) {
										if (td == cells[i]) {
											rowCells[rowCells.length] = td;
										}
									}
								}

								if (rowCells.length > 0)
									rows[rows.length] = rowCells;
							}

							// Find selected cells in grid and box
							var curRow = new Array();
							var lastTR = null;
							for (var y=0; y<grid.length; y++) {
								for (var x=0; x<grid[y].length; x++) {
									grid[y][x]._selected = false;

									for (var i=0; i<cells.length; i++) {
										if (grid[y][x] == cells[i]) {
											// Get start pos
											if (x1 == -1) {
												x1 = x;
												y1 = y;
											}

											// Get end pos
											x2 = x;
											y2 = y;

											grid[y][x]._selected = true;
										}
									}
								}
							}

							// Is there gaps, if so deny
							for (var y=y1; y<=y2; y++) {
								for (var x=x1; x<=x2; x++) {
									if (!grid[y][x]._selected) {
										alert("Invalid selection for merge.");
										return true;
									}
								}
							}
						}

						// Validate selection and get total rowspan and colspan
						var rowSpan = 1, colSpan = 1;

						// Validate horizontal and get total colspan
						var lastRowSpan = -1;
						for (var y=0; y<rows.length; y++) {
							var rowColSpan = 0;

							for (var x=0; x<rows[y].length; x++) {
								var sd = getColRowSpan(rows[y][x]);

								rowColSpan += sd['colspan'];

								if (lastRowSpan != -1 && sd['rowspan'] != lastRowSpan) {
									alert("Invalid selection for merge.");
									return true;
								}

								lastRowSpan = sd['rowspan'];
							}

							if (rowColSpan > colSpan)
								colSpan = rowColSpan;

							lastRowSpan = -1;
						}

						// Validate vertical and get total rowspan
						var lastColSpan = -1;
						for (var x=0; x<rows[0].length; x++) {
							var colRowSpan = 0;

							for (var y=0; y<rows.length; y++) {
								var sd = getColRowSpan(rows[y][x]);

								colRowSpan += sd['rowspan'];

								if (lastColSpan != -1 && sd['colspan'] != lastColSpan) {
									alert("Invalid selection for merge.");
									return true;
								}

								lastColSpan = sd['colspan'];
							}

							if (colRowSpan > rowSpan)
								rowSpan = colRowSpan;

							lastColSpan = -1;
						}

						// Setup td
						tdElm = rows[0][0];
						tdElm.rowSpan = rowSpan;
						tdElm.colSpan = colSpan;

						// Merge cells
						for (var y=0; y<rows.length; y++) {
							for (var x=0; x<rows[y].length; x++) {
								var html = rows[y][x].innerHTML;
								var chk = kampungan.regexpReplace(html, "[ \t\r\n]", "");

								if (chk != "<br/>" && chk != "<br>" && chk != "&nbsp;" && (x+y > 0))
									tdElm.innerHTML += html;

								// Not current cell
								if (rows[y][x] != tdElm && !rows[y][x]._deleted) {
									var cpos = getCellPos(grid, rows[y][x]);
									var tr = rows[y][x].parentNode;

									tr.removeChild(rows[y][x]);
									rows[y][x]._deleted = true;

									// Empty TR, remove it
									if (!tr.hasChildNodes()) {
										tr.parentNode.removeChild(tr);

										var lastCell = null;
										for (var x=0; cellElm = getCell(grid, cpos.rowindex, x); x++) {
											if (cellElm != lastCell && cellElm.rowSpan > 1)
												cellElm.rowSpan--;

											lastCell = cellElm;
										}

										if (tdElm.rowSpan > 1)
											tdElm.rowSpan--;
									}
								}
							}
						}

						break;
					}

					tableElm = kampungan.getParentElement(inst.getFocusElement(), "table");
					kampungan.handleVisualAid(tableElm, true, kampungan.settings['visual'], kampungan.selectedInstance);
					kampungan.triggerNodeChange();
					inst.repaint();
				}

			return true;
		}

		// Pass to next handler in chain
		return false;
	}
};

kampungan.addPlugin("table", kampungan_TablePlugin);
