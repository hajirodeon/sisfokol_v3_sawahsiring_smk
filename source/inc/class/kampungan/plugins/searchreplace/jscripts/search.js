function init() {
	kampunganPopup.resizeToInnerSize();

	var formObj = document.forms[0];

	formObj.searchstring.value = kampungan.getWindowArg("searchstring");
	formObj.casesensitivebox.checked = kampungan.getWindowArg("casesensitive");
	formObj.backwards[0].checked = kampungan.getWindowArg("backwards");
	formObj.backwards[1].checked = !kampungan.getWindowArg("backwards");
//		formObj.wrapatend.checked = kampungan.getWindowArg("wrap");
//		formObj.wholeword.checked = kampungan.getWindowArg("wholeword");

	kampunganPopup.execCommand("mceResetSearch", false, {dummy : ""}, false);
}

function searchNext() {
	var formObj = document.forms[0];

	if (formObj.searchstring.value == "")
		return;

	// Do search
	kampunganPopup.execCommand('mceSearch', false, { 
		string : formObj.searchstring.value,
		casesensitive : formObj.casesensitivebox.checked,
		backwards : formObj.backwards[0].checked
//			wrap : formObj.wrapatend.checked,
//			wholeword : formObj.wholeword.checked
		}, false);

	window.focus();
}

function cancelAction() {
	kampunganPopup.close();
}
