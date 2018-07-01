function init() {
	var formObj = document.forms[0];
	formObj.width.value  = kampungan.getWindowArg('width');
	formObj.size.value   = kampungan.getWindowArg('size');
	formObj.insert.value = kampungan.getLang('lang_' + kampungan.getWindowArg('mceDo'),'Insert',true);
	if (kampungan.getWindowArg('noshade')) {
		formObj.noshade.checked = true;
	}
	if (kampungan.getWindowArg('width').lastIndexOf('%')!=-1) {
		formObj.width2.value = "%";
		formObj.width.value  = formObj.width.value.substring(0,formObj.width.value.length-1);
	}
}

function insertHR() {
	var formObj = document.forms[0];
	var width   = formObj.width.value;
	var size    = formObj.size.value;
	var html = '<hr';
	if (size!='' && size!=0) {
		html += ' size="' + size + '"';
	}
	if (width!='' && width!=0) {
		html += ' width="' + width;
		if (formObj.width2.value=='%') {
			html += '%';
		}
		html += '"';
	}
	if (formObj.noshade.checked==true) {
		html += ' noshade="noshade"';
	}
	html += ' />';

	kampunganPopup.execCommand("mceInsertContent", true, html);
	kampunganPopup.close();
}

function cancelAction() {
	kampunganPopup.close();
}
