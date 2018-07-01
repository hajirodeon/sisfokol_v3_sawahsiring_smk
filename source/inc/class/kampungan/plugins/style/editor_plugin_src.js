/**
 * $RCSfile: editor_plugin_src.js,v $
 * $Revision: 1.1 $
 * $Date: 2006/05/03 10:46:42 $
 *
 * @author Moxiecode
 * @copyright Copyright © 2004-2006, Moxiecode Systems AB, All rights reserved.
 */

/* Import plugin specific language pack */
kampungan.importPluginLanguagePack('style', 'en');

var kampungan_StylePlugin = {
	getInfo : function() {
		return {
			longname : 'Style',
			author : 'Moxiecode Systems',
			authorurl : 'http://kampungan.moxiecode.com',
			infourl : 'http://kampungan.moxiecode.com/kampungan/docs/plugin_style.html',
			version : kampungan.majorVersion + "." + kampungan.minorVersion
		};
	},

	getControlHTML : function(cn) {
		switch (cn) {
			case "styleprops":
				return kampungan.getButtonHTML(cn, 'lang_style_styleinfo_desc', '{$pluginurl}/images/style_info.gif', 'mceStyleProps', true);
		}

		return "";
	},

	execCommand : function(editor_id, element, command, user_interface, value) {
		var e, inst;

		// Handle commands
		switch (command) {
			case "mceStyleProps":
				kampungan_StylePlugin._styleProps();
				return true;

			case "mceSetElementStyle":
				inst = kampungan.getInstanceById(editor_id);
				e = inst.selection.getFocusElement();

				if (e) {
					e.style.cssText = value;
					inst.repaint();
				}

				return true;
		}

		// Pass to next handler in chain
		return false;
	},

	handleNodeChange : function(editor_id, node, undo_index, undo_levels, visual_aid, any_selection) {
	},

	// Private plugin specific methods

	_styleProps : function() {
		var e = kampungan.selectedInstance.selection.getFocusElement();

		if (!e)
			return;

		kampungan.openWindow({
			file : '../../plugins/style/props.htm',
			width : 480 + kampungan.getLang('lang_style_props_delta_width', 0),
			height : 320 + kampungan.getLang('lang_style_props_delta_height', 0)
		}, {
			editor_id : kampungan.selectedInstance.editorId,
			inline : "yes",
			style_text : e.style.cssText
		});
	}
};

kampungan.addPlugin("style", kampungan_StylePlugin);
