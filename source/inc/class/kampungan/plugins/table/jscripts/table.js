var action, orgTableWidth, orgTableHeight;

function insertTable() {
	var formObj = document.forms[0];
	var inst = kampungan.selectedInstance;
	var cols = 2, rows = 2, border = 0, cellpadding = -1, cellspacing = -1, align, width, height, className;
	var html = '';
	var elm = kampungan.tableElm;
	var cellLimit, rowLimit, colLimit;

	kampunganPopup.restoreSelection();

	// Get form data
	cols = formObj.elements['cols'].value;
	rows = formObj.elements['rows'].value;
	border = formObj.elements['border'].value != "" ? formObj.elements['border'].value  : 0;
	cellpadding = formObj.elements['cellpadding'].value != "" ? formObj.elements['cellpadding'].value : "";
	cellspacing = formObj.elements['cellspacing'].value != "" ? formObj.elements['cellspacing'].value : "";
	align = formObj.elements['align'].options[formObj.elements['align'].selectedIndex].value;
	width = formObj.elements['width'].value;
	height = formObj.elements['height'].value;
	bordercolor = formObj.elements['bordercolor'].value;
	bgcolor = formObj.elements['bgcolor'].value;
	className = formObj.elements['class'].options[formObj.elements['class'].selectedIndex].value;
	id = formObj.elements['id'].value;
	summary = formObj.elements['summary'].value;
	style = formObj.elements['style'].value;
	dir = formObj.elements['dir'].value;
	lang = formObj.elements['lang'].value;
	background = formObj.elements['backgroundimage'].value;

	cellLimit = kampungan.getParam('table_cell_limit', false);
	rowLimit = kampungan.getParam('table_row_limit', false);
	colLimit = kampungan.getParam('table_col_limit', false);

	// Validate table size
	if (colLimit && cols > colLimit) {
		alert(kampungan.getLang('lang_table_col_limit', '', true, {cols : colLimit}));
		return false;
	} else if (rowLimit && rows > rowLimit) {
		alert(kampungan.getLang('lang_table_row_limit', '', true, {rows : rowLimit}));
		return false;
	} else if (cellLimit && cols * rows > cellLimit) {
		alert(kampungan.getLang('lang_table_cell_limit', '', true, {cells : cellLimit}));
		return false;
	}

	// Update table
	if (action == "update") {
		inst.execCommand('mceBeginUndoLevel');

		kampungan.setAttrib(elm, 'cellPadding', cellpadding, true);
		kampungan.setAttrib(elm, 'cellSpacing', cellspacing, true);
		kampungan.setAttrib(elm, 'border', border, true);
		kampungan.setAttrib(elm, 'align', align);
		kampungan.setAttrib(elm, 'class', className);
		kampungan.setAttrib(elm, 'style', style);
		kampungan.setAttrib(elm, 'id', id);
		kampungan.setAttrib(elm, 'summary', summary);
		kampungan.setAttrib(elm, 'dir', dir);
		kampungan.setAttrib(elm, 'lang', lang);

		// Not inline styles
		if (!kampungan.getParam("inline_styles"))
			kampungan.setAttrib(elm, 'width', width, true);

		// Remove these since they are not valid XHTML
		kampungan.setAttrib(elm, 'borderColor', '');
		kampungan.setAttrib(elm, 'bgColor', '');
		kampungan.setAttrib(elm, 'background', '');
		kampungan.setAttrib(elm, 'height', '');

		if (background != '')
			elm.style.backgroundImage = "url('" + background + "')";
		else
			elm.style.backgroundImage = '';

		if (kampungan.getParam("inline_styles"))
			elm.style.borderWidth = border + "px";

		if (kampungan.getParam("inline_styles")) {
			if (width != '')
				elm.style.width = getCSSSize(width);
		}

		if (bordercolor != "") {
			elm.style.borderColor = bordercolor;
			elm.style.borderStyle = elm.style.borderStyle == "" ? "solid" : elm.style.borderStyle;
			elm.style.borderWidth = border == "" ? "1px" : border;
		} else
			elm.style.borderColor = '';

		elm.style.backgroundColor = bgcolor;
		elm.style.height = getCSSSize(height);

		kampungan.handleVisualAid(kampungan.tableElm, false, inst.visualAid, inst);

		// Fix for stange MSIE align bug
		kampungan.tableElm.outerHTML = kampungan.tableElm.outerHTML;

		kampungan.handleVisualAid(inst.getBody(), true, inst.visualAid, inst);
		kampungan.triggerNodeChange();
		inst.execCommand('mceEndUndoLevel');

		// Repaint if dimensions changed
		if (formObj.width.value != orgTableWidth || formObj.height.value != orgTableHeight)
			inst.repaint();

		kampunganPopup.close();
		return true;
	}

	// Create new table
	html += '<table';

	html += makeAttrib('id', id);
	html += makeAttrib('border', border);
	html += makeAttrib('cellpadding', cellpadding);
	html += makeAttrib('cellspacing', cellspacing);
	html += makeAttrib('width', width);
	//html += makeAttrib('height', height);
	//html += makeAttrib('bordercolor', bordercolor);
	//html += makeAttrib('bgcolor', bgcolor);
	html += makeAttrib('align', align);
	html += makeAttrib('class', kampungan.getVisualAidClass(className, border == 0));
	html += makeAttrib('style', style);
	html += makeAttrib('summary', summary);
	html += makeAttrib('dir', dir);
	html += makeAttrib('lang', lang);

	html += '>';

	for (var y=0; y<rows; y++) {
		html += "<tr>";

		for (var x=0; x<cols; x++)
			html += '<td>&nbsp;</td>';

		html += "</tr>";
	}

	html += "</table>";

	inst.execCommand('mceBeginUndoLevel');
	inst.execCommand('mceInsertContent', false, html);
	kampungan.handleVisualAid(inst.getBody(), true, kampungan.settings['visual']);
	inst.execCommand('mceEndUndoLevel');

	kampunganPopup.close();
}

function makeAttrib(attrib, value) {
	var formObj = document.forms[0];
	var valueElm = formObj.elements[attrib];

	if (typeof(value) == "undefined" || value == null) {
		value = "";

		if (valueElm)
			value = valueElm.value;
	}

	if (value == "")
		return "";

	// XML encode it
	value = value.replace(/&/g, '&amp;');
	value = value.replace(/\"/g, '&quot;');
	value = value.replace(/</g, '&lt;');
	value = value.replace(/>/g, '&gt;');

	return ' ' + attrib + '="' + value + '"';
}

function init() {
	kampunganPopup.resizeToInnerSize();

	document.getElementById('backgroundimagebrowsercontainer').innerHTML = getBrowserHTML('backgroundimagebrowser','backgroundimage','image','table');
	document.getElementById('backgroundimagebrowsercontainer').innerHTML = getBrowserHTML('backgroundimagebrowser','backgroundimage','image','table');
	document.getElementById('bordercolor_pickcontainer').innerHTML = getColorPickerHTML('bordercolor_pick','bordercolor');
	document.getElementById('bgcolor_pickcontainer').innerHTML = getColorPickerHTML('bgcolor_pick','bgcolor');

	var cols = 2, rows = 2, border = 0, cellpadding = "", cellspacing = "";
	var align = "", width = "", height = "", bordercolor = "", bgcolor = "", className = "";
	var id = "", summary = "", style = "", dir = "", lang = "", background = "", bgcolor = "", bordercolor = "";
	var inst = kampungan.selectedInstance;
	var formObj = document.forms[0];
	var elm = kampungan.getParentElement(inst.getFocusElement(), "table");

	kampungan.tableElm = elm;
	action = kampungan.getWindowArg('action');
	if (action == null)
		action = kampungan.tableElm ? "update" : "insert";

	if (kampungan.tableElm && action != "insert") {
		var rowsAr = kampungan.tableElm.rows;
		var cols = 0;
		for (var i=0; i<rowsAr.length; i++)
			if (rowsAr[i].cells.length > cols)
				cols = rowsAr[i].cells.length;

		cols = cols;
		rows = rowsAr.length;

		st = kampungan.parseStyle(kampungan.getAttrib(kampungan.tableElm, "style"));
		border = trimSize(getStyle(elm, 'border', 'borderWidth'));
		cellpadding = kampungan.getAttrib(kampungan.tableElm, 'cellpadding', "");
		cellspacing = kampungan.getAttrib(kampungan.tableElm, 'cellspacing', "");
		width = trimSize(getStyle(elm, 'width', 'width'));
		height = trimSize(getStyle(elm, 'height', 'height'));
		bordercolor = convertRGBToHex(getStyle(elm, 'bordercolor', 'borderLeftColor'));
		bgcolor = convertRGBToHex(getStyle(elm, 'bgcolor', 'backgroundColor'));
		align = kampungan.getAttrib(kampungan.tableElm, 'align', align);
		className = kampungan.getVisualAidClass(kampungan.getAttrib(kampungan.tableElm, 'class'), false);
		id = kampungan.getAttrib(kampungan.tableElm, 'id');
		summary = kampungan.getAttrib(kampungan.tableElm, 'summary');
		style = kampungan.serializeStyle(st);
		dir = kampungan.getAttrib(kampungan.tableElm, 'dir');
		lang = kampungan.getAttrib(kampungan.tableElm, 'lang');
		background = getStyle(elm, 'background', 'backgroundImage').replace(new RegExp("url\\('?([^']*)'?\\)", 'gi'), "$1");

		orgTableWidth = width;
		orgTableHeight = height;

		action = "update";
	}

	addClassesToList('class', "table_styles");

	// Update form
	selectByValue(formObj, 'align', align);
	selectByValue(formObj, 'class', className);
	formObj.cols.value = cols;
	formObj.rows.value = rows;
	formObj.border.value = border;
	formObj.cellpadding.value = cellpadding;
	formObj.cellspacing.value = cellspacing;
	formObj.width.value = width;
	formObj.height.value = height;
	formObj.bordercolor.value = bordercolor;
	formObj.bgcolor.value = bgcolor;
	formObj.id.value = id;
	formObj.summary.value = summary;
	formObj.style.value = style;
	formObj.dir.value = dir;
	formObj.lang.value = lang;
	formObj.backgroundimage.value = background;
	formObj.insert.value = kampungan.getLang('lang_' + action, 'Insert', true); 

	updateColor('bordercolor_pick', 'bordercolor');
	updateColor('bgcolor_pick', 'bgcolor');

	// Resize some elements
	if (isVisible('backgroundimagebrowser'))
		document.getElementById('backgroundimage').style.width = '180px';

	// Disable some fields in update mode
	if (action == "update") {
		formObj.cols.disabled = true;
		formObj.rows.disabled = true;
	}
}

function changedSize() {
	var formObj = document.forms[0];
	var st = kampungan.parseStyle(formObj.style.value);

	var width = formObj.width.value;
	if (width != "")
		st['width'] = kampungan.getParam("inline_styles") ? getCSSSize(width) : "";
	else
		st['width'] = "";

	var height = formObj.height.value;
	if (height != "")
		st['height'] = getCSSSize(height);
	else
		st['height'] = "";

	formObj.style.value = kampungan.serializeStyle(st);
}

function changedBackgroundImage() {
	var formObj = document.forms[0];
	var st = kampungan.parseStyle(formObj.style.value);

	st['background-image'] = "url('" + formObj.backgroundimage.value + "')";

	formObj.style.value = kampungan.serializeStyle(st);
}

function changedBorder() {
	var formObj = document.forms[0];
	var st = kampungan.parseStyle(formObj.style.value);

	// Update border width if the element has a color
	if (formObj.border.value != "" && formObj.bordercolor.value != "")
		st['border-width'] = formObj.border.value + "px";

	formObj.style.value = kampungan.serializeStyle(st);
}

function changedColor() {
	var formObj = document.forms[0];
	var st = kampungan.parseStyle(formObj.style.value);

	st['background-color'] = formObj.bgcolor.value;

	if (formObj.bordercolor.value != "") {
		st['border-color'] = formObj.bordercolor.value;

		// Add border-width if it's missing
		if (!st['border-width'])
			st['border-width'] = formObj.border.value == "" ? "1px" : formObj.border.value + "px";
	}

	formObj.style.value = kampungan.serializeStyle(st);
}

function changedStyle() {
	var formObj = document.forms[0];
	var st = kampungan.parseStyle(formObj.style.value);

	if (st['background-image'])
		formObj.backgroundimage.value = st['background-image'].replace(new RegExp("url\\('?([^']*)'?\\)", 'gi'), "$1");
	else
		formObj.backgroundimage.value = '';

	if (st['width'])
		formObj.width.value = trimSize(st['width']);

	if (st['height'])
		formObj.height.value = trimSize(st['height']);

	if (st['background-color']) {
		formObj.bgcolor.value = st['background-color'];
		updateColor('bgcolor_pick','bgcolor');
	}

	if (st['border-color']) {
		formObj.bordercolor.value = st['border-color'];
		updateColor('bordercolor_pick','bordercolor');
	}
}
