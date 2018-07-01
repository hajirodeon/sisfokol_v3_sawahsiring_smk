/**
 * $RCSfile: editor_plugin_src.js,v $
 * $Revision: 1.19 $
 * $Date: 2006/02/10 16:29:37 $
 *
 * @author Moxiecode
 * @copyright Copyright © 2004-2006, Moxiecode Systems AB, All rights reserved.
 */

/* Import plugin specific language pack */
kampungan.importPluginLanguagePack('advhr', 'en,tr,de,sv,zh_cn,cs,fa,fr_ca,fr,pl,pt_br,nl,da,he,nb,hu,ru,ru_KOI8-R,ru_UTF-8,nn,fi,es,cy,is,zh_tw,zh_tw_utf8,sk');

var kampungan_AdvancedHRPlugin = {
	getInfo : function() {
		return {
			longname : 'Advanced HR',
			author : 'Moxiecode Systems',
			authorurl : 'http://kampungan.moxiecode.com',
			infourl : 'http://kampungan.moxiecode.com/kampungan/docs/plugin_advhr.html',
			version : kampungan.majorVersion + "." + kampungan.minorVersion
		}
	},

	getControlHTML : function(cn) {
		switch (cn) {
			case "advhr":
				return kampungan.getButtonHTML(cn, 'lang_insert_advhr_desc', '{$pluginurl}/images/advhr.gif', 'mceAdvancedHr');
		}

		return "";
	},

	/**
	 * Executes the mceAdvanceHr command.
	 */
	execCommand : function(editor_id, element, command, user_interface, value) {
		// Handle commands
		switch (command) {
			case "mceAdvancedHr":
				var template = new Array();

				template['file']   = '../../plugins/advhr/rule.htm'; // Relative to theme
				template['width']  = 250;
				template['height'] = 160;

				template['width']  += kampungan.getLang('lang_advhr_delta_width', 0);
				template['height'] += kampungan.getLang('lang_advhr_delta_height', 0);

				var size = "", width = "", noshade = "";
				if (kampungan.selectedElement != null && kampungan.selectedElement.nodeName.toLowerCase() == "hr") {
					kampungan.hrElement = kampungan.selectedElement;

					if (kampungan.hrElement) {
						size    = kampungan.hrElement.getAttribute('size') ? kampungan.hrElement.getAttribute('size') : "";
						width   = kampungan.hrElement.getAttribute('width') ? kampungan.hrElement.getAttribute('width') : "";
						noshade = kampungan.hrElement.getAttribute('noshade') ? kampungan.hrElement.getAttribute('noshade') : "";
					}

					kampungan.openWindow(template, {editor_id : editor_id, size : size, width : width, noshade : noshade, mceDo : 'update'});
				} else {
					if (kampungan.isMSIE) {
						kampungan.execInstanceCommand(editor_id, 'mceInsertContent', false,'<hr />');
					} else {
						kampungan.openWindow(template, {editor_id : editor_id, inline : "yes", size : size, width : width, noshade : noshade, mceDo : 'insert'});
					}
				}

				return true;
		}

		// Pass to next handler in chain
		return false;
	},

	handleNodeChange : function(editor_id, node, undo_index, undo_levels, visual_aid, any_selection) {
		if (node == null)
			return;

		do {
			if (node.nodeName == "HR") {
				kampungan.switchClass(editor_id + '_advhr', 'mceButtonSelected');
				return true;
			}
		} while ((node = node.parentNode));

		kampungan.switchClass(editor_id + '_advhr', 'mceButtonNormal');

		return true;
	}
};

kampungan.addPlugin("advhr", kampungan_AdvancedHRPlugin);
