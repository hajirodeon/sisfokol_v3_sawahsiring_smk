/**
 * $RCSfile: editor_template_src.js,v $
 * $Revision: 1.96 $
 * $Date: 2006/04/18 13:32:52 $
 *
 * @author Moxiecode
 * @copyright Copyright © 2004-2006, Moxiecode Systems AB, All rights reserved.
 */

/* Import theme specific language pack */
kampungan.importThemeLanguagePack('advanced');

var kampungan_AdvancedTheme = {
	// Private theme fields
	_autoImportCSSClasses : true,
	_resizer : {},
	_buttons : [
		// Control id, button img, button title, command, user_interface, value
		['bold', '{$lang_bold_img}', 'lang_bold_desc', 'Bold'],
		['italic', '{$lang_italic_img}', 'lang_italic_desc', 'Italic'],
		['underline', '{$lang_underline_img}', 'lang_underline_desc', 'Underline'],
		['strikethrough', 'strikethrough.gif', 'lang_striketrough_desc', 'Strikethrough'],
		['justifyleft', 'justifyleft.gif', 'lang_justifyleft_desc', 'JustifyLeft'],
		['justifycenter', 'justifycenter.gif', 'lang_justifycenter_desc', 'JustifyCenter'],
		['justifyright', 'justifyright.gif', 'lang_justifyright_desc', 'JustifyRight'],
		['justifyfull', 'justifyfull.gif', 'lang_justifyfull_desc', 'JustifyFull'],
		['bullist', 'bullist.gif', 'lang_bullist_desc', 'InsertUnorderedList'],
		['numlist', 'numlist.gif', 'lang_numlist_desc', 'InsertOrderedList'],
		['outdent', 'outdent.gif', 'lang_outdent_desc', 'Outdent'],
		['indent', 'indent.gif', 'lang_indent_desc', 'Indent'],
		['cut', 'cut.gif', 'lang_cut_desc', 'Cut'],
		['copy', 'copy.gif', 'lang_copy_desc', 'Copy'],
		['paste', 'paste.gif', 'lang_paste_desc', 'Paste'],
		['undo', 'undo.gif', 'lang_undo_desc', 'Undo'],
		['redo', 'redo.gif', 'lang_redo_desc', 'Redo'],
		['link', 'link.gif', 'lang_link_desc', 'mceLink', true],
		['unlink', 'unlink.gif', 'lang_unlink_desc', 'unlink'],
		['image', 'image.gif', 'lang_image_desc', 'mceImage', true],
		['cleanup', 'cleanup.gif', 'lang_cleanup_desc', 'mceCleanup'],
		['help', 'help.gif', 'lang_help_desc', 'mceHelp'],
		['hr', 'hr.gif', 'lang_theme_hr_desc', 'inserthorizontalrule'],
		['removeformat', 'removeformat.gif', 'lang_theme_removeformat_desc', 'removeformat'],
		['sub', 'sub.gif', 'lang_theme_sub_desc', 'subscript'],
		['sup', 'sup.gif', 'lang_theme_sup_desc', 'superscript'],
		['forecolor', 'forecolor.gif', 'lang_theme_forecolor_desc', 'mceForeColor', true],
		['backcolor', 'backcolor.gif', 'lang_theme_backcolor_desc', 'mceBackColor', true],
		['charmap', 'charmap.gif', 'lang_theme_charmap_desc', 'mceCharMap'],
	//	['visualaid', 'visualaid.gif', 'lang_theme_visualaid_desc', 'mceToggleVisualAid'],
	//	['anchor', 'anchor.gif', 'lang_theme_anchor_desc', 'mceInsertAnchor'],
		['newdocument', 'newdocument.gif', 'lang_newdocument_desc', 'mceNewDocument']
	],

	_buttonMap : 'backcolor,bold,bullist,charmap,cleanup,copy,cut,forecolor,help,hr,image,indent,italic,justifycenter,justifyfull,justifyleft,justifyright,link,newdocument,numlist,outdent,paste,redo,removeformat,strikethrough,sub,sup,underline,undo,unlink,advhr,ltr,rtl,emotions,flash,fullpage,fullscreen,iespell,insertdate,inserttime,pastetext,pasteword,selectall,preview,print,save,replace,search,table,cell_props,delete_col,delete_row,col_after,col_before,row_after,row_before,merge_cells,row_props,split_cells',

	/**
	 * Returns HTML code for the specificed control.
	 */
	getControlHTML : function(button_name) {
		var i, x;

		// Lookup button in button list
		for (i=0; i<kampungan_AdvancedTheme._buttons.length; i++) {
			var but = kampungan_AdvancedTheme._buttons[i];

			if (but[0] == button_name)
				return kampungan.getButtonHTML(but[0], but[2], '{$themeurl}/images/' + but[1], but[3], (but.length > 4 ? but[4] : false), (but.length > 5 ? but[5] : null));
		}

		// Custom controlls other than buttons
		switch (button_name) {
			case "formatselect":
				var html = '<select id="{$editor_id}_formatSelect" name="{$editor_id}_formatSelect" onfocus="kampungan.addSelectAccessibility(event, this, window);" onchange="kampungan.execInstanceCommand(\'{$editor_id}\',\'FormatBlock\',false,this.options[this.selectedIndex].value);" class="mceSelectList">';
				var formats = kampungan.getParam("theme_advanced_blockformats", "p,address,pre,h1,h2,h3,h4,h5,h6", true).split(',');
				var lookup = [
					['p', '{$lang_theme_paragraph}'],
					['address', '{$lang_theme_address}'],
					['pre', '{$lang_theme_pre}'],
					['h1', '{$lang_theme_h1}'],
					['h2', '{$lang_theme_h2}'],
					['h3', '{$lang_theme_h3}'],
					['h4', '{$lang_theme_h4}'],
					['h5', '{$lang_theme_h5}'],
					['h6', '{$lang_theme_h6}'],
					['div', '{$lang_theme_div}'],
					['blockquote', '{$lang_theme_blockquote}'],
					['dt', '{$lang_theme_dt}'],
					['dd', '{$lang_theme_dd}'],
					['samp', '{$lang_theme_samp}']
				];

				html += '<option value="">{$lang_theme_block}</option>';

				// Build format select
				for (var i=0; i<formats.length; i++) {
					for (var x=0; x<lookup.length; x++) {
						if (formats[i] == lookup[x][0])
							html += '<option value="&lt;' + lookup[x][0] + '&gt;">' + lookup[x][1] + '</option>';
					}
				}

				html += '</select>';

				return html;

			//case "styleselect":
			//	return '<select id="{$editor_id}_styleSelect" onmousedown="kampungan.themes.advanced._setupCSSClasses(\'{$editor_id}\');" name="{$editor_id}_styleSelect" onfocus="kampungan.addSelectAccessibility(event,this,window);" onchange="kampungan.execInstanceCommand(\'{$editor_id}\',\'mceSetCSSClass\',false,this.options[this.selectedIndex].value);" class="mceSelectList">{$style_select_options}</select>';

			case "fontselect":
				var fontHTML = '<select id="{$editor_id}_fontNameSelect" name="{$editor_id}_fontNameSelect" onfocus="kampungan.addSelectAccessibility(event, this, window);" onchange="kampungan.execInstanceCommand(\'{$editor_id}\',\'FontName\',false,this.options[this.selectedIndex].value);" class="mceSelectList"><option value="">{$lang_theme_fontdefault}</option>';
				var iFonts = 'Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;WingDings=wingdings';
				var nFonts = 'Andale Mono=andale mono,times;Arial=arial,helvetica,sans-serif;Arial Black=arial black,avant garde;Book Antiqua=book antiqua,palatino;Comic Sans MS=comic sans ms,sand;Courier New=courier new,courier;Georgia=georgia,palatino;Helvetica=helvetica;Impact=impact,chicago;Symbol=symbol;Tahoma=tahoma,arial,helvetica,sans-serif;Terminal=terminal,monaco;Times New Roman=times new roman,times;Trebuchet MS=trebuchet ms,geneva;Verdana=verdana,geneva;Webdings=webdings;Wingdings=wingdings,zapf dingbats';
				var fonts = kampungan.getParam("theme_advanced_fonts", nFonts).split(';');
				for (i=0; i<fonts.length; i++) {
					if (fonts[i] != '') {
						var parts = fonts[i].split('=');
						fontHTML += '<option value="' + parts[1] + '">' + parts[0] + '</option>';
					}
				}

				fontHTML += '</select>';
				return fontHTML;

			case "fontsizeselect":
				return '<select id="{$editor_id}_fontSizeSelect" name="{$editor_id}_fontSizeSelect" onfocus="kampungan.addSelectAccessibility(event, this, window);" onchange="kampungan.execInstanceCommand(\'{$editor_id}\',\'FontSize\',false,this.options[this.selectedIndex].value);" class="mceSelectList">'+
						'<option value="0">{$lang_theme_font_size}</option>'+
						'<option value="1">1 (8 pt)</option>'+
						'<option value="2">2 (10 pt)</option>'+
						'<option value="3">3 (12 pt)</option>'+
						'<option value="4">4 (14 pt)</option>'+
						'<option value="5">5 (18 pt)</option>'+
						'<option value="6">6 (24 pt)</option>'+
						'<option value="7">7 (36 pt)</option>'+
						'</select>';

			case "|":
			case "separator":
				return '<img src="{$themeurl}/images/separator.gif" width="2" height="20" class="mceSeparatorLine" />';

			case "spacer":
				return '<img src="{$themeurl}/images/separator.gif" width="2" height="15" border="0" class="mceSeparatorLine" style="vertical-align: middle" />';

			case "rowseparator":
				return '<br />';
		}

		return "";
	},

	/**
	 * Theme specific execcommand handling.
	 */
	execCommand : function(editor_id, element, command, user_interface, value) {
		switch (command) {
			case "mceLink":
				var inst = kampungan.getInstanceById(editor_id);
				var doc = inst.getDoc();
				var selectedText = "";

				if (kampungan.isMSIE) {
					var rng = doc.selection.createRange();
					selectedText = rng.text;
				} else
					selectedText = inst.getSel().toString();

				if (!kampungan.linkElement) {
					if ((kampungan.selectedElement.nodeName.toLowerCase() != "img") && (selectedText.length <= 0))
						return true;
				}

				var href = "", target = "", title = "", onclick = "", action = "insert", style_class = "";

				if (kampungan.selectedElement.nodeName.toLowerCase() == "a")
					kampungan.linkElement = kampungan.selectedElement;

				// Is anchor not a link
				if (kampungan.linkElement != null && kampungan.getAttrib(kampungan.linkElement, 'href') == "")
					kampungan.linkElement = null;

				if (kampungan.linkElement) {
					href = kampungan.getAttrib(kampungan.linkElement, 'href');
					target = kampungan.getAttrib(kampungan.linkElement, 'target');
					title = kampungan.getAttrib(kampungan.linkElement, 'title');
					onclick = kampungan.getAttrib(kampungan.linkElement, 'onclick');
					style_class = kampungan.getAttrib(kampungan.linkElement, 'class');

					// Try old onclick to if copy/pasted content
					if (onclick == "")
						onclick = kampungan.getAttrib(kampungan.linkElement, 'onclick');

					onclick = kampungan.cleanupEventStr(onclick);

					href = eval(kampungan.settings['urlconverter_callback'] + "(href, kampungan.linkElement, true);");

					// Use mce_href if defined
					mceRealHref = kampungan.getAttrib(kampungan.linkElement, 'mce_href');
					if (mceRealHref != "") {
						href = mceRealHref;

						if (kampungan.getParam('convert_urls'))
							href = eval(kampungan.settings['urlconverter_callback'] + "(href, kampungan.linkElement, true);");
					}

					action = "update";
				}

				var template = new Array();

				template['file'] = 'link.htm';
				template['width'] = 310;
				template['height'] = 200;

				// Language specific width and height addons
				template['width'] += kampungan.getLang('lang_insert_link_delta_width', 0);
				template['height'] += kampungan.getLang('lang_insert_link_delta_height', 0);

				if (inst.settings['insertlink_callback']) {
					var returnVal = eval(inst.settings['insertlink_callback'] + "(href, target, title, onclick, action, style_class);");
					if (returnVal && returnVal['href'])
						kampungan_AdvancedTheme._insertLink(returnVal['href'], returnVal['target'], returnVal['title'], returnVal['onclick'], returnVal['style_class']);
				} else {
					kampungan.openWindow(template, {href : href, target : target, title : title, onclick : onclick, action : action, className : style_class, inline : "yes"});
				}

				return true;

			case "mceImage":
				var src = "", alt = "", border = "", hspace = "", vspace = "", width = "", height = "", align = "";
				var title = "", onmouseover = "", onmouseout = "", action = "insert";
				var img = kampungan.imgElement;
				var inst = kampungan.getInstanceById(editor_id);

				if (kampungan.selectedElement != null && kampungan.selectedElement.nodeName.toLowerCase() == "img") {
					img = kampungan.selectedElement;
					kampungan.imgElement = img;
				}

				if (img) {
					// Is it a internal MCE visual aid image, then skip this one.
					if (kampungan.getAttrib(img, 'name').indexOf('mce_') == 0)
						return true;

					src = kampungan.getAttrib(img, 'src');
					alt = kampungan.getAttrib(img, 'alt');

					// Try polling out the title
					if (alt == "")
						alt = kampungan.getAttrib(img, 'title');

					// Fix width/height attributes if the styles is specified
					if (kampungan.isGecko) {
						var w = img.style.width;
						if (w != null && w != "")
							img.setAttribute("width", w);

						var h = img.style.height;
						if (h != null && h != "")
							img.setAttribute("height", h);
					}

					border = kampungan.getAttrib(img, 'border');
					hspace = kampungan.getAttrib(img, 'hspace');
					vspace = kampungan.getAttrib(img, 'vspace');
					width = kampungan.getAttrib(img, 'width');
					height = kampungan.getAttrib(img, 'height');
					align = kampungan.getAttrib(img, 'align');
					onmouseover = kampungan.getAttrib(img, 'onmouseover');
					onmouseout = kampungan.getAttrib(img, 'onmouseout');
					title = kampungan.getAttrib(img, 'title');

					// Is realy specified?
					if (kampungan.isMSIE) {
						width = img.attributes['width'].specified ? width : "";
						height = img.attributes['height'].specified ? height : "";
					}

					//onmouseover = kampungan.getImageSrc(kampungan.cleanupEventStr(onmouseover));
					//onmouseout = kampungan.getImageSrc(kampungan.cleanupEventStr(onmouseout));

					src = eval(kampungan.settings['urlconverter_callback'] + "(src, img, true);");

					// Use mce_src if defined
					mceRealSrc = kampungan.getAttrib(img, 'mce_src');
					if (mceRealSrc != "") {
						src = mceRealSrc;

						if (kampungan.getParam('convert_urls'))
							src = eval(kampungan.settings['urlconverter_callback'] + "(src, img, true);");
					}

					//if (onmouseover != "")
					//	onmouseover = eval(kampungan.settings['urlconverter_callback'] + "(onmouseover, img, true);");

					//if (onmouseout != "")
					//	onmouseout = eval(kampungan.settings['urlconverter_callback'] + "(onmouseout, img, true);");

					action = "update";
				}

				var template = new Array();

				template['file'] = 'image.htm?src={$src}';
				template['width'] = 355;
				template['height'] = 265 + (kampungan.isMSIE ? 25 : 0);

				// Language specific width and height addons
				template['width'] += kampungan.getLang('lang_insert_image_delta_width', 0);
				template['height'] += kampungan.getLang('lang_insert_image_delta_height', 0);

				if (inst.settings['insertimage_callback']) {
					var returnVal = eval(inst.settings['insertimage_callback'] + "(src, alt, border, hspace, vspace, width, height, align, title, onmouseover, onmouseout, action);");
					if (returnVal && returnVal['src'])
						kampungan_AdvancedTheme._insertImage(returnVal['src'], returnVal['alt'], returnVal['border'], returnVal['hspace'], returnVal['vspace'], returnVal['width'], returnVal['height'], returnVal['align'], returnVal['title'], returnVal['onmouseover'], returnVal['onmouseout']);
				} else
					kampungan.openWindow(template, {src : src, alt : alt, border : border, hspace : hspace, vspace : vspace, width : width, height : height, align : align, title : title, onmouseover : onmouseover, onmouseout : onmouseout, action : action, inline : "yes"});

				return true;

			case "mceForeColor":
				var template = new Array();
				var elm = kampungan.selectedInstance.getFocusElement();
				var inputColor = kampungan.getAttrib(elm, "color");

				if (inputColor == '')
					inputColor = elm.style.color;

				if (!inputColor)
					inputColor = "#000000";

				template['file'] = 'color_picker.htm';
				template['width'] = 220;
				template['height'] = 190;

				kampungan.openWindow(template, {editor_id : editor_id, inline : "yes", command : "forecolor", input_color : inputColor});
			return true;

			case "mceBackColor":
				var template = new Array();
				var elm = kampungan.selectedInstance.getFocusElement();
				var inputColor = elm.style.backgroundColor;

				if (!inputColor)
					inputColor = "#000000";

				template['file'] = 'color_picker.htm';
				template['width'] = 220;
				template['height'] = 190;

				template['width'] += kampungan.getLang('lang_theme_advanced_backcolor_delta_width', 0);
				template['height'] += kampungan.getLang('lang_theme_advanced_backcolor_delta_height', 0);

				kampungan.openWindow(template, {editor_id : editor_id, inline : "yes", command : "HiliteColor", input_color : inputColor});
				//mceBackColor
			return true;

			case "mceColorPicker":
				if (user_interface) {
					var template = new Array();
					var inputColor = value['document'].getElementById(value['element_id']).value;

					template['file'] = 'color_picker.htm';
					template['width'] = 220;
					template['height'] = 190;
					template['close_previous'] = "no";

					template['width'] += kampungan.getLang('lang_theme_advanced_colorpicker_delta_width', 0);
					template['height'] += kampungan.getLang('lang_theme_advanced_colorpicker_delta_height', 0);

					if (typeof(value['store_selection']) == "undefined")
						value['store_selection'] = true;

					kampungan.lastColorPickerValue = value;
					kampungan.openWindow(template, {editor_id : editor_id, mce_store_selection : value['store_selection'], inline : "yes", command : "mceColorPicker", input_color : inputColor});
				} else {
					var savedVal = kampungan.lastColorPickerValue;
					var elm = savedVal['document'].getElementById(savedVal['element_id']);
					elm.value = value;

					if (elm.onchange != null && elm.onchange != '')
						eval('elm.onchange();');
				}
			return true;

			

			case "mceCharMap":
				var template = new Array();

				template['file'] = 'charmap.htm';
				template['width'] = 550 + (kampungan.isOpera ? 40 : 0);
				template['height'] = 250;

				template['width'] += kampungan.getLang('lang_theme_advanced_charmap_delta_width', 0);
				template['height'] += kampungan.getLang('lang_theme_advanced_charmap_delta_height', 0);

				kampungan.openWindow(template, {editor_id : editor_id, inline : "yes"});
				return true;

			

			case "mceNewDocument":
				if (confirm(kampungan.getLang('lang_newdocument')))
					kampungan.execInstanceCommand(editor_id, 'mceSetContent', false, ' ');

				return true;
		}

		return false;
	},

	/**
	 * Editor instance template function.
	 */
	getEditorTemplate : function(settings, editorId) {
		function removeFromArray(in_array, remove_array) {
			var outArray = new Array();
			
			for (var i=0; i<in_array.length; i++) {
				skip = false;

				for (var j=0; j<remove_array.length; j++) {
					if (in_array[i] == remove_array[j]) {
						skip = true;
					}
				}

				if (!skip) {
					outArray[outArray.length] = in_array[i];
				}
			}

			return outArray;
		}

		function addToArray(in_array, add_array) {
			for (var i=0; i<add_array.length; i++) {
				in_array[in_array.length] = add_array[i];
			}

			return in_array;
		}

		var template = new Array();
		var deltaHeight = 0;
		var resizing = kampungan.getParam("theme_advanced_resizing", false);
		var path = kampungan.getParam("theme_advanced_path", true);
		var statusbarHTML = '<div id="{$editor_id}_path" class="mceStatusbarPathText" style="display: ' + (path ? "block" : "none") + '">&#160;</div><div id="{$editor_id}_resize" class="mceStatusbarResize" style="display: ' + (resizing ? "block" : "none") + '" onmousedown="kampungan.themes.advanced._setResizing(event,\'{$editor_id}\',true);"></div><br style="clear: both" />';
		var layoutManager = kampungan.getParam("theme_advanced_layout_manager", "SimpleLayout");

		// Setup style select options -- MOVED UP FOR EXTERNAL TOOLBAR COMPATABILITY!
		var styleSelectHTML = '<option value="">{$lang_theme_style_select}</option>';
		if (settings['theme_advanced_styles']) {
			var stylesAr = settings['theme_advanced_styles'].split(';');
			
			for (var i=0; i<stylesAr.length; i++) {
				var key, value;

				key = stylesAr[i].split('=')[0];
				value = stylesAr[i].split('=')[1];

				styleSelectHTML += '<option value="' + value + '">' + key + '</option>';
			}

			kampungan_AdvancedTheme._autoImportCSSClasses = false;
		}

		switch(layoutManager) {
			case "SimpleLayout" : //the default kampungan Layout (for backwards compatibility)...
				var toolbarHTML = "";
				var toolbarLocation = kampungan.getParam("theme_advanced_toolbar_location", "bottom");
				var toolbarAlign = kampungan.getParam("theme_advanced_toolbar_align", "center");
				var pathLocation = kampungan.getParam("theme_advanced_path_location", "none"); // Compatiblity
				var statusbarLocation = kampungan.getParam("theme_advanced_statusbar_location", pathLocation);
				var defVals = {
					theme_advanced_buttons1 : "bold,italic,underline,strikethrough,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,styleselect,formatselect",
					theme_advanced_buttons2 : "bullist,numlist,separator,outdent,indent,separator,undo,redo,separator,link,unlink,image,cleanup,help",
					theme_advanced_buttons3 : "hr,removeformat,visualaid,separator,sub,sup,separator,charmap"
				};

				// Add accessibility control
				toolbarHTML += '<a href="#" accesskey="q" title="' + kampungan.getLang("lang_toolbar_focus") + '"';

				if (!kampungan.getParam("accessibility_focus"))
					toolbarHTML += ' onfocus="kampungan.getInstanceById(\'' + editorId + '\').getWin().focus();"';

				toolbarHTML += '></a>';

				// Render rows
				for (var i=1; i<100; i++) {
					var def = defVals["theme_advanced_buttons" + i];

					var buttons = kampungan.getParam("theme_advanced_buttons" + i, def == null ? '' : def, true, ',');
					if (buttons.length == 0)
						break;

					buttons = removeFromArray(buttons, kampungan.getParam("theme_advanced_disable", "", true, ','));
					buttons = addToArray(buttons, kampungan.getParam("theme_advanced_buttons" + i + "_add", "", true, ','));
					buttons = addToArray(kampungan.getParam("theme_advanced_buttons" + i + "_add_before", "", true, ','), buttons);

					for (var b=0; b<buttons.length; b++)
						toolbarHTML += kampungan.getControlHTML(buttons[b]);

					if (buttons.length > 0) {
						toolbarHTML += "<br />";
						deltaHeight -= 23;
					}
				}

				// Add accessibility control
				toolbarHTML += '<a href="#" accesskey="z" onfocus="kampungan.getInstanceById(\'' + editorId + '\').getWin().focus();"></a>';

				// Setup template html
				template['html'] = '<table class="mceEditor" border="0" cellpadding="0" cellspacing="0" width="{$width}" height="{$height}" style="width:{$width}px;height:{$height}px"><tbody>';

				if (toolbarLocation == "top") {
					template['html'] += '<tr><td class="mceToolbarTop" align="' + toolbarAlign + '" height="1" nowrap="nowrap">' + toolbarHTML + '</td></tr>';
				}

				if (statusbarLocation == "top") {
					template['html'] += '<tr><td class="mceStatusbarTop" height="1">' + statusbarHTML + '</td></tr>';
					deltaHeight -= 23;
				}

				template['html'] += '<tr><td align="center"><span id="{$editor_id}"></span></td></tr>';

				if (toolbarLocation == "bottom") {
					template['html'] += '<tr><td class="mceToolbarBottom" align="' + toolbarAlign + '" height="1">' + toolbarHTML + '</td></tr>';
				}

				// External toolbar changes
				if (toolbarLocation == "external") {
					var bod = document.body;
					var elm = document.createElement ("div");

					toolbarHTML = kampungan.replaceVar(toolbarHTML, 'style_select_options', styleSelectHTML);
					toolbarHTML = kampungan.applyTemplate(toolbarHTML, {editor_id : editorId});

					elm.className = "mceToolbarExternal";
					elm.id = editorId+"_toolbar";
					elm.innerHTML = '<table width="100%" border="0" align="center"><tr><td align="center">'+toolbarHTML+'</td></tr></table>';
					bod.appendChild (elm);
					// bod.style.marginTop = elm.offsetHeight + "px";

					deltaHeight = 0;
					kampungan.getInstanceById(editorId).toolbarElement = elm;

					//template['html'] = '<div id="mceExternalToolbar" align="center" class="mceToolbarExternal"><table width="100%" border="0" align="center"><tr><td align="center">'+toolbarHTML+'</td></tr></table></div>' + template["html"];
				} else {
					kampungan.getInstanceById(editorId).toolbarElement = null;
				}

				if (statusbarLocation == "bottom") {
					template['html'] += '<tr><td class="mceStatusbarBottom" height="1">' + statusbarHTML + '</td></tr>';
					deltaHeight -= 23;
				}

				template['html'] += '</tbody></table>';
				//"SimpleLayout"
			break;

			case "RowLayout" : //Container Layout - containers defined in "theme_advanced_containers" are rendered from top to bottom.
				template['html'] = '<table class="mceEditor" border="0" cellpadding="0" cellspacing="0" width="{$width}" height="{$height}" style="width:{$width}px;height:{$height}px"><tbody>';

				var containers = kampungan.getParam("theme_advanced_containers", "", true, ",");
				var defaultContainerCSS = kampungan.getParam("theme_advanced_containers_default_class", "container");
				var defaultContainerAlign = kampungan.getParam("theme_advanced_containers_default_align", "center");

				//Render Containers:
				for (var i = 0; i < containers.length; i++)
				{
					if (containers[i] == "mceEditor") //Exceptions for mceEditor and ...
						template['html'] += '<tr><td align="center" class="mceEditor_border"><span id="{$editor_id}"></span></td></tr>';
					else if (containers[i] == "mceElementpath" || containers[i] == "mceStatusbar") // ... mceElementpath:
					{
						var pathClass = "mceStatusbar";

						if (i == containers.length-1)
						{
							pathClass = "mceStatusbarBottom";
						}
						else if (i == 0)
						{
							pathClass = "mceStatusbar";
						}
						else
						{
							deltaHeight-=2;
						}

						template['html'] += '<tr><td class="' + pathClass + '" height="1">' + statusbarHTML + '</td></tr>';
						deltaHeight -= 22;
					} else { // Render normal Container
						var curContainer = kampungan.getParam("theme_advanced_container_"+containers[i], "", true, ',');
						var curContainerHTML = "";
						var curAlign = kampungan.getParam("theme_advanced_container_"+containers[i]+"_align", defaultContainerAlign);
						var curCSS = kampungan.getParam("theme_advanced_container_"+containers[i]+"_class", defaultContainerCSS);

						for (var j=0; j<curContainer.length; j++) {
							curContainerHTML += kampungan.getControlHTML(curContainer[j]);
						}

						if (curContainer.length > 0) {
							curContainerHTML += "<br />";
							deltaHeight -= 23;
						}

						template['html'] += '<tr><td class="' + curCSS + '" align="' + curAlign + '" height="1">' + curContainerHTML + '</td></tr>';
					}
				}

				template['html'] += '</tbody></table>';
				//RowLayout
			break;

			case "CustomLayout" : //User defined layout callback...
				var customLayout = kampungan.getParam("theme_advanced_custom_layout","");

				if (customLayout != "" && eval("typeof(" + customLayout + ")") != "undefined") {
					template = eval(customLayout + "(template);");
				}
			break;
		}

		if (resizing)
			template['html'] += '<span id="{$editor_id}_resize_box" class="mceResizeBox"></span>';

		template['html'] = kampungan.replaceVar(template['html'], 'style_select_options', styleSelectHTML);
		template['delta_width'] = 0;
		template['delta_height'] = deltaHeight;

		return template;
	},

	initInstance : function(inst) {
		if (kampungan.getParam("theme_advanced_resizing", false)) {
			if (kampungan.getParam("theme_advanced_resizing_use_cookie", true)) {
				var w = kampungan_AdvancedTheme._getCookie("kampungan_" + inst.editorId + "_width");
				var h = kampungan_AdvancedTheme._getCookie("kampungan_" + inst.editorId + "_height");

				kampungan_AdvancedTheme._resizeTo(inst, w, h, kampungan.getParam("theme_advanced_resize_horizontal", true));
			}
		}

		inst.addShortcut('ctrl', 'k', 'lang_link_desc', 'mceLink');
	},

	/**
	 * Node change handler.
	 */
	handleNodeChange : function(editor_id, node, undo_index, undo_levels, visual_aid, any_selection, setup_content) {
		function selectByValue(select_elm, value, first_index) {
			first_index = typeof(first_index) == "undefined" ? false : true;

			if (select_elm) {
				for (var i=0; i<select_elm.options.length; i++) {
					var ov = "" + select_elm.options[i].value;

					if (first_index && ov.toLowerCase().indexOf(value.toLowerCase()) == 0) {
						select_elm.selectedIndex = i;
						return true;
					}

					if (ov == value) {
						select_elm.selectedIndex = i;
						return true;
					}
				}
			}

			return false;
		};

		function getAttrib(elm, name) {
			return elm.getAttribute(name) ? elm.getAttribute(name) : "";
		};

		// No node provided
		if (node == null)
			return;

		// Update path
		var pathElm = document.getElementById(editor_id + "_path");
		var inst = kampungan.getInstanceById(editor_id);
		var doc = inst.getDoc();

		if (pathElm) {
			// Get node path
			var parentNode = node;
			var path = new Array();
			
			while (parentNode != null) {
				if (parentNode.nodeName.toUpperCase() == "BODY") {
					break;
				}

				// Only append element nodes to path
				if (parentNode.nodeType == 1 && kampungan.getAttrib(parentNode, "class").indexOf('mceItemHidden') == -1) {
					path[path.length] = parentNode;
				}

				parentNode = parentNode.parentNode;
			}

			// Setup HTML
			var html = "";
			for (var i=path.length-1; i>=0; i--) {
				var nodeName = path[i].nodeName.toLowerCase();
				var nodeData = "";

				if (nodeName == "b") {
					nodeName = "strong";
				}

				if (nodeName == "i") {
					nodeName = "em";
				}

				if (nodeName == "span") {
					var cn = kampungan.getAttrib(path[i], "class");
					if (cn != "" && cn.indexOf('mceItem') == -1)
						nodeData += "class: " + cn + " ";

					var st = kampungan.getAttrib(path[i], "style");
					if (st != "") {
						st = kampungan.serializeStyle(kampungan.parseStyle(st));
						nodeData += "style: " + st + " ";
					}
				}

				if (nodeName == "font") {
					if (kampungan.getParam("convert_fonts_to_spans"))
						nodeName = "span";

					var face = kampungan.getAttrib(path[i], "face");
					if (face != "")
						nodeData += "font: " + face + " ";

					var size = kampungan.getAttrib(path[i], "size");
					if (size != "")
						nodeData += "size: " + size + " ";

					var color = kampungan.getAttrib(path[i], "color");
					if (color != "")
						nodeData += "color: " + color + " ";
				}

				if (getAttrib(path[i], 'id') != "") {
					nodeData += "id: " + path[i].getAttribute('id') + " ";
				}

				var className = kampungan.getVisualAidClass(kampungan.getAttrib(path[i], "class"), false);
				if (className != "" && className.indexOf('mceItem') == -1)
					nodeData += "class: " + className + " ";

				if (getAttrib(path[i], 'src') != "") {
					var src = kampungan.getAttrib(path[i], "mce_src");

					if (src == "")
						 src = kampungan.getAttrib(path[i], "src");

					nodeData += "src: " + src + " ";
				}

				if (getAttrib(path[i], 'href') != "") {
					var href = kampungan.getAttrib(path[i], "mce_href");

					if (href == "")
						 href = kampungan.getAttrib(path[i], "href");

					nodeData += "href: " + href + " ";
				}

				if (nodeName == "img" && kampungan.getAttrib(path[i], "class").indexOf('mceItemFlash') != -1) {
					nodeName = "flash";
					nodeData = "src: " + path[i].getAttribute('title');
				}

				if (nodeName == "a" && (anchor = kampungan.getAttrib(path[i], "name")) != "") {
					nodeName = "a";
					nodeName += "#" + anchor;
					nodeData = "";
				}

				if (getAttrib(path[i], 'name').indexOf("mce_") != 0) {
					var className = kampungan.getVisualAidClass(kampungan.getAttrib(path[i], "class"), false);
					if (className != "" && className.indexOf('mceItem') == -1) {
						nodeName += "." + className;
					}
				}

				var cmd = 'kampungan.execInstanceCommand(\'' + editor_id + '\',\'mceSelectNodeDepth\',false,\'' + i + '\');';
				html += '<a title="' + nodeData + '" href="javascript:' + cmd + '" onclick="' + cmd + 'return false;" onmousedown="return false;" target="_self" class="mcePathItem">' + nodeName + '</a>';

				if (i > 0) {
					html += " &raquo; ";
				}
			}

			pathElm.innerHTML = '<a href="#" accesskey="x"></a>' + kampungan.getLang('lang_theme_path') + ": " + html + '&#160;';
		}

		// Reset old states
		kampungan.switchClass(editor_id + '_justifyleft', 'mceButtonNormal');
		kampungan.switchClass(editor_id + '_justifyright', 'mceButtonNormal');
		kampungan.switchClass(editor_id + '_justifycenter', 'mceButtonNormal');
		kampungan.switchClass(editor_id + '_justifyfull', 'mceButtonNormal');
		kampungan.switchClass(editor_id + '_bold', 'mceButtonNormal');
		kampungan.switchClass(editor_id + '_italic', 'mceButtonNormal');
		kampungan.switchClass(editor_id + '_underline', 'mceButtonNormal');
		kampungan.switchClass(editor_id + '_strikethrough', 'mceButtonNormal');
		kampungan.switchClass(editor_id + '_bullist', 'mceButtonNormal');
		kampungan.switchClass(editor_id + '_numlist', 'mceButtonNormal');
		kampungan.switchClass(editor_id + '_sub', 'mceButtonNormal');
		kampungan.switchClass(editor_id + '_sup', 'mceButtonNormal');
		kampungan.switchClass(editor_id + '_anchor', 'mceButtonNormal');
		kampungan.switchClass(editor_id + '_link', 'mceButtonDisabled');
		kampungan.switchClass(editor_id + '_unlink', 'mceButtonDisabled');
		kampungan.switchClass(editor_id + '_outdent', 'mceButtonDisabled');
		kampungan.switchClass(editor_id + '_image', 'mceButtonNormal');
		kampungan.switchClass(editor_id + '_hr', 'mceButtonNormal');

		if (node.nodeName == "A" && kampungan.getAttrib(node, "class").indexOf('mceItemAnchor') != -1)
			kampungan.switchClass(editor_id + '_anchor', 'mceButtonSelected');

		// Get link
		var anchorLink = kampungan.getParentElement(node, "a", "href");

		if (anchorLink || any_selection) {
			kampungan.switchClass(editor_id + '_link', anchorLink ? 'mceButtonSelected' : 'mceButtonNormal');
			kampungan.switchClass(editor_id + '_unlink', anchorLink ? 'mceButtonSelected' : 'mceButtonNormal');
		}

		// Handle visual aid
		kampungan.switchClass(editor_id + '_visualaid', visual_aid ? 'mceButtonSelected' : 'mceButtonNormal');

		if (undo_levels != -1) {
			kampungan.switchClass(editor_id + '_undo', 'mceButtonDisabled');
			kampungan.switchClass(editor_id + '_redo', 'mceButtonDisabled');
		}

		// Within li, blockquote
		if (kampungan.getParentElement(node, "li,blockquote"))
			kampungan.switchClass(editor_id + '_outdent', 'mceButtonNormal');

		// Has redo levels
		if (undo_index != -1 && (undo_index < undo_levels-1 && undo_levels > 0))
			kampungan.switchClass(editor_id + '_redo', 'mceButtonNormal');

		// Has undo levels
		if (undo_index != -1 && (undo_index > 0 && undo_levels > 0))
			kampungan.switchClass(editor_id + '_undo', 'mceButtonNormal');

		// Select class in select box
		var selectElm = document.getElementById(editor_id + "_styleSelect");
		
		if (selectElm) {
			kampungan_AdvancedTheme._setupCSSClasses(editor_id);

			classNode = node;
			breakOut = false;
			var index = 0;

			do {
				if (classNode && classNode.className) {
					for (var i=0; i<selectElm.options.length; i++) {
						if (selectElm.options[i].value == classNode.className) {
							index = i;
							breakOut = true;
							break;
						}
					}
				}
			} while (!breakOut && classNode != null && (classNode = classNode.parentNode) != null);

			selectElm.selectedIndex = index;
		}

		// Select formatblock
		var selectElm = document.getElementById(editor_id + "_formatSelect");
		if (selectElm) {
			var elm = kampungan.getParentElement(node, "p,div,h1,h2,h3,h4,h5,h6,pre,address");

			if (elm)
				selectByValue(selectElm, "<" + elm.nodeName.toLowerCase() + ">");
			else
				selectByValue(selectElm, "");
		}

		// Select fontselect
		var selectElm = document.getElementById(editor_id + "_fontNameSelect");
		if (selectElm) {
			if (!kampungan.isSafari && !(kampungan.isMSIE && !kampungan.isOpera)) {
				var face = inst.queryCommandValue('FontName');

				face = face == null || face == "" ? "" : face;

				selectByValue(selectElm, face, face != "");
			} else {
				var elm = kampungan.getParentElement(node, "font", "face");

				if (elm) {
					var family = kampungan.getAttrib(elm, "face");

					if (family == '')
						family = '' + elm.style.fontFamily;

					if (!selectByValue(selectElm, family, family != ""))
						selectByValue(selectElm, "");
				} else
					selectByValue(selectElm, "");
			}
		}

		// Select fontsize
		var selectElm = document.getElementById(editor_id + "_fontSizeSelect");
		if (selectElm) {
			if (!kampungan.isSafari && !kampungan.isOpera) {
				var size = inst.queryCommandValue('FontSize');
				selectByValue(selectElm, size == null || size == "" ? "0" : size);
			} else {
				var elm = kampungan.getParentElement(node, "font", "size");
				if (elm) {
					var size = kampungan.getAttrib(elm, "size");

					if (size == '') {
						var sizes = new Array('', '8px', '10px', '12px', '14px', '18px', '24px', '36px');

						size = '' + elm.style.fontSize;

						for (var i=0; i<sizes.length; i++) {
							if (('' + sizes[i]) == size) {
								size = i;
								break;
							}
						}
					}

					if (!selectByValue(selectElm, size))
						selectByValue(selectElm, "");
				} else
					selectByValue(selectElm, "0");
			}
		}

		// Handle align attributes
		alignNode = node;
		breakOut = false;
		do {
			if (!alignNode.getAttribute || !alignNode.getAttribute('align'))
				continue;

			switch (alignNode.getAttribute('align').toLowerCase()) {
				case "left":
					kampungan.switchClass(editor_id + '_justifyleft', 'mceButtonSelected');
					breakOut = true;
				break;

				case "right":
					kampungan.switchClass(editor_id + '_justifyright', 'mceButtonSelected');
					breakOut = true;
				break;

				case "middle":
				case "center":
					kampungan.switchClass(editor_id + '_justifycenter', 'mceButtonSelected');
					breakOut = true;
				break;

				case "justify":
					kampungan.switchClass(editor_id + '_justifyfull', 'mceButtonSelected');
					breakOut = true;
				break;
			}
		} while (!breakOut && (alignNode = alignNode.parentNode) != null);

		// Div justification
		var div = kampungan.getParentElement(node, "div");
		if (div && div.style.textAlign == "center")
			kampungan.switchClass(editor_id + '_justifycenter', 'mceButtonSelected');

		// Do special text
		if (!setup_content) {
			// , "JustifyLeft", "_justifyleft", "JustifyCenter", "justifycenter", "JustifyRight", "justifyright", "JustifyFull", "justifyfull", "InsertUnorderedList", "bullist", "InsertOrderedList", "numlist", "InsertUnorderedList", "bullist", "Outdent", "outdent", "Indent", "indent", "subscript", "sub"
			var ar = new Array("Bold", "_bold", "Italic", "_italic", "Strikethrough", "_strikethrough", "superscript", "_sup", "subscript", "_sub");
			for (var i=0; i<ar.length; i+=2) {
				if (inst.queryCommandState(ar[i]))
					kampungan.switchClass(editor_id + ar[i+1], 'mceButtonSelected');
			}

			if (inst.queryCommandState("Underline") && (node.parentNode == null || node.parentNode.nodeName != "A"))
				kampungan.switchClass(editor_id + '_underline', 'mceButtonSelected');
		}

		// Handle elements
		do {
			switch (node.nodeName) {
				case "UL":
					kampungan.switchClass(editor_id + '_bullist', 'mceButtonSelected');
				break;

				case "OL":
					kampungan.switchClass(editor_id + '_numlist', 'mceButtonSelected');
				break;

				case "HR":
					 kampungan.switchClass(editor_id + '_hr', 'mceButtonSelected');
				break;

				case "IMG":
				if (getAttrib(node, 'name').indexOf('mce_') != 0) {
					kampungan.switchClass(editor_id + '_image', 'mceButtonSelected');
				}
				break;
			}
		} while ((node = node.parentNode) != null);
	},

	// Private theme internal functions

	// This function auto imports CSS classes into the class selection droplist
	_setupCSSClasses : function(editor_id) {
		var i, selectElm;

		if (!kampungan_AdvancedTheme._autoImportCSSClasses)
			return;

		selectElm = document.getElementById(editor_id + '_styleSelect');

		if (selectElm && selectElm.getAttribute('cssImported') != 'true') {
			var csses = kampungan.getCSSClasses(editor_id);
			if (csses && selectElm)	{
				for (i=0; i<csses.length; i++)
					selectElm.options[selectElm.options.length] = new Option(csses[i], csses[i]);
			}

			// Only do this once
			if (csses != null && csses.length > 0)
				selectElm.setAttribute('cssImported', 'true');
		}
	},

	_setCookie : function(name, value, expires, path, domain, secure) {
		var curCookie = name + "=" + escape(value) +
			((expires) ? "; expires=" + expires.toGMTString() : "") +
			((path) ? "; path=" + escape(path) : "") +
			((domain) ? "; domain=" + domain : "") +
			((secure) ? "; secure" : "");

		document.cookie = curCookie;
	},

	_getCookie : function(name) {
		var dc = document.cookie;
		var prefix = name + "=";
		var begin = dc.indexOf("; " + prefix);

		if (begin == -1) {
			begin = dc.indexOf(prefix);

			if (begin != 0)
				return null;
		} else
			begin += 2;

		var end = document.cookie.indexOf(";", begin);

		if (end == -1)
			end = dc.length;

		return unescape(dc.substring(begin + prefix.length, end));
	},

	_resizeTo : function(inst, w, h, set_w) {
		var editorContainer = document.getElementById(inst.editorId + '_parent');
		var tableElm = editorContainer.firstChild;
		var iframe = inst.iframeElement;

		if (w == null || w == "null") {
			set_w = false;
			w = 0;
		}

		if (h == null || h == "null")
			return;

		w = parseInt(w);
		h = parseInt(h);

		if (kampungan.isGecko) {
			w += 2;
			h += 2;
		}

		var dx = w - tableElm.clientWidth;
		var dy = h - tableElm.clientHeight;

		w = w < 1 ? 30 : w;
		h = h < 1 ? 30 : h;

		if (set_w)
			tableElm.style.width = w + "px";

		tableElm.style.height = h + "px";

		iw = iframe.clientWidth + dx;
		ih = iframe.clientHeight + dy;

		iw = iw < 1 ? 30 : iw;
		ih = ih < 1 ? 30 : ih;

		if (kampungan.isGecko) {
			iw -= 2;
			ih -= 2;
		}

		if (set_w)
			iframe.style.width = iw + "px";

		iframe.style.height = ih + "px";

		// Is it to small, make it bigger again
		if (set_w) {
			var tableBodyElm = tableElm.firstChild;
			var minIframeWidth = tableBodyElm.scrollWidth;
			if (inst.iframeElement.clientWidth < minIframeWidth) {
				dx = minIframeWidth - inst.iframeElement.clientWidth;

				inst.iframeElement.style.width = (iw + dx) + "px";
			}
		}
	},

	/**
	 * Handles resizing events.
	 */
	_resizeEventHandler : function(e) {
		var resizer = kampungan_AdvancedTheme._resizer;

		// Do nothing
		if (!resizer.resizing)
			return;

		e = typeof(e) == "undefined" ? window.event : e;

		var dx = e.screenX - resizer.downX;
		var dy = e.screenY - resizer.downY;
		var resizeBox = resizer.resizeBox;
		var editorId = resizer.editorId;

		switch (e.type) {
			case "mousemove":
				var w, h;

				w = resizer.width + dx;
				h = resizer.height + dy;

				w = w < 1 ? 1 : w;
				h = h < 1 ? 1 : h;

				if (resizer.horizontal)
					resizeBox.style.width = w + "px";

				resizeBox.style.height = h + "px";
				break;

			case "mouseup":
				kampungan_AdvancedTheme._setResizing(e, editorId, false);
				kampungan_AdvancedTheme._resizeTo(kampungan.getInstanceById(editorId), resizer.width + dx, resizer.height + dy, resizer.horizontal);

				// Expire in a month
				if (kampungan.getParam("theme_advanced_resizing_use_cookie", true)) {
					var expires = new Date();
					expires.setTime(expires.getTime() + 3600000 * 24 * 30);

					// Set the cookies
					kampungan_AdvancedTheme._setCookie("kampungan_" + editorId + "_width", "" + (resizer.horizontal ? resizer.width + dx : ""), expires);
					kampungan_AdvancedTheme._setCookie("kampungan_" + editorId + "_height", "" + (resizer.height + dy), expires);
				}
				break;
		}
	},

	/**
	 * Starts/stops the editor resizing.
	 */
	_setResizing : function(e, editor_id, state) {
		e = typeof(e) == "undefined" ? window.event : e;

		var resizer = kampungan_AdvancedTheme._resizer;
		var editorContainer = document.getElementById(editor_id + '_parent');
		var editorArea = document.getElementById(editor_id + '_parent').firstChild;
		var resizeBox = document.getElementById(editor_id + '_resize_box');
		var inst = kampungan.getInstanceById(editor_id);

		if (state) {
			// Place box over editor area
			var width = editorArea.clientWidth;
			var height = editorArea.clientHeight;

			resizeBox.style.width = width + "px";
			resizeBox.style.height = height + "px";

			resizer.iframeWidth = inst.iframeElement.clientWidth;
			resizer.iframeHeight = inst.iframeElement.clientHeight;

			// Hide editor and show resize box
			editorArea.style.display = "none";
			resizeBox.style.display = "block";

			// Add event handlers, only once
			if (!resizer.eventHandlers) {
				if (kampungan.isMSIE)
					kampungan.addEvent(document, "mousemove", kampungan_AdvancedTheme._resizeEventHandler);
				else
					kampungan.addEvent(window, "mousemove", kampungan_AdvancedTheme._resizeEventHandler);

				kampungan.addEvent(document, "mouseup", kampungan_AdvancedTheme._resizeEventHandler);

				resizer.eventHandlers = true;
			}

			resizer.resizing = true;
			resizer.downX = e.screenX;
			resizer.downY = e.screenY;
			resizer.width = parseInt(resizeBox.style.width);
			resizer.height = parseInt(resizeBox.style.height);
			resizer.editorId = editor_id;
			resizer.resizeBox = resizeBox;
			resizer.horizontal = kampungan.getParam("theme_advanced_resize_horizontal", true);
		} else {
			resizer.resizing = false;
			resizeBox.style.display = "none";
			editorArea.style.display = kampungan.isMSIE && !kampungan.isOpera ? "block" : "table";
			kampungan.execCommand('mceResetDesignMode');
		}
	},

	_insertImage : function(src, alt, border, hspace, vspace, width, height, align, title, onmouseover, onmouseout) {
		kampungan.execCommand('mceBeginUndoLevel');

		if (src == "")
			return;

		if (!kampungan.imgElement && kampungan.isSafari) {
			var html = "";

			html += '<img src="' + src + '" alt="' + alt + '"';
			html += ' border="' + border + '" hspace="' + hspace + '"';
			html += ' vspace="' + vspace + '" width="' + width + '"';
			html += ' height="' + height + '" align="' + align + '" title="' + title + '" onmouseover="' + onmouseover + '" onmouseout="' + onmouseout + '" />';

			kampungan.execCommand("mceInsertContent", false, html);
		} else {
			if (!kampungan.imgElement && kampungan.selectedInstance) {
				if (kampungan.isSafari)
					kampungan.execCommand("mceInsertContent", false, '<img src="' + kampungan.uniqueURL + '" />');
				else
					kampungan.selectedInstance.contentDocument.execCommand("insertimage", false, kampungan.uniqueURL);

				kampungan.imgElement = kampungan.getElementByAttributeValue(kampungan.selectedInstance.contentDocument.body, "img", "src", kampungan.uniqueURL);
			}
		}

		if (kampungan.imgElement) {
			var needsRepaint = false;
			var msrc = src;

			src = eval(kampungan.settings['urlconverter_callback'] + "(src, kampungan.imgElement);");

			if (kampungan.getParam('convert_urls'))
				msrc = src;

			if (onmouseover && onmouseover != "")
				onmouseover = "this.src='" + eval(kampungan.settings['urlconverter_callback'] + "(onmouseover, kampungan.imgElement);") + "';";

			if (onmouseout && onmouseout != "")
				onmouseout = "this.src='" + eval(kampungan.settings['urlconverter_callback'] + "(onmouseout, kampungan.imgElement);") + "';";

			// Use alt as title if it's undefined
			if (typeof(title) == "undefined")
				title = alt;

			if (width != kampungan.imgElement.getAttribute("width") || height != kampungan.imgElement.getAttribute("height") || align != kampungan.imgElement.getAttribute("align"))
				needsRepaint = true;

			kampungan.setAttrib(kampungan.imgElement, 'src', src);
			kampungan.setAttrib(kampungan.imgElement, 'mce_src', msrc);
			kampungan.setAttrib(kampungan.imgElement, 'alt', alt);
			kampungan.setAttrib(kampungan.imgElement, 'title', title);
			kampungan.setAttrib(kampungan.imgElement, 'align', align);
			kampungan.setAttrib(kampungan.imgElement, 'border', border, true);
			kampungan.setAttrib(kampungan.imgElement, 'hspace', hspace, true);
			kampungan.setAttrib(kampungan.imgElement, 'vspace', vspace, true);
			kampungan.setAttrib(kampungan.imgElement, 'width', width, true);
			kampungan.setAttrib(kampungan.imgElement, 'height', height, true);
			kampungan.setAttrib(kampungan.imgElement, 'onmouseover', onmouseover);
			kampungan.setAttrib(kampungan.imgElement, 'onmouseout', onmouseout);

			// Fix for bug #989846 - Image resize bug
			if (width && width != "")
				kampungan.imgElement.style.pixelWidth = width;

			if (height && height != "")
				kampungan.imgElement.style.pixelHeight = height;

			if (needsRepaint)
				kampungan.selectedInstance.repaint();
		}

		kampungan.execCommand('mceEndUndoLevel');
	},

	_insertLink : function(href, target, title, onclick, style_class) {
		kampungan.execCommand('mceBeginUndoLevel');

		if (kampungan.selectedInstance && kampungan.selectedElement && kampungan.selectedElement.nodeName.toLowerCase() == "img") {
			var doc = kampungan.selectedInstance.getDoc();
			var linkElement = kampungan.getParentElement(kampungan.selectedElement, "a");
			var newLink = false;

			if (!linkElement) {
				linkElement = doc.createElement("a");
				newLink = true;
			}

			var mhref = href;
			var thref = eval(kampungan.settings['urlconverter_callback'] + "(href, linkElement);");
			mhref = kampungan.getParam('convert_urls') ? href : mhref;

			kampungan.setAttrib(linkElement, 'href', thref);
			kampungan.setAttrib(linkElement, 'mce_href', mhref);
			kampungan.setAttrib(linkElement, 'target', target);
			kampungan.setAttrib(linkElement, 'title', title);
			kampungan.setAttrib(linkElement, 'onclick', onclick);
			kampungan.setAttrib(linkElement, 'class', style_class);

			if (newLink) {
				linkElement.appendChild(kampungan.selectedElement.cloneNode(true));
				kampungan.selectedElement.parentNode.replaceChild(linkElement, kampungan.selectedElement);
			}

			return;
		}

		if (!kampungan.linkElement && kampungan.selectedInstance) {
			if (kampungan.isSafari) {
				kampungan.execCommand("mceInsertContent", false, '<a href="' + kampungan.uniqueURL + '">' + kampungan.selectedInstance.selection.getSelectedHTML() + '</a>');
			} else
				kampungan.selectedInstance.contentDocument.execCommand("createlink", false, kampungan.uniqueURL);

			kampungan.linkElement = kampungan.getElementByAttributeValue(kampungan.selectedInstance.contentDocument.body, "a", "href", kampungan.uniqueURL);

			var elementArray = kampungan.getElementsByAttributeValue(kampungan.selectedInstance.contentDocument.body, "a", "href", kampungan.uniqueURL);

			for (var i=0; i<elementArray.length; i++) {
				var mhref = href;
				var thref = eval(kampungan.settings['urlconverter_callback'] + "(href, elementArray[i]);");
				mhref = kampungan.getParam('convert_urls') ? href : mhref;

				kampungan.setAttrib(elementArray[i], 'href', thref);
				kampungan.setAttrib(elementArray[i], 'mce_href', mhref);
				kampungan.setAttrib(elementArray[i], 'target', target);
				kampungan.setAttrib(elementArray[i], 'title', title);
				kampungan.setAttrib(elementArray[i], 'onclick', onclick);
				kampungan.setAttrib(elementArray[i], 'class', style_class);
			}

			kampungan.linkElement = elementArray[0];
		}

		if (kampungan.linkElement) {
			var mhref = href;
			href = eval(kampungan.settings['urlconverter_callback'] + "(href, kampungan.linkElement);");
			mhref = kampungan.getParam('convert_urls') ? href : mhref;

			kampungan.setAttrib(kampungan.linkElement, 'href', href);
			kampungan.setAttrib(kampungan.linkElement, 'mce_href', mhref);
			kampungan.setAttrib(kampungan.linkElement, 'target', target);
			kampungan.setAttrib(kampungan.linkElement, 'title', title);
			kampungan.setAttrib(kampungan.linkElement, 'onclick', onclick);
			kampungan.setAttrib(kampungan.linkElement, 'class', style_class);
		}

		kampungan.execCommand('mceEndUndoLevel');
	}
};

kampungan.addTheme("advanced", kampungan_AdvancedTheme);

// Add default buttons maps for advanced theme and all internal plugins
kampungan.addButtonMap(kampungan_AdvancedTheme._buttonMap);
