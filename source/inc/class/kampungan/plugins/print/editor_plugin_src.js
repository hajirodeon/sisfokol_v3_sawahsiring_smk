/**
 * $RCSfile: editor_plugin_src.js,v $
 * $Revision: 1.19 $
 * $Date: 2006/02/10 16:29:40 $
 *
 * @author Moxiecode
 * @copyright Copyright © 2004-2006, Moxiecode Systems AB, All rights reserved.
 */

/* Import theme	specific language pack */
kampungan.importPluginLanguagePack('print', 'en,tr,sv,zh_cn,fa,fr_ca,fr,de,pl,pt_br,cs,nl,da,he,nb,hu,ru,ru_KOI8-R,ru_UTF-8,nn,fi,es,cy,is,zh_tw,zh_tw_utf8,sk');

var kampungan_PrintPlugin = {
	getInfo : function() {
		return {
			longname : 'Print',
			author : 'Moxiecode Systems',
			authorurl : 'http://kampungan.moxiecode.com',
			infourl : 'http://kampungan.moxiecode.com/kampungan/docs/plugin_print.html',
			version : kampungan.majorVersion + "." + kampungan.minorVersion
		};
	},

	getControlHTML : function(cn)	{
		switch (cn) {
			case "print":
				return kampungan.getButtonHTML(cn, 'lang_print_desc', '{$pluginurl}/images/print.gif', 'mcePrint');
		}

		return "";
	},

	/**
	 * Executes	the	search/replace commands.
	 */
	execCommand : function(editor_id, element, command,	user_interface,	value) {
		// Handle commands
		switch (command) {
			case "mcePrint":
				kampungan.getInstanceById(editor_id).contentWindow.print();
				return true;
		}

		// Pass to next handler in chain
		return false;
	}
};

kampungan.addPlugin("print", kampungan_PrintPlugin);
