var action, element;

function init() {
	kampunganPopup.resizeToInnerSize();

	var inst = kampungan.getInstanceById(kampungan.getWindowArg('editor_id'));
	var anchor = kampungan.getParentElement(inst.getFocusElement(), "a", "name");
	var img = inst.getFocusElement();
	action = 'insert';

	if (anchor != null) {
		element = anchor;
		action = "update";
	}

	if (kampungan.getAttrib(img, "class") == "mceItemAnchor") {
		element = img;
		action = "update";
	}

	if (action == "update")
		document.forms[0].anchorName.value = element.nodeName == "IMG" ? element.getAttribute("title") : element.getAttribute("name");

	document.forms[0].insert.value = kampungan.getLang('lang_' + action, 'Insert', true);
}

function insertAnchor() {
	var inst = kampungan.getInstanceById(kampungan.getWindowArg('editor_id'));
	var name = document.forms[0].anchorName.value, e;

	kampunganPopup.execCommand("mceBeginUndoLevel");

	if (action == "update") {
		if (element.nodeName == "IMG")
			element.setAttribute("title", name);
		else
			element.setAttribute("name", name);
	} else {
		var rng = inst.getRng();

		if (rng.collapse)
			rng.collapse(false);

		name = name.replace(/&/g, '&amp;');
		name = name.replace(/\"/g, '&quot;');
		name = name.replace(/</g, '&lt;');
		name = name.replace(/>/g, '&gt;');

		// Fix for bug #1447335
		if (kampungan.isGecko)
			html = '<a id="mceNewAnchor" name="' + name + '"></a>';
		else
			html = '<a name="' + name + '"></a>';

		kampunganPopup.execCommand("mceInsertContent", false, html);

		// Fix for bug #1447335 force cursor after the anchor element
		if (kampungan.isGecko) {
			e = inst.getDoc().getElementById('mceNewAnchor');

			if (e) {
				inst.selection.selectNode(e, true, false, false);
				e.removeAttribute('id');
			}
		}

		kampungan.handleVisualAid(inst.getBody(), true, inst.visualAid, inst);
	}

	kampunganPopup.execCommand("mceEndUndoLevel");

	kampungan.triggerNodeChange();
	kampunganPopup.close();
}
