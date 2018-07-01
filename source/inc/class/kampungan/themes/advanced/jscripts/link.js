var url = kampungan.getParam("external_link_list_url");
if (url != null) {
	// Fix relative
	if (url.charAt(0) != '/' && url.indexOf('://') == -1)
		url = kampungan.documentBasePath + "/" + url;

	document.write('<sc'+'ript language="javascript" type="text/javascript" src="' + url + '"></sc'+'ript>');
}

function init() {
	kampunganPopup.resizeToInnerSize();

	document.getElementById('hrefbrowsercontainer').innerHTML = getBrowserHTML('hrefbrowser','href','file','theme_advanced_link');

	// Handle file browser
	if (isVisible('hrefbrowser'))
		document.getElementById('href').style.width = '180px';

	var formObj = document.forms[0];

	for (var i=0; i<document.forms[0].target.options.length; i++) {
		var option = document.forms[0].target.options[i];

		if (option.value == kampungan.getWindowArg('target'))
			option.selected = true;
	}

	document.forms[0].href.value = kampungan.getWindowArg('href');
	document.forms[0].linktitle.value = kampungan.getWindowArg('title');
	document.forms[0].insert.value = kampungan.getLang('lang_' + kampungan.getWindowArg('action'), 'Insert', true); 

	addClassesToList('styleSelect', 'theme_advanced_link_styles');
	selectByValue(formObj, 'styleSelect', kampungan.getWindowArg('className'), true);

	// Hide css select row if no CSS classes
	if (formObj.styleSelect && formObj.styleSelect.options.length <= 1) {
		var sr = document.getElementById('styleSelectRow');
		sr.style.display = 'none';
		sr.parentNode.removeChild(sr);
	}

	// Auto select link in list
	if (typeof(kampunganLinkList) != "undefined" && kampunganLinkList.length > 0) {
		var formObj = document.forms[0];

		for (var i=0; i<formObj.link_list.length; i++) {
			if (formObj.link_list.options[i].value == kampungan.getWindowArg('href'))
				formObj.link_list.options[i].selected = true;
		}
	}
}

function insertLink() {
	var href = document.forms[0].href.value;
	var target = document.forms[0].target.options[document.forms[0].target.selectedIndex].value;
	var title = document.forms[0].linktitle.value;
	var style_class = document.forms[0].styleSelect ? document.forms[0].styleSelect.value : "";
	var dummy;

	// Make anchors absolute
	if (href.charAt(0) == '#')
		href = kampungan.settings['document_base_url'] + href;

	if (target == '_self')
		target = '';

	kampunganPopup.restoreSelection();
	kampungan.themes['advanced']._insertLink(href, target, title, dummy, style_class);
	kampunganPopup.close();
}
