/**
 * $RCSfile: editor_plugin_src.js,v $
 * $Revision: 1.7 $
 * $Date: 2006/02/06 20:02:38 $
 *
 * @author Moxiecode
 * @copyright Copyright © 2004-2006, Moxiecode Systems AB, All rights reserved.
 */

var kampungan_NonEditablePlugin = {
	getInfo : function() {
		return {
			longname : 'Non editable elements',
			author : 'Moxiecode Systems',
			authorurl : 'http://kampungan.moxiecode.com',
			infourl : 'http://kampungan.moxiecode.com/kampungan/docs/plugin_noneditable.html',
			version : kampungan.majorVersion + "." + kampungan.minorVersion
		};
	},

	initInstance : function(inst) {
		kampungan.importCSS(inst.getDoc(), kampungan.baseURL + "/plugins/noneditable/css/noneditable.css");

		// Ugly hack
		if (kampungan.isMSIE5_0)
			kampungan.settings['plugins'] = kampungan.settings['plugins'].replace(/noneditable/gi, 'Noneditable');

		if (kampungan.isGecko) {
			kampungan.addEvent(inst.getDoc(), "keyup", kampungan_NonEditablePlugin._fixKeyUp);
	//		kampungan.addEvent(inst.getDoc(), "keypress", kampungan_NonEditablePlugin._selectAll);
	//		kampungan.addEvent(inst.getDoc(), "mouseup", kampungan_NonEditablePlugin._selectAll);
		}
	},

	cleanup : function(type, content, inst) {
		switch (type) {
			case "insert_to_editor_dom":
				var nodes = kampungan.getNodeTree(content, new Array(), 1);
				var editClass = kampungan.getParam("noneditable_editable_class", "mceEditable");
				var nonEditClass = kampungan.getParam("noneditable_noneditable_class", "mceNonEditable");

				for (var i=0; i<nodes.length; i++) {
					var elm = nodes[i];

					// Convert contenteditable to classes
					var editable = kampungan.getAttrib(elm, "contenteditable");
					if (new RegExp("true|false","gi").test(editable))
						kampungan_NonEditablePlugin._setEditable(elm, editable == "true");

					if (kampungan.isMSIE) {
						var className = elm.className ? elm.className : "";

						if (className.indexOf(editClass) != -1)
							elm.contentEditable = true;

						if (className.indexOf(nonEditClass) != -1)
							elm.contentEditable = false;
					}
				}

				break;

			case "insert_to_editor":
				if (kampungan.isMSIE) {
					var editClass = kampungan.getParam("noneditable_editable_class", "mceEditable");
					var nonEditClass = kampungan.getParam("noneditable_noneditable_class", "mceNonEditable");

					content = content.replace(new RegExp("class=\"(.*)(" + editClass + ")([^\"]*)\"", "gi"), 'class="$1$2$3" contenteditable="true"');
					content = content.replace(new RegExp("class=\"(.*)(" + nonEditClass + ")([^\"]*)\"", "gi"), 'class="$1$2$3" contenteditable="false"');
				}

				break;

			case "get_from_editor_dom":
				if (kampungan.getParam("noneditable_leave_contenteditable", false)) {
					var nodes = kampungan.getNodeTree(content, new Array(), 1);

					for (var i=0; i<nodes.length; i++)
						nodes[i].removeAttribute("contenteditable");
				}

				break;
		}

		return content;
	},

	// Private internal plugin methods

	_fixKeyUp : function(e) {
		var inst = kampungan.selectedInstance;
		var sel = inst.getSel();
		var rng = inst.getRng();
		var an = sel.anchorNode;

		// Move cursor outside non editable fields
		if ((e.keyCode == 38 || e.keyCode == 37 || e.keyCode == 40 || e.keyCode == 39) && (elm = kampungan_NonEditablePlugin._isNonEditable(an)) != null) {
			rng = inst.getDoc().createRange();
			rng.selectNode(elm);
			rng.collapse(true);
			sel.removeAllRanges();
			sel.addRange(rng);
			kampungan.cancelEvent(e);
		}
	},
/*
	_selectAll : function(e) {
		var inst = kampungan.selectedInstance;
		var sel = inst.getSel();
		var doc = inst.getDoc();

		if ((elm = kampungan_NonEditablePlugin._isNonEditable(sel.focusNode)) != null) {
			inst.selection.selectNode(elm, false);
			kampungan.cancelEvent(e);
			return;
		}

		if ((elm = kampungan_NonEditablePlugin._isNonEditable(sel.anchorNode)) != null) {
			inst.selection.selectNode(elm, false);
			kampungan.cancelEvent(e);
			return;
		}
	},*/

	_isNonEditable : function(elm) {
		var editClass = kampungan.getParam("noneditable_editable_class", "mceEditable");
		var nonEditClass = kampungan.getParam("noneditable_noneditable_class", "mceNonEditable");

		if (!elm)
			return;

		do {
			var className = elm.className ? elm.className : "";

			if (className.indexOf(editClass) != -1)
				return null;

			if (className.indexOf(nonEditClass) != -1)
				return elm;
		} while (elm = elm.parentNode);

		return null;
	},

	_setEditable : function(elm, state) {
		var editClass = kampungan.getParam("noneditable_editable_class", "mceEditable");
		var nonEditClass = kampungan.getParam("noneditable_noneditable_class", "mceNonEditable");

		var className = elm.className ? elm.className : "";

		if (className.indexOf(editClass) != -1 || className.indexOf(nonEditClass) != -1)
			return;

		if ((className = kampungan.getAttrib(elm, "class")) != "")
			className += " ";

		className += state ? editClass : nonEditClass;

		elm.setAttribute("class", className);
		elm.className = className;
	}
};

kampungan.addPlugin("noneditable", kampungan_NonEditablePlugin);
