/**
 * $RCSfile: editor_plugin_src.js,v $
 * $Revision: 1.16 $
 * $Date: 2006/03/14 17:33:39 $
 *
 * @author Moxiecode
 * @copyright Copyright © 2004-2006, Moxiecode Systems AB, All rights reserved.
 */

/* Import plugin specific language pack */
kampungan.importPluginLanguagePack('fullscreen', 'en,tr,sv,cs,fr_ca,zh_cn,da,he,nb,de,hu,ru,ru_KOI8-R,ru_UTF-8,nn,es,cy,is,pl,nl,fr,pt_br');

var kampungan_FullScreenPlugin = {
	getInfo : function() {
		return {
			longname : 'Fullscreen',
			author : 'Moxiecode Systems',
			authorurl : 'http://kampungan.moxiecode.com',
			infourl : 'http://kampungan.moxiecode.com/kampungan/docs/plugin_fullscreen.html',
			version : kampungan.majorVersion + "." + kampungan.minorVersion
		};
	},

	getControlHTML : function(cn) {
		switch (cn) {
			case "fullscreen":
				return kampungan.getButtonHTML(cn, 'lang_fullscreen_desc', '{$pluginurl}/images/fullscreen.gif', 'mceFullScreen');
		}

		return "";
	},

	execCommand : function(editor_id, element, command, user_interface, value) {
		// Handle commands
		switch (command) {
			case "mceFullScreen":
				if (kampungan.getParam('fullscreen_is_enabled')) {
					// In fullscreen mode
					window.opener.kampungan.execInstanceCommand(kampungan.getParam('fullscreen_editor_id'), 'mceSetContent', false, kampungan.getContent(editor_id));
					top.close();
				} else {
					kampungan.setWindowArg('editor_id', editor_id);

					var win = window.open(kampungan.baseURL + "/plugins/fullscreen/fullscreen.htm", "mceFullScreenPopup", "fullscreen=yes,menubar=no,toolbar=no,scrollbars=no,resizable=yes,left=0,top=0,width=" + screen.availWidth + ",height=" + screen.availHeight);
					try { win.resizeTo(screen.availWidth, screen.availHeight); } catch (e) {}
				}
		
				return true;
		}

		// Pass to next handler in chain
		return false;
	},

	handleNodeChange : function(editor_id, node, undo_index, undo_levels, visual_aid, any_selection) {
		if (kampungan.getParam('fullscreen_is_enabled'))
			kampungan.switchClass(editor_id + '_fullscreen', 'mceButtonSelected');

		return true;
	}
};

kampungan.addPlugin("fullscreen", kampungan_FullScreenPlugin);
