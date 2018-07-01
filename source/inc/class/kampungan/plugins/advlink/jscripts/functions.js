/* Functions for the advlink plugin popup */

var templates = {
	"window.open" : "window.open('${url}','${target}','${options}')"
};

function preinit() {
	// Initialize
	kampungan.setWindowArg('mce_windowresize', false);

	// Import external list url javascript
	var url = kampungan.getParam("external_link_list_url");
	if (url != null) {
		// Fix relative
		if (url.charAt(0) != '/' && url.indexOf('://') == -1)
			url = kampungan.documentBasePath + "/" + url;

		document.write('<sc'+'ript language="javascript" type="text/javascript" src="' + url + '"></sc'+'ript>');
	}
}

function changeClass() {
	var formObj = document.forms[0];
	formObj.classes.value = getSelectValue(formObj, 'classlist');
}

function init() {
	kampunganPopup.resizeToInnerSize();

	var formObj = document.forms[0];
	var inst = kampungan.getInstanceById(kampungan.getWindowArg('editor_id'));
	var elm = inst.getFocusElement();
	var action = "insert";
	var html;

	document.getElementById('hrefbrowsercontainer').innerHTML = getBrowserHTML('hrefbrowser','href','file','advlink');
	document.getElementById('popupurlbrowsercontainer').innerHTML = getBrowserHTML('popupurlbrowser','popupurl','file','advlink');
	document.getElementById('linklisthrefcontainer').innerHTML = getLinkListHTML('linklisthref','href');
	document.getElementById('anchorlistcontainer').innerHTML = getAnchorListHTML('anchorlist','href');
	document.getElementById('targetlistcontainer').innerHTML = getTargetListHTML('targetlist','target');

	// Link list
	html = getLinkListHTML('linklisthref','href');
	if (html == "")
		document.getElementById("linklisthrefrow").style.display = 'none';
	else
		document.getElementById("linklisthrefcontainer").innerHTML = html;

	// Resize some elements
	if (isVisible('hrefbrowser'))
		document.getElementById('href').style.width = '260px';

	if (isVisible('popupurlbrowser'))
		document.getElementById('popupurl').style.width = '180px';

	elm = kampungan.getParentElement(elm, "a");
	if (elm != null && elm.nodeName == "A")
		action = "update";

	formObj.insert.value = kampungan.getLang('lang_' + action, 'Insert', true); 

	setPopupControlsDisabled(true);

	if (action == "update") {
		var href = kampungan.getAttrib(elm, 'href');

		href = convertURL(href, elm, true);

		// Use mce_href if found
		var mceRealHref = kampungan.getAttrib(elm, 'mce_href');
		if (mceRealHref != "") {
			href = mceRealHref;

			if (kampungan.getParam('convert_urls'))
				href = convertURL(href, elm, true);
		}

		var onclick = kampungan.cleanupEventStr(kampungan.getAttrib(elm, 'onclick'));

		// Setup form data
		setFormValue('href', href);
		setFormValue('title', kampungan.getAttrib(elm, 'title'));
		setFormValue('id', kampungan.getAttrib(elm, 'id'));
		setFormValue('style', kampungan.serializeStyle(kampungan.parseStyle(kampungan.getAttrib(elm, "style"))));
		setFormValue('rel', kampungan.getAttrib(elm, 'rel'));
		setFormValue('rev', kampungan.getAttrib(elm, 'rev'));
		setFormValue('charset', kampungan.getAttrib(elm, 'charset'));
		setFormValue('hreflang', kampungan.getAttrib(elm, 'hreflang'));
		setFormValue('dir', kampungan.getAttrib(elm, 'dir'));
		setFormValue('lang', kampungan.getAttrib(elm, 'lang'));
		setFormValue('tabindex', kampungan.getAttrib(elm, 'tabindex', typeof(elm.tabindex) != "undefined" ? elm.tabindex : ""));
		setFormValue('accesskey', kampungan.getAttrib(elm, 'accesskey', typeof(elm.accesskey) != "undefined" ? elm.accesskey : ""));
		setFormValue('type', kampungan.getAttrib(elm, 'type'));
		setFormValue('onfocus', kampungan.cleanupEventStr(kampungan.getAttrib(elm, 'onfocus')));
		setFormValue('onblur', kampungan.cleanupEventStr(kampungan.getAttrib(elm, 'onblur')));
		setFormValue('onclick', onclick);
		setFormValue('ondblclick', kampungan.cleanupEventStr(kampungan.getAttrib(elm, 'ondblclick')));
		setFormValue('onmousedown', kampungan.cleanupEventStr(kampungan.getAttrib(elm, 'onmousedown')));
		setFormValue('onmouseup', kampungan.cleanupEventStr(kampungan.getAttrib(elm, 'onmouseup')));
		setFormValue('onmouseover', kampungan.cleanupEventStr(kampungan.getAttrib(elm, 'onmouseover')));
		setFormValue('onmousemove', kampungan.cleanupEventStr(kampungan.getAttrib(elm, 'onmousemove')));
		setFormValue('onmouseout', kampungan.cleanupEventStr(kampungan.getAttrib(elm, 'onmouseout')));
		setFormValue('onkeypress', kampungan.cleanupEventStr(kampungan.getAttrib(elm, 'onkeypress')));
		setFormValue('onkeydown', kampungan.cleanupEventStr(kampungan.getAttrib(elm, 'onkeydown')));
		setFormValue('onkeyup', kampungan.cleanupEventStr(kampungan.getAttrib(elm, 'onkeyup')));
		setFormValue('target', kampungan.getAttrib(elm, 'target'));
		setFormValue('classes', kampungan.getAttrib(elm, 'class'));

		// Parse onclick data
		if (onclick != null && onclick.indexOf('window.open') != -1)
			parseWindowOpen(onclick);
		else
			parseFunction(onclick);

		// Select by the values
		selectByValue(formObj, 'dir', kampungan.getAttrib(elm, 'dir'));
		selectByValue(formObj, 'rel', kampungan.getAttrib(elm, 'rel'));
		selectByValue(formObj, 'rev', kampungan.getAttrib(elm, 'rev'));
		selectByValue(formObj, 'linklisthref', href);

		if (href.charAt(0) == '#')
			selectByValue(formObj, 'anchorlist', href);

		addClassesToList('classlist', 'advlink_styles');

		selectByValue(formObj, 'classlist', kampungan.getAttrib(elm, 'class'), true);
		selectByValue(formObj, 'targetlist', kampungan.getAttrib(elm, 'target'), true);
	} else
		addClassesToList('classlist', 'advlink_styles');

	window.focus();
}

function setFormValue(name, value) {
	document.forms[0].elements[name].value = value;
}

function convertURL(url, node, on_save) {
	return eval("kampunganPopup.windowOpener." + kampungan.settings['urlconverter_callback'] + "(url, node, on_save);");
}

function parseWindowOpen(onclick) {
	var formObj = document.forms[0];

	// Preprocess center code
	if (onclick.indexOf('return false;') != -1) {
		formObj.popupreturn.checked = true;
		onclick = onclick.replace('return false;', '');
	} else
		formObj.popupreturn.checked = false;

	var onClickData = parseLink(onclick);

	if (onClickData != null) {
		formObj.ispopup.checked = true;
		setPopupControlsDisabled(false);

		var onClickWindowOptions = parseOptions(onClickData['options']);
		var url = onClickData['url'];

		if (kampungan.getParam('convert_urls'))
			url = convertURL(url, null, true);

		formObj.popupname.value = onClickData['target'];
		formObj.popupurl.value = url;
		formObj.popupwidth.value = getOption(onClickWindowOptions, 'width');
		formObj.popupheight.value = getOption(onClickWindowOptions, 'height');

		formObj.popupleft.value = getOption(onClickWindowOptions, 'left');
		formObj.popuptop.value = getOption(onClickWindowOptions, 'top');

		if (formObj.popupleft.value.indexOf('screen') != -1)
			formObj.popupleft.value = "c";

		if (formObj.popuptop.value.indexOf('screen') != -1)
			formObj.popuptop.value = "c";

		formObj.popuplocation.checked = getOption(onClickWindowOptions, 'location') == "yes";
		formObj.popupscrollbars.checked = getOption(onClickWindowOptions, 'scrollbars') == "yes";
		formObj.popupmenubar.checked = getOption(onClickWindowOptions, 'menubar') == "yes";
		formObj.popupresizable.checked = getOption(onClickWindowOptions, 'resizable') == "yes";
		formObj.popuptoolbar.checked = getOption(onClickWindowOptions, 'toolbar') == "yes";
		formObj.popupstatus.checked = getOption(onClickWindowOptions, 'status') == "yes";
		formObj.popupdependent.checked = getOption(onClickWindowOptions, 'dependent') == "yes";

		buildOnClick();
	}
}

function parseFunction(onclick) {
	var formObj = document.forms[0];
	var onClickData = parseLink(onclick);

	// TODO: Add stuff here
}

function getOption(opts, name) {
	return typeof(opts[name]) == "undefined" ? "" : opts[name];
}

function setPopupControlsDisabled(state) {
	var formObj = document.forms[0];

	formObj.popupname.disabled = state;
	formObj.popupurl.disabled = state;
	formObj.popupwidth.disabled = state;
	formObj.popupheight.disabled = state;
	formObj.popupleft.disabled = state;
	formObj.popuptop.disabled = state;
	formObj.popuplocation.disabled = state;
	formObj.popupscrollbars.disabled = state;
	formObj.popupmenubar.disabled = state;
	formObj.popupresizable.disabled = state;
	formObj.popuptoolbar.disabled = state;
	formObj.popupstatus.disabled = state;
	formObj.popupreturn.disabled = state;
	formObj.popupdependent.disabled = state;

	setBrowserDisabled('popupurlbrowser', state);
}

function parseLink(link) {
	link = link.replace(new RegExp('&#39;', 'g'), "'");

	var fnName = link.replace(new RegExp("\\s*([A-Za-z0-9\.]*)\\s*\\(.*", "gi"), "$1");

	// Is function name a template function
	var template = templates[fnName];
	if (template) {
		// Build regexp
		var variableNames = template.match(new RegExp("'?\\$\\{[A-Za-z0-9\.]*\\}'?", "gi"));
		var regExp = "\\s*[A-Za-z0-9\.]*\\s*\\(";
		var replaceStr = "";
		for (var i=0; i<variableNames.length; i++) {
			// Is string value
			if (variableNames[i].indexOf("'${") != -1)
				regExp += "'(.*)'";
			else // Number value
				regExp += "([0-9]*)";

			replaceStr += "$" + (i+1);

			// Cleanup variable name
			variableNames[i] = variableNames[i].replace(new RegExp("[^A-Za-z0-9]", "gi"), "");

			if (i != variableNames.length-1) {
				regExp += "\\s*,\\s*";
				replaceStr += "<delim>";
			} else
				regExp += ".*";
		}

		regExp += "\\);?";

		// Build variable array
		var variables = new Array();
		variables["_function"] = fnName;
		var variableValues = link.replace(new RegExp(regExp, "gi"), replaceStr).split('<delim>');
		for (var i=0; i<variableNames.length; i++)
			variables[variableNames[i]] = variableValues[i];

		return variables;
	}

	return null;
}

function parseOptions(opts) {
	if (opts == null || opts == "")
		return new Array();

	// Cleanup the options
	opts = opts.toLowerCase();
	opts = opts.replace(/;/g, ",");
	opts = opts.replace(/[^0-9a-z=,]/g, "");

	var optionChunks = opts.split(',');
	var options = new Array();

	for (var i=0; i<optionChunks.length; i++) {
		var parts = optionChunks[i].split('=');

		if (parts.length == 2)
			options[parts[0]] = parts[1];
	}

	return options;
}

function buildOnClick() {
	var formObj = document.forms[0];

	if (!formObj.ispopup.checked) {
		formObj.onclick.value = "";
		return;
	}

	var onclick = "window.open('";
	var url = formObj.popupurl.value;

	if (kampungan.getParam('convert_urls'))
		url = convertURL(url, null, true);

	onclick += url + "','";
	onclick += formObj.popupname.value + "','";

	if (formObj.popuplocation.checked)
		onclick += "location=yes,";

	if (formObj.popupscrollbars.checked)
		onclick += "scrollbars=yes,";

	if (formObj.popupmenubar.checked)
		onclick += "menubar=yes,";

	if (formObj.popupresizable.checked)
		onclick += "resizable=yes,";

	if (formObj.popuptoolbar.checked)
		onclick += "toolbar=yes,";

	if (formObj.popupstatus.checked)
		onclick += "status=yes,";

	if (formObj.popupdependent.checked)
		onclick += "dependent=yes,";

	if (formObj.popupwidth.value != "")
		onclick += "width=" + formObj.popupwidth.value + ",";

	if (formObj.popupheight.value != "")
		onclick += "height=" + formObj.popupheight.value + ",";

	if (formObj.popupleft.value != "") {
		if (formObj.popupleft.value != "c")
			onclick += "left=" + formObj.popupleft.value + ",";
		else
			onclick += "left='+(screen.availWidth/2-" + (formObj.popupwidth.value/2) + ")+',";
	}

	if (formObj.popuptop.value != "") {
		if (formObj.popuptop.value != "c")
			onclick += "top=" + formObj.popuptop.value + ",";
		else
			onclick += "top='+(screen.availHeight/2-" + (formObj.popupheight.value/2) + ")+',";
	}

	if (onclick.charAt(onclick.length-1) == ',')
		onclick = onclick.substring(0, onclick.length-1);

	onclick += "');";

	if (formObj.popupreturn.checked)
		onclick += "return false;";

	// kampungan.debug(onclick);

	formObj.onclick.value = onclick;

	if (formObj.href.value == "")
		formObj.href.value = url;
}

function setAttrib(elm, attrib, value) {
	var formObj = document.forms[0];
	var valueElm = formObj.elements[attrib.toLowerCase()];

	if (typeof(value) == "undefined" || value == null) {
		value = "";

		if (valueElm)
			value = valueElm.value;
	}

	if (value != "") {
		elm.setAttribute(attrib.toLowerCase(), value);

		if (attrib == "style")
			attrib = "style.cssText";

		if (attrib.substring(0, 2) == 'on')
			value = 'return true;' + value;

		if (attrib == "class")
			attrib = "className";

		eval('elm.' + attrib + "=value;");
	} else
		elm.removeAttribute(attrib);
}

function getAnchorListHTML(id, target) {
	var inst = kampungan.getInstanceById(kampungan.getWindowArg('editor_id'));
	var nodes = inst.getBody().getElementsByTagName("a");

	var html = "";

	html += '<select id="' + id + '" name="' + id + '" class="mceAnchorList" onfocus="kampungan.addSelectAccessibility(event, this, window);" onchange="this.form.' + target + '.value=';
	html += 'this.options[this.selectedIndex].value;">';
	html += '<option value="">---</option>';

	for (var i=0; i<nodes.length; i++) {
		if ((name = kampungan.getAttrib(nodes[i], "name")) != "")
			html += '<option value="#' + name + '">' + name + '</option>';
	}

	html += '</select>';

	return html;
}

function insertAction() {
	var inst = kampungan.getInstanceById(kampungan.getWindowArg('editor_id'));
	var elm = inst.getFocusElement();

	elm = kampungan.getParentElement(elm, "a");

	kampunganPopup.execCommand("mceBeginUndoLevel");

	// Create new anchor elements
	if (elm == null) {
		if (kampungan.isSafari)
			kampunganPopup.execCommand("mceInsertContent", false, '<a href="#mce_temp_url#">' + inst.selection.getSelectedHTML() + '</a>');
		else
			kampunganPopup.execCommand("createlink", false, "#mce_temp_url#");

		var elementArray = kampungan.getElementsByAttributeValue(inst.getBody(), "a", "href", "#mce_temp_url#");
		for (var i=0; i<elementArray.length; i++) {
			var elm = elementArray[i];

			// Move cursor behind the new anchor
			if (kampungan.isGecko) {
				var sp = inst.getDoc().createTextNode(" ");

				if (elm.nextSibling)
					elm.parentNode.insertBefore(sp, elm.nextSibling);
				else
					elm.parentNode.appendChild(sp);

				// Set range after link
				var rng = inst.getDoc().createRange();
				rng.setStartAfter(elm);
				rng.setEndAfter(elm);

				// Update selection
				var sel = inst.getSel();
				sel.removeAllRanges();
				sel.addRange(rng);
			}

			setAllAttribs(elm);
		}
	} else
		setAllAttribs(elm);

	kampungan._setEventsEnabled(inst.getBody(), false);
	kampunganPopup.execCommand("mceEndUndoLevel");
	kampunganPopup.close();
}

function setAllAttribs(elm) {
	var formObj = document.forms[0];
	var href = formObj.href.value;
	var target = getSelectValue(formObj, 'targetlist');

	// Make anchors absolute
	if (href.charAt(0) == '#' && kampungan.getParam('convert_urls'))
		href = kampungan.settings['document_base_url'] + href;

	setAttrib(elm, 'href', convertURL(href, elm));
	setAttrib(elm, 'mce_href', href);
	setAttrib(elm, 'title');
	setAttrib(elm, 'target', target == '_self' ? '' : target);
	setAttrib(elm, 'id');
	setAttrib(elm, 'style');
	setAttrib(elm, 'class', getSelectValue(formObj, 'classlist'));
	setAttrib(elm, 'rel');
	setAttrib(elm, 'rev');
	setAttrib(elm, 'charset');
	setAttrib(elm, 'hreflang');
	setAttrib(elm, 'dir');
	setAttrib(elm, 'lang');
	setAttrib(elm, 'tabindex');
	setAttrib(elm, 'accesskey');
	setAttrib(elm, 'type');
	setAttrib(elm, 'onfocus');
	setAttrib(elm, 'onblur');
	setAttrib(elm, 'onclick');
	setAttrib(elm, 'ondblclick');
	setAttrib(elm, 'onmousedown');
	setAttrib(elm, 'onmouseup');
	setAttrib(elm, 'onmouseover');
	setAttrib(elm, 'onmousemove');
	setAttrib(elm, 'onmouseout');
	setAttrib(elm, 'onkeypress');
	setAttrib(elm, 'onkeydown');
	setAttrib(elm, 'onkeyup');

	// Refresh in old MSIE
	if (kampungan.isMSIE5)
		elm.outerHTML = elm.outerHTML;
}

function getSelectValue(form_obj, field_name) {
	var elm = form_obj.elements[field_name];

	if (elm == null || elm.options == null)
		return "";

	return elm.options[elm.selectedIndex].value;
}

function getLinkListHTML(elm_id, target_form_element, onchange_func) {
	if (typeof(kampunganLinkList) == "undefined" || kampunganLinkList.length == 0)
		return "";

	var html = "";

	html += '<select id="' + elm_id + '" name="' + elm_id + '"';
	html += ' class="mceLinkList" onfocus="kampungan.addSelectAccessibility(event, this, window);" onchange="this.form.' + target_form_element + '.value=';
	html += 'this.options[this.selectedIndex].value;';

	if (typeof(onchange_func) != "undefined")
		html += onchange_func + '(\'' + target_form_element + '\',this.options[this.selectedIndex].text,this.options[this.selectedIndex].value);';

	html += '"><option value="">---</option>';

	for (var i=0; i<kampunganLinkList.length; i++)
		html += '<option value="' + kampunganLinkList[i][1] + '">' + kampunganLinkList[i][0] + '</option>';

	html += '</select>';

	return html;

	// kampungan.debug('-- image list start --', html, '-- image list end --');
}

function getTargetListHTML(elm_id, target_form_element) {
	var targets = kampungan.getParam('theme_advanced_link_targets', '').split(';');
	var html = '';

	html += '<select id="' + elm_id + '" name="' + elm_id + '" onfocus="kampungan.addSelectAccessibility(event, this, window);" onchange="this.form.' + target_form_element + '.value=';
	html += 'this.options[this.selectedIndex].value;">';

	html += '<option value="_self">' + kampungan.getLang('lang_advlink_target_same') + '</option>';
	html += '<option value="_blank">' + kampungan.getLang('lang_advlink_target_blank') + ' (_blank)</option>';
	html += '<option value="_parent">' + kampungan.getLang('lang_advlink_target_parent') + ' (_parent)</option>';
	html += '<option value="_top">' + kampungan.getLang('lang_advlink_target_top') + ' (_top)</option>';

	for (var i=0; i<targets.length; i++) {
		var key, value;

		if (targets[i] == "")
			continue;

		key = targets[i].split('=')[0];
		value = targets[i].split('=')[1];

		html += '<option value="' + key + '">' + value + ' (' + key + ')</option>';
	}

	html += '</select>';

	return html;
}

// While loading
preinit();
