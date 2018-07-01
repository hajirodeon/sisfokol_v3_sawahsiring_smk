/**
 * $RCSfile: editor_plugin_src.js,v $
 * $Revision: 1.16 $
 * $Date: 2006/02/10 21:34:28 $
 *
 * @author Moxiecode
 * @copyright Copyright © 2004-2006, Moxiecode Systems AB, All rights reserved.
 */

/* Import plugin specific language pack */
kampungan.importPluginLanguagePack('directionality', 'en,tr,sv,fr_ca,zh_cn,cs,da,he,nb,de,hu,ru,ru_KOI8-R,ru_UTF-8,nn,es,cy,is,pl,nl,fr,pt_br');

var kampungan_DirectionalityPlugin = {
	getInfo : function() {
		return {
			longname : 'Directionality',
			author : 'Moxiecode Systems',
			authorurl : 'http://kampungan.moxiecode.com',
			infourl : 'http://kampungan.moxiecode.com/kampungan/docs/plugin_directionality.html',
			version : kampungan.majorVersion + "." + kampungan.minorVersion
		};
	},

	getControlHTML : function(cn) {
		switch (cn) {
			case "ltr":
				return kampungan.getButtonHTML(cn, 'lang_directionality_ltr_desc', '{$pluginurl}/images/ltr.gif', 'mceDirectionLTR');

			case "rtl":
				return kampungan.getButtonHTML(cn, 'lang_directionality_rtl_desc', '{$pluginurl}/images/rtl.gif', 'mceDirectionRTL');
		}

		return "";
	},

	execCommand : function(editor_id, element, command, user_interface, value) {
		// Handle commands
		switch (command) {
			case "mceDirectionLTR":
				var inst = kampungan.getInstanceById(editor_id);
				var elm = kampungan.getParentElement(inst.getFocusElement(), "p,div,td,h1,h2,h3,h4,h5,h6,pre,address");

				if (elm)
					elm.setAttribute("dir", "ltr");

				kampungan.triggerNodeChange(false);
				return true;

			case "mceDirectionRTL":
				var inst = kampungan.getInstanceById(editor_id);
				var elm = kampungan.getParentElement(inst.getFocusElement(), "p,div,td,h1,h2,h3,h4,h5,h6,pre,address");

				if (elm)
					elm.setAttribute("dir", "rtl");

				kampungan.triggerNodeChange(false);
				return true;
		}

		// Pass to next handler in chain
		return false;
	},

	handleNodeChange : function(editor_id, node, undo_index, undo_levels, visual_aid, any_selection) {
		function getAttrib(elm, name) {
			return elm.getAttribute(name) ? elm.getAttribute(name) : "";
		}

		if (node == null)
			return;

		var elm = kampungan.getParentElement(node, "p,div,td,h1,h2,h3,h4,h5,h6,pre,address");
		if (!elm) {
			kampungan.switchClass(editor_id + '_ltr', 'mceButtonDisabled');
			kampungan.switchClass(editor_id + '_rtl', 'mceButtonDisabled');
			return true;
		}

		kampungan.switchClass(editor_id + '_ltr', 'mceButtonNormal');
		kampungan.switchClass(editor_id + '_rtl', 'mceButtonNormal');

		var dir = getAttrib(elm, "dir");
		if (dir == "ltr" || dir == "")
			kampungan.switchClass(editor_id + '_ltr', 'mceButtonSelected');
		else
			kampungan.switchClass(editor_id + '_rtl', 'mceButtonSelected');

		return true;
	}
};

kampungan.addPlugin("directionality", kampungan_DirectionalityPlugin);
