/**
 * $RCSfile: editor_plugin_src.js,v $
 * $Revision: 1.31 $
 * $Date: 2006/05/03 10:46:41 $
 *
 * @author Moxiecode
 * @copyright Copyright � 2004-2006, Moxiecode Systems AB, All rights reserved.
 */

/* Import plugin specific language pack */
//kampungan.importPluginLanguagePack('contextmenu', 'en,tr,zh_cn,cs,fa,fr_ca,fr,de,nb');
if (!kampungan.settings['contextmenu_skip_plugin_css']) {
	kampungan.loadCSS(kampungan.baseURL + "/plugins/contextmenu/css/contextmenu.css");
}

var kampungan_ContextMenuPlugin = {
	// Private fields
	_contextMenu : null,

	getInfo : function() {
		return {
			longname : 'Context menus',
			author : 'Moxiecode Systems',
			authorurl : 'http://kampungan.moxiecode.com',
			infourl : 'http://kampungan.moxiecode.com/kampungan/docs/plugin_contextmenu.html',
			version : kampungan.majorVersion + "." + kampungan.minorVersion
		};
	},

	initInstance : function(inst) {
		// Is not working on MSIE 5.0 or Opera no contextmenu event
		if (kampungan.isMSIE5_0 && kampungan.isOpera)
			return;

		kampungan_ContextMenuPlugin._contextMenu = new kampungan_ContextMenu({
			commandhandler : "kampungan_ContextMenuPlugin._commandHandler",
			spacer_image : kampungan.baseURL + "/plugins/contextmenu/images/spacer.gif"
		});

		// Add hide event handles
		kampungan.addEvent(inst.getDoc(), "click", kampungan_ContextMenuPlugin._hideContextMenu);
		kampungan.addEvent(inst.getDoc(), "keypress", kampungan_ContextMenuPlugin._hideContextMenu);
		kampungan.addEvent(inst.getDoc(), "keydown", kampungan_ContextMenuPlugin._hideContextMenu);
		kampungan.addEvent(document, "click", kampungan_ContextMenuPlugin._hideContextMenu);
		kampungan.addEvent(document, "keypress", kampungan_ContextMenuPlugin._hideContextMenu);
		kampungan.addEvent(document, "keydown", kampungan_ContextMenuPlugin._hideContextMenu);

		// Attach contextmenu event
		if (kampungan.isGecko) {
			kampungan.addEvent(inst.getDoc(), "contextmenu", function(e) {kampungan_ContextMenuPlugin._showContextMenu(kampungan.isMSIE ? inst.contentWindow.event : e, inst);});
		} else
			kampungan.addEvent(inst.getDoc(), "contextmenu", kampungan_ContextMenuPlugin._onContextMenu);
	},

	// Private plugin internal methods

	_onContextMenu : function(e) {
		var elm = kampungan.isMSIE ? e.srcElement : e.target;
		var targetInst, body;

		// Find instance
		if ((body = kampungan.getParentElement(elm, "body")) != null) {
			for (var n in kampungan.instances) {
				var inst = kampungan.instances[n];
				if (!kampungan.isInstance(inst))
					continue;

				if (body == inst.getBody()) {
					targetInst = inst;
					break;
				}
			}

			return kampungan_ContextMenuPlugin._showContextMenu(kampungan.isMSIE ? targetInst.contentWindow.event : e, targetInst);
		}
	},

	_showContextMenu : function(e, inst) {
		function getAttrib(elm, name) {
			return elm.getAttribute(name) ? elm.getAttribute(name) : "";
		}

		var x, y, elm, contextMenu;
		var pos = kampungan.getAbsPosition(inst.iframeElement);

		x = kampungan.isMSIE ? e.screenX : pos.absLeft + (e.pageX - inst.getBody().scrollLeft);
		y = kampungan.isMSIE ? e.screenY : pos.absTop + (e.pageY - inst.getBody().scrollTop);
		elm = kampungan.isMSIE ? e.srcElement : e.target;

		contextMenu = this._contextMenu;
		contextMenu.inst = inst;

		// Mozilla needs some time
		window.setTimeout(function () {
			var theme = kampungan.getParam("theme");

			contextMenu.clearAll();
			var sel = inst.selection.getSelectedText().length != 0 || elm.nodeName == "IMG";

			// Default items
			contextMenu.addItem(kampungan.baseURL + "/themes/" + theme + "/images/cut.gif", "$lang_cut_desc", "Cut", "", !sel);
			contextMenu.addItem(kampungan.baseURL + "/themes/" + theme + "/images/copy.gif", "$lang_copy_desc", "Copy", "", !sel);
			contextMenu.addItem(kampungan.baseURL + "/themes/" + theme + "/images/paste.gif", "$lang_paste_desc", "Paste", "", false);

			if (sel || (elm ? (elm.nodeName == 'A') || (elm.nodeName == 'IMG') : false)) {
				contextMenu.addSeparator();
				contextMenu.addItem(kampungan.baseURL + "/themes/advanced/images/link.gif", "$lang_link_desc", inst.hasPlugin("advlink") ? "mceAdvLink" : "mceLink");
				contextMenu.addItem(kampungan.baseURL + "/themes/advanced/images/unlink.gif", "$lang_unlink_desc", "unlink", "", (elm ? (elm.nodeName != 'A') && (elm.nodeName != 'IMG') : true));
			}

			// Get element
			elm = kampungan.getParentElement(elm, "img,table,td" + (inst.hasPlugin("advhr") ? ',hr' : ''));
			if (elm) {
				switch (elm.nodeName) {
					case "IMG":
						contextMenu.addSeparator();

						// If flash
						if (kampungan.getAttrib(elm, 'class').indexOf('mceItemFlash') != -1)
							contextMenu.addItem(kampungan.baseURL + "/plugins/flash/images/flash.gif", "$lang_flash_props", "mceFlash");
						else
							contextMenu.addItem(kampungan.baseURL + "/themes/" + theme + "/images/image.gif", "$lang_image_props_desc", inst.hasPlugin("advimage") ? "mceAdvImage" : "mceImage");
						break;

					case "HR":
						contextMenu.addSeparator();
						contextMenu.addItem(kampungan.baseURL + "/plugins/advhr/images/advhr.gif", "$lang_insert_advhr_desc", "mceAdvancedHr");
						break;

					case "TABLE":
					case "TD":
						// Is table plugin loaded
						if (inst.hasPlugin("table")) {
							var colspan = (elm.nodeName == "TABLE") ? "" : getAttrib(elm, "colspan");
							var rowspan = (elm.nodeName == "TABLE") ? "" : getAttrib(elm, "rowspan");

							colspan = colspan == "" ? "1" : colspan;
							rowspan = rowspan == "" ? "1" : rowspan;

							contextMenu.addSeparator();
							contextMenu.addItem(kampungan.baseURL + "/themes/" + theme + "/images/cut.gif", "$lang_table_cut_row_desc", "mceTableCutRow");
							contextMenu.addItem(kampungan.baseURL + "/themes/" + theme + "/images/copy.gif", "$lang_table_copy_row_desc", "mceTableCopyRow");
							contextMenu.addItem(kampungan.baseURL + "/themes/" + theme + "/images/paste.gif", "$lang_table_paste_row_before_desc", "mceTablePasteRowBefore", "", inst.tableRowClipboard == null);
							contextMenu.addItem(kampungan.baseURL + "/themes/" + theme + "/images/paste.gif", "$lang_table_paste_row_after_desc", "mceTablePasteRowAfter", "", inst.tableRowClipboard == null);

	/*						contextMenu.addItem(kampungan.baseURL + "/themes/" + theme + "/images/justifyleft.gif", "$lang_justifyleft_desc", "JustifyLeft", "", false);
							contextMenu.addItem(kampungan.baseURL + "/themes/" + theme + "/images/justifycenter.gif", "$lang_justifycenter_desc", "JustifyCenter", "", false);
							contextMenu.addItem(kampungan.baseURL + "/themes/" + theme + "/images/justifyright.gif", "$lang_justifyright_desc", "JustifyRight", "", false);
							contextMenu.addItem(kampungan.baseURL + "/themes/" + theme + "/images/justifyfull.gif", "$lang_justifyfull_desc", "JustifyFull", "", false);*/
							contextMenu.addSeparator();
							contextMenu.addItem(kampungan.baseURL + "/plugins/table/images/table.gif", "$lang_table_desc", "mceInsertTable", "insert");
							contextMenu.addItem(kampungan.baseURL + "/plugins/table/images/table.gif", "$lang_table_props_desc", "mceInsertTable");
							contextMenu.addItem(kampungan.baseURL + "/plugins/table/images/table_cell_props.gif", "$lang_table_cell_desc", "mceTableCellProps");
							contextMenu.addItem(kampungan.baseURL + "/plugins/table/images/table_delete.gif", "$lang_table_del", "mceTableDelete");
							contextMenu.addSeparator();
							contextMenu.addItem(kampungan.baseURL + "/plugins/table/images/table_row_props.gif", "$lang_table_row_desc", "mceTableRowProps");
							contextMenu.addItem(kampungan.baseURL + "/plugins/table/images/table_insert_row_before.gif", "$lang_table_row_before_desc", "mceTableInsertRowBefore");
							contextMenu.addItem(kampungan.baseURL + "/plugins/table/images/table_insert_row_after.gif", "$lang_table_row_after_desc", "mceTableInsertRowAfter");
							contextMenu.addItem(kampungan.baseURL + "/plugins/table/images/table_delete_row.gif", "$lang_table_delete_row_desc", "mceTableDeleteRow");
							contextMenu.addSeparator();
							contextMenu.addItem(kampungan.baseURL + "/plugins/table/images/table_insert_col_before.gif", "$lang_table_col_before_desc", "mceTableInsertColBefore");
							contextMenu.addItem(kampungan.baseURL + "/plugins/table/images/table_insert_col_after.gif", "$lang_table_col_after_desc", "mceTableInsertColAfter");
							contextMenu.addItem(kampungan.baseURL + "/plugins/table/images/table_delete_col.gif", "$lang_table_delete_col_desc", "mceTableDeleteCol");
							contextMenu.addSeparator();
							contextMenu.addItem(kampungan.baseURL + "/plugins/table/images/table_split_cells.gif", "$lang_table_split_cells_desc", "mceTableSplitCells", "", (colspan == "1" && rowspan == "1"));
							contextMenu.addItem(kampungan.baseURL + "/plugins/table/images/table_merge_cells.gif", "$lang_table_merge_cells_desc", "mceTableMergeCells", "", false);
						}
						break;
				}
			}  else {
				// Add table specific
				if (inst.hasPlugin("table")) {
					contextMenu.addSeparator();
					contextMenu.addItem(kampungan.baseURL + "/plugins/table/images/table.gif", "$lang_table_desc", "mceInsertTable", "insert");
				}
			}

			contextMenu.show(x, y);
		}, 10);

		// Cancel default handeling
		kampungan.cancelEvent(e);
		return false;
	},

	_hideContextMenu : function() {
		if (kampungan_ContextMenuPlugin._contextMenu)
			kampungan_ContextMenuPlugin._contextMenu.hide();
	},

	_commandHandler : function(command, value) {
		var cm = kampungan_ContextMenuPlugin._contextMenu;

		cm.hide();

		// UI must be true on these
		var ui = false;
		if (command == "mceInsertTable" || command == "mceTableCellProps" || command == "mceTableRowProps" || command == "mceTableMergeCells")
			ui = true;

		if (command == "Paste")
			value = null;

		if (kampungan.getParam("dialog_type") == "modal" && kampungan.isMSIE) {
			// Cell properties will generate access denied error is this isn't done?!
			window.setTimeout(function() {
				cm.inst.execCommand(command, ui, value);
			}, 100);
		} else
			cm.inst.execCommand(command, ui, value);
	}
};

kampungan.addPlugin("contextmenu", kampungan_ContextMenuPlugin);

// Context menu class

function kampungan_ContextMenu(settings) {
	// Default value function
	function defParam(key, def_val) {
		settings[key] = typeof(settings[key]) != "undefined" ? settings[key] : def_val;
	}

	var self = this;

	this.isMSIE = (navigator.appName == "Microsoft Internet Explorer");

	// Setup contextmenu div
	this.contextMenuDiv = document.createElement("div");
	this.contextMenuDiv.className = "contextMenu";
	this.contextMenuDiv.setAttribute("class", "contextMenu");
	this.contextMenuDiv.style.display = "none";
	this.contextMenuDiv.style.position = 'absolute';
	this.contextMenuDiv.style.zindex = 1000;
	this.contextMenuDiv.style.left = '0';
	this.contextMenuDiv.style.top = '0';
	this.contextMenuDiv.unselectable = "on";

	document.body.appendChild(this.contextMenuDiv);

	// Setup default values
	defParam("commandhandler", "");
	defParam("spacer_image", "images/spacer.gif");

	this.items = new Array();
	this.settings = settings;
	this.html = "";

	// IE Popup
	if (kampungan.isMSIE && !kampungan.isMSIE5_0 && !kampungan.isOpera) {
		this.pop = window.createPopup();
		doc = this.pop.document;
		doc.open();
		doc.write('<html><head><link href="' + kampungan.baseURL + '/plugins/contextmenu/css/contextmenu.css" rel="stylesheet" type="text/css" /></head><body unselectable="yes" class="contextMenuIEPopup"></body></html>');
		doc.close();
	}
};

kampungan_ContextMenu.prototype = {
	clearAll : function() {
		this.html = "";
		this.contextMenuDiv.innerHTML = "";
	},

	addSeparator : function() {
		this.html += '<tr class="contextMenuItem"><td class="contextMenuIcon"><img src="' + this.settings['spacer_image'] + '" width="20" height="1" class="contextMenuImage" /></td><td><img class="contextMenuSeparator" width="1" height="1" src="' + this.settings['spacer_image'] + '" /></td></tr>';
	},

	addItem : function(icon, title, command, value, disabled) {
		if (title.charAt(0) == '$')
			title = kampungan.getLang(title.substring(1));

		var onMouseDown = '';
		var html = '';

		if (kampungan.isMSIE && !kampungan.isMSIE5_0)
			onMouseDown = 'contextMenu.execCommand(\'' + command + '\', \'' + value + '\');return false;';
		else
			onMouseDown = this.settings['commandhandler'] + '(\'' + command + '\', \'' + value + '\');return false;';

		if (icon == "")
			icon = this.settings['spacer_image'];

		if (!disabled)
			html += '<tr class="contextMenuItem">';
		else
			html += '<tr class="contextMenuItemDisabled">';

		html += '<td class="contextMenuIcon"><img src="' + icon + '" width="20" height="20" class="contextMenuImage" /></td>';
		html += '<td><div class="contextMenuText">';
		html += '<a href="javascript:void(0);" onclick="' + onMouseDown + '" onmousedown="return false;">&#160;';

		// Add text
		html += title;

		html += '&#160;</a>';
		html += '</div></td>';
		html += '</tr>';

		// Add to main
		this.html += html;
	},

	show : function(x, y) {
		var vp, width, height;

		if (this.html == "")
			return;

		var html = '';

		html += '<a href="#"></a><table border="0" cellpadding="0" cellspacing="0">';
		html += this.html;
		html += '</table>';

		this.contextMenuDiv.innerHTML = html;

		// Get dimensions
		this.contextMenuDiv.style.display = "block";
		width = this.contextMenuDiv.offsetWidth;
		height = this.contextMenuDiv.offsetHeight;
		this.contextMenuDiv.style.display = "none";

		if (kampungan.isMSIE && !kampungan.isMSIE5_0 && !kampungan.isOpera) {
			// Setup popup and show
			this.pop.document.body.innerHTML = '<div class="contextMenu">' + html + "</div>";
			this.pop.document.kampungan = kampungan;
			this.pop.document.contextMenu = this;
			this.pop.show(x, y, width, height);
		} else {
			vp = this.getViewPort();

			this.contextMenuDiv.style.left = (x > vp.width - width ? vp.width - width : x) + 'px';
			this.contextMenuDiv.style.top = (y > vp.height - height ? vp.height - height : y) + 'px';
			this.contextMenuDiv.style.display = "block";
		}
	},

	getViewPort : function() {
		return {
			width : document.documentElement.offsetWidth || document.body.offsetWidth,
			height : self.innerHeight || document.documentElement.clientHeight || document.body.clientHeight
		};
	},

	hide : function() {
		if (kampungan.isMSIE && !kampungan.isMSIE5_0 && !kampungan.isOpera)
			this.pop.hide();
		else
			this.contextMenuDiv.style.display = "none";
	},

	execCommand : function(command, value) {
		eval(this.settings['commandhandler'] + "(command, value);");
	}
};
