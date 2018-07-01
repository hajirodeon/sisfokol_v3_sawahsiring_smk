/**
 * $RCSfile: editor_plugin_src.js,v $
 * $Revision: 1.23 $
 * $Date: 2006/02/10 16:29:38 $
 *
 * @author Moxiecode
 * @copyright Copyright © 2004-2006, Moxiecode Systems AB, All rights reserved.
 */

/* Import plugin specific language pack */
kampungan.importPluginLanguagePack('emotions', 'en,tr,sv,zh_cn,cs,fa,fr_ca,fr,de,pl,pt_br,nl,da,he,nb,hu,ru,ru_KOI8-R,ru_UTF-8,nn,es,cy,is,zh_tw,zh_tw_utf8,sk');

// Plucin static class
var kampungan_EmotionsPlugin = {
	getInfo : function() {
		return {
			longname : 'Emotions',
			author : 'Moxiecode Systems',
			authorurl : 'http://kampungan.moxiecode.com',
			infourl : 'http://kampungan.moxiecode.com/kampungan/docs/plugin_emotions.html',
			version : kampungan.majorVersion + "." + kampungan.minorVersion
		};
	},

	/**
	 * Returns the HTML contents of the emotions control.
	 */
	getControlHTML : function(cn) {
		switch (cn) {
			case "emotions":
				return kampungan.getButtonHTML(cn, 'lang_emotions_desc', '{$pluginurl}/images/emotions.gif', 'mceEmotion');
		}

		return "";
	},

	/**
	 * Executes the mceEmotion command.
	 */
	execCommand : function(editor_id, element, command, user_interface, value) {
		// Handle commands
		switch (command) {
			case "mceEmotion":
				var template = new Array();

				template['file'] = '../../plugins/emotions/emotions.htm'; // Relative to theme
				template['width'] = 160;
				template['height'] = 160;

				// Language specific width and height addons
				template['width'] += kampungan.getLang('lang_emotions_delta_width', 0);
				template['height'] += kampungan.getLang('lang_emotions_delta_height', 0);

				kampungan.openWindow(template, {editor_id : editor_id, inline : "yes"});

				return true;
		}

		// Pass to next handler in chain
		return false;
	}
};

// Register plugin
kampungan.addPlugin('emotions', kampungan_EmotionsPlugin);
