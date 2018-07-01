/**
 * $RCSfile: editor_plugin_src.js,v $
 * $Revision: 1.11 $
 * $Date: 2006/03/22 12:21:21 $
 *
 * @author Moxiecode
 * @copyright Copyright © 2004-2006, Moxiecode Systems AB, All rights reserved.
 */

/* Import plugin specific language pack */
kampungan.importPluginLanguagePack('autosave', 'en,tr,sv,cs,he,nb,hu,de,da,ru,ru_KOI8-R,ru_UTF-8,nn,fi,cy,es,is,pl,pt_br');

var kampungan_AutoSavePlugin = {
	getInfo : function() {
		return {
			longname : 'Auto save',
			author : 'Moxiecode Systems',
			authorurl : 'http://kampungan.moxiecode.com',
			infourl : 'http://kampungan.moxiecode.com/kampungan/docs/plugin_autosave.html',
			version : kampungan.majorVersion + "." + kampungan.minorVersion
		};
	},

	// Private plugin internal methods

	_beforeUnloadHandler : function() {
		var n, inst, anyDirty = false, msg = kampungan.getLang("lang_autosave_unload_msg");

		if (kampungan.getParam("fullscreen_is_enabled"))
			return;

		for (n in kampungan.instances) {
			inst = kampungan.instances[n];

			if (!kampungan.isInstance(inst))
				continue;

			if (inst.isDirty())
				return msg;
		}

		return;
	}
};

window.onbeforeunload = kampungan_AutoSavePlugin._beforeUnloadHandler;

kampungan.addPlugin("autosave", kampungan_AutoSavePlugin);
