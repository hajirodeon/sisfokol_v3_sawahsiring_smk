var url = kampungan.getParam("external_image_list_url");
if (url != null) {
	// Fix relative
	if (url.charAt(0) != '/' && url.indexOf('://') == -1)
		url = kampungan.documentBasePath + "/" + url;

	document.write('<sc'+'ript language="javascript" type="text/javascript" src="' + url + '"></sc'+'ript>');
}

function insertImage() {
	var src = document.forms[0].src.value;
	var alt = document.forms[0].alt.value;
	var border = document.forms[0].border.value;
	var vspace = document.forms[0].vspace.value;
	var hspace = document.forms[0].hspace.value;
	var width = document.forms[0].width.value;
	var height = document.forms[0].height.value;
	var align = document.forms[0].align.options[document.forms[0].align.selectedIndex].value;

	kampunganPopup.restoreSelection();
	kampungan.themes['advanced']._insertImage(src, alt, border, hspace, vspace, width, height, align);
	kampunganPopup.close();
}

function init() {
	kampunganPopup.resizeToInnerSize();

	document.getElementById('srcbrowsercontainer').innerHTML = getBrowserHTML('srcbrowser','src','image','theme_advanced_image');

	var formObj = document.forms[0];

	for (var i=0; i<document.forms[0].align.options.length; i++) {
		if (document.forms[0].align.options[i].value == kampungan.getWindowArg('align'))
			document.forms[0].align.options.selectedIndex = i;
	}

	formObj.src.value = kampungan.getWindowArg('src');
	formObj.alt.value = kampungan.getWindowArg('alt');
	formObj.border.value = kampungan.getWindowArg('border');
	formObj.vspace.value = kampungan.getWindowArg('vspace');
	formObj.hspace.value = kampungan.getWindowArg('hspace');
	formObj.width.value = kampungan.getWindowArg('width');
	formObj.height.value = kampungan.getWindowArg('height');
	formObj.insert.value = kampungan.getLang('lang_' + kampungan.getWindowArg('action'), 'Insert', true); 

	// Handle file browser
	if (isVisible('srcbrowser'))
		document.getElementById('src').style.width = '180px';

	// Auto select image in list
	if (typeof(kampunganImageList) != "undefined" && kampunganImageList.length > 0) {
		for (var i=0; i<formObj.image_list.length; i++) {
			if (formObj.image_list.options[i].value == kampungan.getWindowArg('src'))
				formObj.image_list.options[i].selected = true;
		}
	}
}

var preloadImg = new Image();

function resetImageData() {
	var formObj = document.forms[0];
	formObj.width.value = formObj.height.value = "";	
}

function updateImageData() {
	var formObj = document.forms[0];

	if (formObj.width.value == "")
		formObj.width.value = preloadImg.width;

	if (formObj.height.value == "")
		formObj.height.value = preloadImg.height;
}

function getImageData() {
	preloadImg = new Image();
	kampungan.addEvent(preloadImg, "load", updateImageData);
	kampungan.addEvent(preloadImg, "error", function () {var formObj = document.forms[0];formObj.width.value = formObj.height.value = "";});
	preloadImg.src = kampungan.convertRelativeToAbsoluteURL(kampungan.settings['base_href'], document.forms[0].src.value);
}
