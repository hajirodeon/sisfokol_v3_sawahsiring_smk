/**
 * $RCSfile: editor_plugin_src.js,v $
 * $Revision: 1.30 $
 * $Date: 2006/02/10 16:29:37 $
 *
 * @author Moxiecode
 * @copyright Copyright © 2004-2006, Moxiecode Systems AB, All rights reserved.
 */

/* Import plugin specific language pack */
kampungan.importPluginLanguagePack('advimage', 'en,tr,de,sv,zh_cn,cs,fa,fr_ca,fr,pl,pt_br,nl,he,nb,ru,ru_KOI8-R,ru_UTF-8,nn,cy,es,is,zh_tw,zh_tw_utf8,sk,da');

var kampungan_AdvancedImagePlugin = {
	getInfo : function() {
		return {
			longname : 'Advanced image',
			author : 'Moxiecode Systems',
			authorurl : 'http://kampungan.moxiecode.com',
			infourl : 'http://kampungan.moxiecode.com/kampungan/docs/plugin_advimage.html',
			version : kampungan.majorVersion + "." + kampungan.minorVersion
		};
	},

	getControlHTML : function(cn) {
		switch (cn) {
			case "image":
				return kampungan.getButtonHTML(cn, 'lang_image_desc', '{$themeurl}/images/image.gif', 'mceAdvImage');
		}

		return "";
	},

	execCommand : function(editor_id, element, command, user_interface, value) {
		switch (command) {
			case "mceAdvImage":
				var template = new Array();

				template['file']   = '../../plugins/advimage/image.htm';
				template['width']  = 480;
				template['height'] = 380;

				// Language specific width and height addons
				template['width']  += kampungan.getLang('lang_advimage_delta_width', 0);
				template['height'] += kampungan.getLang('lang_advimage_delta_height', 0);

				var inst = kampungan.getInstanceById(editor_id);
				var elm = inst.getFocusElement();

				if (elm != null && kampungan.getAttrib(elm, 'class').indexOf('mceItem') != -1)
					return true;

				kampungan.openWindow(template, {editor_id : editor_id, inline : "yes"});

				return true;
		}

		return false;
	},

	cleanup : function(type, content) {
		switch (type) {
			case "insert_to_editor_dom":
				var imgs = content.getElementsByTagName("img");
				for (var i=0; i<imgs.length; i++) {
					var onmouseover = kampungan.cleanupEventStr(kampungan.getAttrib(imgs[i], 'onmouseover'));
					var onmouseout = kampungan.cleanupEventStr(kampungan.getAttrib(imgs[i], 'onmouseout'));

					if ((src = this._getImageSrc(onmouseover)) != "") {
						if (kampungan.getParam('convert_urls'))
							src = kampungan.convertRelativeToAbsoluteURL(kampungan.settings['base_href'], src);

						imgs[i].setAttribute('onmouseover', "this.src='" + src + "';");
					}

					if ((src = this._getImageSrc(onmouseout)) != "") {
						if (kampungan.getParam('convert_urls'))
							src = kampungan.convertRelativeToAbsoluteURL(kampungan.settings['base_href'], src);

						imgs[i].setAttribute('onmouseout', "this.src='" + src + "';");
					}
				}
				break;

			case "get_from_editor_dom":
				var imgs = content.getElementsByTagName("img");
				for (var i=0; i<imgs.length; i++) {
					var onmouseover = kampungan.cleanupEventStr(kampungan.getAttrib(imgs[i], 'onmouseover'));
					var onmouseout = kampungan.cleanupEventStr(kampungan.getAttrib(imgs[i], 'onmouseout'));

					if ((src = this._getImageSrc(onmouseover)) != "") {
						if (kampungan.getParam('convert_urls'))
							src = eval(kampungan.settings['urlconverter_callback'] + "(src, null, true);");

						imgs[i].setAttribute('onmouseover', "this.src='" + src + "';");
					}

					if ((src = this._getImageSrc(onmouseout)) != "") {
						if (kampungan.getParam('convert_urls'))
							src = eval(kampungan.settings['urlconverter_callback'] + "(src, null, true);");

						imgs[i].setAttribute('onmouseout', "this.src='" + src + "';");
					}
				}
				break;
		}

		return content;
	},

	handleNodeChange : function(editor_id, node, undo_index, undo_levels, visual_aid, any_selection) {
		if (node == null)
			return;

		do {
			if (node.nodeName == "IMG" && kampungan.getAttrib(node, 'class').indexOf('mceItem') == -1) {
				kampungan.switchClass(editor_id + '_advimage', 'mceButtonSelected');
				return true;
			}
		} while ((node = node.parentNode));

		kampungan.switchClass(editor_id + '_advimage', 'mceButtonNormal');

		return true;
	},

	/**
	 * Returns the image src from a scripted mouse over image str.
	 *
	 * @param {string} s String to get real src from.
	 * @return Image src from a scripted mouse over image str.
	 * @type string
	 */
	_getImageSrc : function(s) {
		var sr, p = -1;

		if (!s)
			return "";

		if ((p = s.indexOf('this.src=')) != -1) {
			sr = s.substring(p + 10);
			sr = sr.substring(0, sr.indexOf('\''));

			return sr;
		}

		return "";
	}
};

kampungan.addPlugin("advimage", kampungan_AdvancedImagePlugin);
