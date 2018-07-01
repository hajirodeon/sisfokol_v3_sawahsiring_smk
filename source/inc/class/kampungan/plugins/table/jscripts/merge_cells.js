function init() {
	kampunganPopup.resizeToInnerSize();

	var formObj = document.forms[0];

	formObj.numcols.value = kampungan.getWindowArg('numcols', 1);
	formObj.numrows.value = kampungan.getWindowArg('numrows', 1);
}

function mergeCells() {
	var args = new Array();
	var formObj = document.forms[0];

	args["numcols"] = formObj.numcols.value;
	args["numrows"] = formObj.numrows.value;

	kampunganPopup.execCommand("mceTableMergeCells", false, args);
	kampunganPopup.close();
}
