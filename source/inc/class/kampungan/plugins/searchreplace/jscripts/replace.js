function init() {
	kampunganPopup.resizeToInnerSize();

	var formObj = document.forms[0];

	formObj.searchstring.value = kampungan.getWindowArg("searchstring");
	formObj.replacestring.value = kampungan.getWindowArg("replacestring");
	formObj.casesensitivebox.checked = kampungan.getWindowArg("casesensitive");
//	formObj.backwards[0].checked = kampungan.getWindowArg("backwards");
//	formObj.backwards[1].checked = !kampungan.getWindowArg("backwards");
//		formObj.wrapatend.checked = kampungan.getWindowArg("wrap");
//		formObj.wholeword.checked = kampungan.getWindowArg("wholeword");

	kampunganPopup.execCommand("mceResetSearch", false, {dummy : ""}, false);
}

function searchNext(replacemode) {
	var formObj = document.forms[0];

	// Whats the point?
	if (formObj.searchstring.value == "" || formObj.searchstring.value == formObj.replacestring.value)
		return;

	// Do search
	kampunganPopup.execCommand('mceSearch', false, { 
		string : formObj.searchstring.value,
		replacestring : formObj.replacestring.value,
		replacemode : replacemode,
		casesensitive : formObj.casesensitivebox.checked,
		backwards : false
//			wrap : formObj.wrapatend.checked,
//			wholeword : formObj.wholeword.checked
		}, false);

	window.focus();
}

function cancelAction() {
	kampunganPopup.close();
}
