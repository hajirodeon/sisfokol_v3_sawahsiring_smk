var url = kampungan.getParam("flash_external_list_url");
if (url != null) {
	// Fix relative
	if (url.charAt(0) != '/' && url.indexOf('://') == -1)
		url = kampungan.documentBasePath + "/" + url;

	document.write('<sc'+'ript language="javascript" type="text/javascript" src="' + url + '"></sc'+'ript>');
}

function init() {
	kampunganPopup.resizeToInnerSize();

	document.getElementById("filebrowsercontainer").innerHTML = getBrowserHTML('filebrowser','file','flash','flash');

	// Image list outsrc
	var html = getFlashListHTML('filebrowser','file','flash','flash');
	if (html == "")
		document.getElementById("linklistrow").style.display = 'none';
	else
		document.getElementById("linklistcontainer").innerHTML = html;

	var formObj = document.forms[0];
	var swffile   = kampungan.getWindowArg('swffile');
	var swfwidth  = '' + kampungan.getWindowArg('swfwidth');
	var swfheight = '' + kampungan.getWindowArg('swfheight');

	if (swfwidth.indexOf('%')!=-1) {
		formObj.width2.value = "%";
		formObj.width.value  = swfwidth.substring(0,swfwidth.length-1);
	} else {
		formObj.width2.value = "px";
		formObj.width.value  = swfwidth;
	}

	if (swfheight.indexOf('%')!=-1) {
		formObj.height2.value = "%";
		formObj.height.value  = swfheight.substring(0,swfheight.length-1);
	} else {
		formObj.height2.value = "px";
		formObj.height.value  = swfheight;
	}

	formObj.file.value = swffile;
	formObj.insert.value = kampungan.getLang('lang_' + kampungan.getWindowArg('action'), 'Insert', true);

	selectByValue(formObj, 'linklist', swffile);

	// Handle file browser
	if (isVisible('filebrowser'))
		document.getElementById('file').style.width = '230px';

	// Auto select flash in list
	if (typeof(kampunganFlashList) != "undefined" && kampunganFlashList.length > 0) {
		for (var i=0; i<formObj.linklist.length; i++) {
			if (formObj.linklist.options[i].value == kampungan.getWindowArg('swffile'))
				formObj.linklist.options[i].selected = true;
		}
	}
}

function getFlashListHTML() {
	if (typeof(kampunganFlashList) != "undefined" && kampunganFlashList.length > 0) {
		var html = "";

		html += '<select id="linklist" name="linklist" style="width: 250px" onfocus="kampungan.addSelectAccessibility(event, this, window);" onchange="this.form.file.value=this.options[this.selectedIndex].value;">';
		html += '<option value="">---</option>';

		for (var i=0; i<kampunganFlashList.length; i++)
			html += '<option value="' + kampunganFlashList[i][1] + '">' + kampunganFlashList[i][0] + '</option>';

		html += '</select>';

		return html;
	}

	return "";
}

function insertFlash() {
	var formObj = document.forms[0];
	var html      = '';
	var file      = formObj.file.value;
	var width     = formObj.width.value;
	var height    = formObj.height.value;
	if (formObj.width2.value=='%') {
		width = width + '%';
	}
	if (formObj.height2.value=='%') {
		height = height + '%';
	}

	if (width == "")
		width = 100;

	if (height == "")
		height = 100;

	html += ''
		+ '<img src="' + (kampungan.getParam("theme_href") + "/images/spacer.gif") + '" mce_src="' + (kampungan.getParam("theme_href") + "/images/spacer.gif") + '" '
		+ 'width="' + width + '" height="' + height + '" '
		+ 'border="0" alt="' + file + '" title="' + file + '" class="mceItemFlash" />';

	kampunganPopup.execCommand("mceInsertContent", true, html);
	kampungan.selectedInstance.repaint();

	kampunganPopup.close();
}
