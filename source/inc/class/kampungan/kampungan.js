function kampungan_Engine() {
	this.majorVersion = "2";
	this.minorVersion = "0.6.1";
	this.releaseDate = "2006-05-04";

	this.instances = new Array();
	this.switchClassCache = new Array();
	this.windowArgs = new Array();
	this.loadedFiles = new Array();
	this.pendingFiles = new Array();
	this.loadingIndex = 0;
	this.configs = new Array();
	this.currentConfig = 0;
	this.eventHandlers = new Array();

	// Browser check
	var ua = navigator.userAgent;
	this.isMSIE = (navigator.appName == "Microsoft Internet Explorer");
	this.isMSIE5 = this.isMSIE && (ua.indexOf('MSIE 5') != -1);
	this.isMSIE5_0 = this.isMSIE && (ua.indexOf('MSIE 5.0') != -1);
	this.isGecko = ua.indexOf('Gecko') != -1;
	this.isSafari = ua.indexOf('Safari') != -1;
	this.isOpera = ua.indexOf('Opera') != -1;
	this.isMac = ua.indexOf('Mac') != -1;
	this.isNS7 = ua.indexOf('Netscape/7') != -1;
	this.isNS71 = ua.indexOf('Netscape/7.1') != -1;
	this.dialogCounter = 0;
	this.plugins = new Array();
	this.themes = new Array();
	this.menus = new Array();
	this.loadedPlugins = new Array();
	this.buttonMap = new Array();
	this.isLoaded = false;

	// Fake MSIE on Opera and if Opera fakes IE, Gecko or Safari cancel those
	if (this.isOpera) {
		this.isMSIE = true;
		this.isGecko = false;
		this.isSafari =  false;
	}

	// kampungan editor id instance counter
	this.idCounter = 0;
};

kampungan_Engine.prototype = {
	init : function(settings) {
		var theme;

		this.settings = settings;

		// Check if valid browser has execcommand support
		if (typeof(document.execCommand) == 'undefined')
			return;

		// Get script base path
		if (!kampungan.baseURL) {
			var elements = document.getElementsByTagName('script');

			for (var i=0; i<elements.length; i++) {
				if (elements[i].src && (elements[i].src.indexOf("kampungan.js") != -1 || elements[i].src.indexOf("kampungan_dev.js") != -1 || elements[i].src.indexOf("kampungan_src.js") != -1 || elements[i].src.indexOf("kampungan_gzip") != -1)) {
					var src = elements[i].src;

					kampungan.srcMode = (src.indexOf('_src') != -1 || src.indexOf('_dev') != -1) ? '_src' : '';
					kampungan.gzipMode = src.indexOf('_gzip') != -1;
					src = src.substring(0, src.lastIndexOf('/'));

					if (settings.exec_mode == "src" || settings.exec_mode == "normal")
						kampungan.srcMode = settings.exec_mode == "src" ? '_src' : '';

					kampungan.baseURL = src;
					break;
				}
			}
		}

		// Get document base path
		this.documentBasePath = document.location.href;
		if (this.documentBasePath.indexOf('?') != -1)
			this.documentBasePath = this.documentBasePath.substring(0, this.documentBasePath.indexOf('?'));
		this.documentURL = this.documentBasePath;
		this.documentBasePath = this.documentBasePath.substring(0, this.documentBasePath.lastIndexOf('/'));

		// If not HTTP absolute
		if (kampungan.baseURL.indexOf('://') == -1 && kampungan.baseURL.charAt(0) != '/') {
			// If site absolute
			kampungan.baseURL = this.documentBasePath + "/" + kampungan.baseURL;
		}

		// Set default values on settings
		this._def("mode", "none");
		this._def("theme", "advanced");
		this._def("plugins", "", true);
		this._def("language", "en");
		this._def("docs_language", this.settings['language']);
		this._def("elements", "");
		this._def("textarea_trigger", "mce_editable");
		this._def("editor_selector", "");
		this._def("editor_deselector", "mceNoEditor");
		this._def("valid_elements", "+a[id|style|rel|rev|charset|hreflang|dir|lang|tabindex|accesskey|type|name|href|target|title|class|onfocus|onblur|onclick|ondblclick|onmousedown|onmouseup|onmouseover|onmousemove|onmouseout|onkeypress|onkeydown|onkeyup],-strong/-b[class|style],-em/-i[class|style],-strike[class|style],-u[class|style],#p[id|style|dir|class|align],-ol[class|style],-ul[class|style],-li[class|style],br,img[id|dir|lang|longdesc|usemap|style|class|src|onmouseover|onmouseout|border|alt=|title|hspace|vspace|width|height|align],-sub[style|class],-sup[style|class],-blockquote[dir|style],-table[border=0|cellspacing|cellpadding|width|height|class|align|summary|style|dir|id|lang|bgcolor|background|bordercolor],-tr[id|lang|dir|class|rowspan|width|height|align|valign|style|bgcolor|background|bordercolor],tbody[id|class],thead[id|class],tfoot[id|class],-td[id|lang|dir|class|colspan|rowspan|width|height|align|valign|style|bgcolor|background|bordercolor|scope],-th[id|lang|dir|class|colspan|rowspan|width|height|align|valign|style|scope],caption[id|lang|dir|class|style],-div[id|dir|class|align|style],-span[style|class|align],-pre[class|align|style],address[class|align|style],-h1[id|style|dir|class|align],-h2[id|style|dir|class|align],-h3[id|style|dir|class|align],-h4[id|style|dir|class|align],-h5[id|style|dir|class|align],-h6[id|style|dir|class|align],hr[class|style],-font[face|size|style|id|class|dir|color],dd[id|class|title|style|dir|lang],dl[id|class|title|style|dir|lang],dt[id|class|title|style|dir|lang]");
		this._def("extended_valid_elements", "");
		this._def("invalid_elements", "");
		this._def("encoding", "");
		this._def("urlconverter_callback", kampungan.getParam("urlconvertor_callback", "kampungan_Engine.prototype.convertURL"));
		this._def("save_callback", "");
		this._def("debug", false);
		this._def("force_br_newlines", false);
		this._def("force_p_newlines", true);
		this._def("add_form_submit_trigger", true);
		this._def("relative_urls", true);
		this._def("remove_script_host", true);
		this._def("focus_alert", true);
		this._def("document_base_url", this.documentURL);
		this._def("visual", true);
		this._def("visual_table_class", "mceVisualAid");
		this._def("setupcontent_callback", "");
		this._def("fix_content_duplication", true);
		this._def("custom_undo_redo", true);
		this._def("custom_undo_redo_levels", -1);
		this._def("custom_undo_redo_keyboard_shortcuts", true);
		this._def("custom_undo_redo_restore_selection", true);
		this._def("verify_html", true);
		this._def("apply_source_formatting", false);
		this._def("directionality", "ltr");
		this._def("cleanup_on_startup", false);
		this._def("inline_styles", false);
		this._def("convert_newlines_to_brs", false);
		this._def("auto_reset_designmode", true);
		this._def("entities", "39,#39,160,nbsp,161,iexcl,162,cent,163,pound,164,curren,165,yen,166,brvbar,167,sect,168,uml,169,copy,170,ordf,171,laquo,172,not,173,shy,174,reg,175,macr,176,deg,177,plusmn,178,sup2,179,sup3,180,acute,181,micro,182,para,183,middot,184,cedil,185,sup1,186,ordm,187,raquo,188,frac14,189,frac12,190,frac34,191,iquest,192,Agrave,193,Aacute,194,Acirc,195,Atilde,196,Auml,197,Aring,198,AElig,199,Ccedil,200,Egrave,201,Eacute,202,Ecirc,203,Euml,204,Igrave,205,Iacute,206,Icirc,207,Iuml,208,ETH,209,Ntilde,210,Ograve,211,Oacute,212,Ocirc,213,Otilde,214,Ouml,215,times,216,Oslash,217,Ugrave,218,Uacute,219,Ucirc,220,Uuml,221,Yacute,222,THORN,223,szlig,224,agrave,225,aacute,226,acirc,227,atilde,228,auml,229,aring,230,aelig,231,ccedil,232,egrave,233,eacute,234,ecirc,235,euml,236,igrave,237,iacute,238,icirc,239,iuml,240,eth,241,ntilde,242,ograve,243,oacute,244,ocirc,245,otilde,246,ouml,247,divide,248,oslash,249,ugrave,250,uacute,251,ucirc,252,uuml,253,yacute,254,thorn,255,yuml,402,fnof,913,Alpha,914,Beta,915,Gamma,916,Delta,917,Epsilon,918,Zeta,919,Eta,920,Theta,921,Iota,922,Kappa,923,Lambda,924,Mu,925,Nu,926,Xi,927,Omicron,928,Pi,929,Rho,931,Sigma,932,Tau,933,Upsilon,934,Phi,935,Chi,936,Psi,937,Omega,945,alpha,946,beta,947,gamma,948,delta,949,epsilon,950,zeta,951,eta,952,theta,953,iota,954,kappa,955,lambda,956,mu,957,nu,958,xi,959,omicron,960,pi,961,rho,962,sigmaf,963,sigma,964,tau,965,upsilon,966,phi,967,chi,968,psi,969,omega,977,thetasym,978,upsih,982,piv,8226,bull,8230,hellip,8242,prime,8243,Prime,8254,oline,8260,frasl,8472,weierp,8465,image,8476,real,8482,trade,8501,alefsym,8592,larr,8593,uarr,8594,rarr,8595,darr,8596,harr,8629,crarr,8656,lArr,8657,uArr,8658,rArr,8659,dArr,8660,hArr,8704,forall,8706,part,8707,exist,8709,empty,8711,nabla,8712,isin,8713,notin,8715,ni,8719,prod,8721,sum,8722,minus,8727,lowast,8730,radic,8733,prop,8734,infin,8736,ang,8743,and,8744,or,8745,cap,8746,cup,8747,int,8756,there4,8764,sim,8773,cong,8776,asymp,8800,ne,8801,equiv,8804,le,8805,ge,8834,sub,8835,sup,8836,nsub,8838,sube,8839,supe,8853,oplus,8855,otimes,8869,perp,8901,sdot,8968,lceil,8969,rceil,8970,lfloor,8971,rfloor,9001,lang,9002,rang,9674,loz,9824,spades,9827,clubs,9829,hearts,9830,diams,34,quot,38,amp,60,lt,62,gt,338,OElig,339,oelig,352,Scaron,353,scaron,376,Yuml,710,circ,732,tilde,8194,ensp,8195,emsp,8201,thinsp,8204,zwnj,8205,zwj,8206,lrm,8207,rlm,8211,ndash,8212,mdash,8216,lsquo,8217,rsquo,8218,sbquo,8220,ldquo,8221,rdquo,8222,bdquo,8224,dagger,8225,Dagger,8240,permil,8249,lsaquo,8250,rsaquo,8364,euro", true);
		this._def("entity_encoding", "named");
		this._def("cleanup_callback", "");
		this._def("add_unload_trigger", true);
		this._def("ask", false);
		this._def("nowrap", false);
		this._def("auto_resize", false);
		this._def("auto_focus", false);
		this._def("cleanup", true);
		this._def("remove_linebreaks", true);
		this._def("button_tile_map", false);
		this._def("submit_patch", true);
		this._def("browsers", "msie,safari,gecko,opera", true);
		this._def("dialog_type", "window");
		this._def("accessibility_warnings", true);
		this._def("accessibility_focus", true);
		this._def("merge_styles_invalid_parents", "");
		this._def("force_hex_style_colors", true);
		this._def("trim_span_elements", true);
		this._def("convert_fonts_to_spans", false);
		this._def("doctype", '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">');
		this._def("font_size_classes", '');
		this._def("font_size_style_values", 'xx-small,x-small,small,medium,large,x-large,xx-large', true);
		this._def("event_elements", 'a,img', true);
		this._def("convert_urls", true);
		this._def("table_inline_editing", false);
		this._def("object_resizing", true);
		this._def("custom_shortcuts", true);
		this._def("convert_on_click", false);
		this._def("content_css", '');
		this._def("fix_list_elements", false);
		this._def("fix_table_elements", false);
		this._def("strict_loading_mode", document.contentType == 'application/xhtml+xml');
		this._def("hidden_tab_class", '');
		this._def("display_tab_class", '');

		// Force strict loading mode to false on non Gecko browsers
		if (this.isMSIE && !this.isOpera)
			this.settings.strict_loading_mode = false;

		// Browser check IE
		if (this.isMSIE && this.settings['browsers'].indexOf('msie') == -1)
			return;

		// Browser check Gecko
		if (this.isGecko && this.settings['browsers'].indexOf('gecko') == -1)
			return;

		// Browser check Safari
		if (this.isSafari && this.settings['browsers'].indexOf('safari') == -1)
			return;

		// Browser check Opera
		if (this.isOpera && this.settings['browsers'].indexOf('opera') == -1)
			return;

		// If not super absolute make it so
		var baseHREF = kampungan.settings['document_base_url'];
		var h = document.location.href;
		var p = h.indexOf('://');
		if (p > 0 && document.location.protocol != "file:") {
			p = h.indexOf('/', p + 3);
			h = h.substring(0, p);

			if (baseHREF.indexOf('://') == -1)
				baseHREF = h + baseHREF;

			kampungan.settings['document_base_url'] = baseHREF;
			kampungan.settings['document_base_prefix'] = h;
		}

		// Trim away query part
		if (baseHREF.indexOf('?') != -1)
			baseHREF = baseHREF.substring(0, baseHREF.indexOf('?'));

		this.settings['base_href'] = baseHREF.substring(0, baseHREF.lastIndexOf('/')) + "/";

		theme = this.settings['theme'];
		this.blockRegExp = new RegExp("^(h[1-6]|p|div|address|pre|form|table|li|ol|ul|td|blockquote|center|dl|dt|dd|dir|fieldset|form|noscript|noframes|menu|isindex|samp)$", "i");
		this.posKeyCodes = new Array(13,45,36,35,33,34,37,38,39,40);
		this.uniqueURL = 'javascript:kampungan_UNIQUEURL();'; // Make unique URL non real URL
		this.uniqueTag = '<div id="mceTMPElement" style="display: none">TMP</div>';
		this.callbacks = new Array('onInit', 'getInfo', 'getEditorTemplate', 'setupContent', 'onChange', 'onPageLoad', 'handleNodeChange', 'initInstance', 'execCommand', 'getControlHTML', 'handleEvent', 'cleanup');

		// Theme url
		this.settings['theme_href'] = kampungan.baseURL + "/themes/" + theme;

		if (!kampungan.isMSIE)
			this.settings['force_br_newlines'] = false;

		if (kampungan.getParam("popups_css", false)) {
			var cssPath = kampungan.getParam("popups_css", "");

			// Is relative
			if (cssPath.indexOf('://') == -1 && cssPath.charAt(0) != '/')
				this.settings['popups_css'] = this.documentBasePath + "/" + cssPath;
			else
				this.settings['popups_css'] = cssPath;
		} else
			this.settings['popups_css'] = kampungan.baseURL + "/themes/" + theme + "/css/editor_popup.css";

		if (kampungan.getParam("editor_css", false)) {
			var cssPath = kampungan.getParam("editor_css", "");

			// Is relative
			if (cssPath.indexOf('://') == -1 && cssPath.charAt(0) != '/')
				this.settings['editor_css'] = this.documentBasePath + "/" + cssPath;
			else
				this.settings['editor_css'] = cssPath;
		} else
			this.settings['editor_css'] = kampungan.baseURL + "/themes/" + theme + "/css/editor_ui.css";

		if (kampungan.settings['debug']) {
			var msg = "Debug: \n";

			msg += "baseURL: " + this.baseURL + "\n";
			msg += "documentBasePath: " + this.documentBasePath + "\n";
			msg += "content_css: " + this.settings['content_css'] + "\n";
			msg += "popups_css: " + this.settings['popups_css'] + "\n";
			msg += "editor_css: " + this.settings['editor_css'] + "\n";

			alert(msg);
		}

		// Only do this once
		if (this.configs.length == 0) {
			// Is Safari enabled
			if (this.isSafari && this.getParam('safari_warning', false))
				alert("Safari support is very limited and should be considered experimental.\nSo there is no need to even submit bugreports on this early version.\nYou can disable this message by setting: safari_warning option to false");

			if (typeof(kampunganCompressed) == "undefined") {
				kampungan.addEvent(window, "DOMContentLoaded", kampungan_Engine.prototype.onLoad);

				if (kampungan.isMSIE && !kampungan.isOpera) {
					if (document.body)
						kampungan.addEvent(document.body, "readystatechange", kampungan_Engine.prototype.onLoad);
					else
						kampungan.addEvent(document, "readystatechange", kampungan_Engine.prototype.onLoad);
				}

				kampungan.addEvent(window, "load", kampungan_Engine.prototype.onLoad);
				kampungan._addUnloadEvents();
			}
		}

		this.loadScript(kampungan.baseURL + '/themes/' + this.settings['theme'] + '/editor_template' + kampungan.srcMode + '.js');
		this.loadScript(kampungan.baseURL + '/langs/' + this.settings['language'] +  '.js');
		this.loadCSS(this.settings['editor_css']);

		// Add plugins
		var p = kampungan.getParam('plugins', '', true, ',');
		if (p.length > 0) {
			for (var i=0; i<p.length; i++) {
				if (p[i].charAt(0) != '-')
					this.loadScript(kampungan.baseURL + '/plugins/' + p[i] + '/editor_plugin' + kampungan.srcMode + '.js');
			}
		}

		// Setup entities
		settings['cleanup_entities'] = new Array();
		var entities = kampungan.getParam('entities', '', true, ',');
		for (var i=0; i<entities.length; i+=2)
			settings['cleanup_entities']['c' + entities[i]] = entities[i+1];

		// Save away this config
		settings['index'] = this.configs.length;
		this.configs[this.configs.length] = settings;

		// Start loading first one in chain
		this.loadNextScript();
	},

	_addUnloadEvents : function() {
		if (kampungan.isMSIE) {
			if (kampungan.settings['add_unload_trigger']) {
				kampungan.addEvent(window, "unload", kampungan_Engine.prototype.unloadHandler);
				kampungan.addEvent(window.document, "beforeunload", kampungan_Engine.prototype.unloadHandler);
			}
		} else {
			if (kampungan.settings['add_unload_trigger'])
				kampungan.addEvent(window, "unload", function () {kampungan.triggerSave(true, true);});
		}
	},

	_def : function(key, def_val, t) {
		var v = kampungan.getParam(key, def_val);

		v = t ? v.replace(/\s+/g,"") : v;

		this.settings[key] = v;
	},

	hasPlugin : function(n) {
		return typeof(this.plugins[n]) != "undefined" && this.plugins[n] != null;
	},

	addPlugin : function(n, p) {
		var op = this.plugins[n];

		// Use the previous plugin object base URL used when loading external plugins
		p.baseURL = op ? op.baseURL : kampungan.baseURL + "/plugins/" + n;
		this.plugins[n] = p;

		this.loadNextScript();
	},

	setPluginBaseURL : function(n, u) {
		var op = this.plugins[n];

		if (op)
			op.baseURL = u;
		else
			this.plugins[n] = {baseURL : u};
	},

	loadPlugin : function(n, u) {
		u = u.indexOf('.js') != -1 ? u.substring(0, u.lastIndexOf('/')) : u;
		u = u.charAt(u.length-1) == '/' ? u.substring(0, u.length-1) : u;
		this.plugins[n] = {baseURL : u};
		this.loadScript(u + "/editor_plugin" + (kampungan.srcMode ? '_src' : '') + ".js");
	},

	hasTheme : function(n) {
		return typeof(this.themes[n]) != "undefined" && this.themes[n] != null;
	},

	addTheme : function(n, t) {
		this.themes[n] = t;

		this.loadNextScript();
	},

	addMenu : function(n, m) {
		this.menus[n] = m;
	},

	hasMenu : function(n) {
		return typeof(this.plugins[n]) != "undefined" && this.plugins[n] != null;
	},

	loadScript : function(url) {
		var i;

		for (i=0; i<this.loadedFiles.length; i++) {
			if (this.loadedFiles[i] == url)
				return;
		}

		if (kampungan.settings.strict_loading_mode)
			this.pendingFiles[this.pendingFiles.length] = url;
		else
			document.write('<sc'+'ript language="javascript" type="text/javascript" src="' + url + '"></script>');

		this.loadedFiles[this.loadedFiles.length] = url;
	},

	loadNextScript : function() {
		var d = document, se;

		if (!kampungan.settings.strict_loading_mode)
			return;

		if (this.loadingIndex < this.pendingFiles.length) {
			se = d.createElementNS('http://www.w3.org/1999/xhtml', 'script');
			se.setAttribute('language', 'javascript');
			se.setAttribute('type', 'text/javascript');
			se.setAttribute('src', this.pendingFiles[this.loadingIndex++]);

			d.getElementsByTagName("head")[0].appendChild(se);
		} else
			this.loadingIndex = -1; // Done with loading
	},

	loadCSS : function(url) {
		var ar = url.replace(/\s+/, '').split(',');
		var lflen = 0, csslen = 0;
		var skip = false;
		var x = 0, i = 0, nl, le;

		for (x = 0,csslen = ar.length; x<csslen; x++) {
			ignore_css = false;

			if (ar[x] != null && ar[x] != 'null' && ar[x].length > 0) {
				/* Make sure it doesn't exist. */
				for (i=0, lflen=this.loadedFiles.length; i<lflen; i++) {
					if (this.loadedFiles[i] == ar[x]) {
						skip = true;
						break;
					}
				}

				if (!skip) {
					if (kampungan.settings.strict_loading_mode) {
						nl = document.getElementsByTagName("head");

						le = document.createElement('link');
						le.setAttribute('href', ar[x]);
						le.setAttribute('rel', 'stylesheet');
						le.setAttribute('type', 'text/css');

						nl[0].appendChild(le);			
					} else
						document.write('<link href="' + ar[x] + '" rel="stylesheet" type="text/css" />');

					this.loadedFiles[this.loadedFiles.length] = ar[x];
				}
			}
		}
	},

	importCSS : function(doc, css) {
		var css_ary = css.replace(/\s+/, '').split(',');
		var csslen, elm, headArr, x, css_file;

		for (x = 0, csslen = css_ary.length; x<csslen; x++) {
			css_file = css_ary[x];

			if (css_file != null && css_file != 'null' && css_file.length > 0) {
				// Is relative, make absolute
				if (css_file.indexOf('://') == -1 && css_file.charAt(0) != '/')
					css_file = this.documentBasePath + "/" + css_file;

				if (typeof(doc.createStyleSheet) == "undefined") {
					elm = doc.createElement("link");

					elm.rel = "stylesheet";
					elm.href = css_file;

					if ((headArr = doc.getElementsByTagName("head")) != null && headArr.length > 0)
						headArr[0].appendChild(elm);
				} else
					doc.createStyleSheet(css_file);
			}
		}
	},

	confirmAdd : function(e, settings) {
		var elm = kampungan.isMSIE ? event.srcElement : e.target;
		var elementId = elm.name ? elm.name : elm.id;

		kampungan.settings = settings;

		if (kampungan.settings['convert_on_click'] || (!elm.getAttribute('mce_noask') && confirm(kampunganLang['lang_edit_confirm'])))
			kampungan.addMCEControl(elm, elementId);

		elm.setAttribute('mce_noask', 'true');
	},

	updateContent : function(form_element_name) {
		// Find MCE instance linked to given form element and copy it's value
		var formElement = document.getElementById(form_element_name);
		for (var n in kampungan.instances) {
			var inst = kampungan.instances[n];
			if (!kampungan.isInstance(inst))
				continue;

			inst.switchSettings();

			if (inst.formElement == formElement) {
				var doc = inst.getDoc();
		
				kampungan._setHTML(doc, inst.formElement.value);

				if (!kampungan.isMSIE)
					doc.body.innerHTML = kampungan._cleanupHTML(inst, doc, this.settings, doc.body, inst.visualAid);
			}
		}
	},

	addMCEControl : function(replace_element, form_element_name, target_document) {
		var id = "mce_editor_" + kampungan.idCounter++;
		var inst = new kampungan_Control(kampungan.settings);

		inst.editorId = id;
		this.instances[id] = inst;

		inst._onAdd(replace_element, form_element_name, target_document);
	},

	removeMCEControl : function(editor_id) {
		var inst = kampungan.getInstanceById(editor_id);

		if (inst) {
			inst.switchSettings();

			editor_id = inst.editorId;
			var html = kampungan.getContent(editor_id);

			// Remove editor instance from instances array
			var tmpInstances = new Array();
			for (var instanceName in kampungan.instances) {
				var instance = kampungan.instances[instanceName];
				if (!kampungan.isInstance(instance))
					continue;

				if (instanceName != editor_id)
						tmpInstances[instanceName] = instance;
			}
			kampungan.instances = tmpInstances;

			kampungan.selectedElement = null;
			kampungan.selectedInstance = null;

			// Remove element
			var replaceElement = document.getElementById(editor_id + "_parent");
			var oldTargetElement = inst.oldTargetElement;
			var targetName = oldTargetElement.nodeName.toLowerCase();

			if (targetName == "textarea" || targetName == "input") {
				// Just show the old text area
				replaceElement.parentNode.removeChild(replaceElement);
				oldTargetElement.style.display = "inline";
				oldTargetElement.value = html;
			} else {
				oldTargetElement.innerHTML = html;
				oldTargetElement.style.display = 'block';

				replaceElement.parentNode.insertBefore(oldTargetElement, replaceElement);
				replaceElement.parentNode.removeChild(replaceElement);
			}
		}
	},

	triggerSave : function(skip_cleanup, skip_callback) {
		var inst, n;

		// Default to false
		if (typeof(skip_cleanup) == "undefined")
			skip_cleanup = false;

		// Default to false
		if (typeof(skip_callback) == "undefined")
			skip_callback = false;

		// Cleanup and set all form fields
		for (n in kampungan.instances) {
			inst = kampungan.instances[n];

			if (!kampungan.isInstance(inst))
				continue;

			inst.triggerSave(skip_cleanup, skip_callback);
		}
	},

	resetForm : function(form_index) {
		var i, inst, n, formObj = document.forms[form_index];

		for (n in kampungan.instances) {
			inst = kampungan.instances[n];

			if (!kampungan.isInstance(inst))
				continue;

			inst.switchSettings();

			for (i=0; i<formObj.elements.length; i++) {
				if (inst.formTargetElementId == formObj.elements[i].name)
					inst.getBody().innerHTML = inst.startContent;
			}
		}
	},

	execInstanceCommand : function(editor_id, command, user_interface, value, focus) {
		var inst = kampungan.getInstanceById(editor_id);
		if (inst) {
			if (typeof(focus) == "undefined")
				focus = true;

			if (focus)
				inst.contentWindow.focus();

			// Reset design mode if lost
			inst.autoResetDesignMode();

			this.selectedElement = inst.getFocusElement();
			this.selectedInstance = inst;
			kampungan.execCommand(command, user_interface, value);

			// Cancel event so it doesn't call onbeforeonunlaod
			if (kampungan.isMSIE && window.event != null)
				kampungan.cancelEvent(window.event);
		}
	},

	execCommand : function(command, user_interface, value) {
		// Default input
		user_interface = user_interface ? user_interface : false;
		value = value ? value : null;

		if (kampungan.selectedInstance)
			kampungan.selectedInstance.switchSettings();

		switch (command) {
			case 'mceHelp':
				kampungan.openWindow({
					file : 'about.htm',
					width : 480,
					height : 380
				}, {
					kampungan_version : kampungan.majorVersion + "." + kampungan.minorVersion,
					kampungan_releasedate : kampungan.releaseDate,
					inline : "yes"
				});
			return;

			case 'mceFocus':
				var inst = kampungan.getInstanceById(value);
				if (inst)
					inst.contentWindow.focus();
			return;

			case "mceAddControl":
			case "mceAddEditor":
				kampungan.addMCEControl(kampungan._getElementById(value), value);
				return;

			case "mceAddFrameControl":
				kampungan.addMCEControl(kampungan._getElementById(value['element'], value['document']), value['element'], value['document']);
				return;

			case "mceRemoveControl":
			case "mceRemoveEditor":
				kampungan.removeMCEControl(value);
				return;

			case "mceResetDesignMode":
				// Resets the designmode state of the editors in Gecko
				if (!kampungan.isMSIE) {
					for (var n in kampungan.instances) {
						if (!kampungan.isInstance(kampungan.instances[n]))
							continue;

						try {
							kampungan.instances[n].getDoc().designMode = "on";
						} catch (e) {
							// Ignore any errors
						}
					}
				}

				return;
		}

		if (this.selectedInstance) {
			this.selectedInstance.execCommand(command, user_interface, value);
		} else if (kampungan.settings['focus_alert'])
			alert(kampunganLang['lang_focus_alert']);
	},

	_createIFrame : function(replace_element, doc, win) {
		var iframe, id = replace_element.getAttribute("id");
		var aw, ah;

		if (typeof(doc) == "undefined")
			doc = document;

		if (typeof(win) == "undefined")
			win = window;

		iframe = doc.createElement("iframe");

		aw = "" + kampungan.settings['area_width'];
		ah = "" + kampungan.settings['area_height'];

		if (aw.indexOf('%') == -1) {
			aw = parseInt(aw);
			aw = aw < 0 ? 300 : aw;
			aw = aw + "px";
		}

		if (ah.indexOf('%') == -1) {
			ah = parseInt(ah);
			ah = ah < 0 ? 240 : ah;
			ah = ah + "px";
		}

		iframe.setAttribute("id", id);
		iframe.setAttribute("class", "mceEditorIframe");
		iframe.setAttribute("border", "0");
		iframe.setAttribute("frameBorder", "0");
		iframe.setAttribute("marginWidth", "0");
		iframe.setAttribute("marginHeight", "0");
		iframe.setAttribute("leftMargin", "0");
		iframe.setAttribute("topMargin", "0");
		iframe.setAttribute("width", aw);
		iframe.setAttribute("height", ah);
		iframe.setAttribute("allowtransparency", "true");
		iframe.className = 'mceEditorIframe';

		if (kampungan.settings["auto_resize"])
			iframe.setAttribute("scrolling", "no");

		// Must have a src element in MSIE HTTPs breaks aswell as absoute URLs
		if (kampungan.isMSIE && !kampungan.isOpera)
			iframe.setAttribute("src", this.settings['default_document']);

		iframe.style.width = aw;
		iframe.style.height = ah;

		// Ugly hack for Gecko problem in strict mode
		if (kampungan.settings.strict_loading_mode)
			iframe.style.marginBottom = '-5px';

		// MSIE 5.0 issue
		if (kampungan.isMSIE && !kampungan.isOpera)
			replace_element.outerHTML = iframe.outerHTML;
		else
			replace_element.parentNode.replaceChild(iframe, replace_element);

		if (kampungan.isMSIE && !kampungan.isOpera)
			return win.frames[id];
		else
			return iframe;
	},

	setupContent : function(editor_id) {
		var inst = kampungan.instances[editor_id];
		var doc = inst.getDoc();
		var head = doc.getElementsByTagName('head').item(0);
		var content = inst.startContent;

		// HTML values get XML encoded in strict mode
		if (kampungan.settings.strict_loading_mode) {
			content = content.replace(/&lt;/g, '<');
			content = content.replace(/&gt;/g, '>');
			content = content.replace(/&quot;/g, '"');
			content = content.replace(/&amp;/g, '&');
		}

		inst.switchSettings();

		// Not loaded correctly hit it again, Mozilla bug #997860
		if (!kampungan.isMSIE && kampungan.getParam("setupcontent_reload", false) && doc.title != "blank_page") {
			// This part will remove the designMode status
			// Failes first time in Firefox 1.5b2 on Mac
			try {doc.location.href = kampungan.baseURL + "/blank.htm";} catch (ex) {}
			window.setTimeout("kampungan.setupContent('" + editor_id + "');", 1000);
			return;
		}

		if (!head) {
			window.setTimeout("kampungan.setupContent('" + editor_id + "');", 10);
			return;
		}

		// Import theme specific content CSS the user specific
		kampungan.importCSS(inst.getDoc(), kampungan.baseURL + "/themes/" + inst.settings['theme'] + "/css/editor_content.css");
		kampungan.importCSS(inst.getDoc(), inst.settings['content_css']);
		kampungan.dispatchCallback(inst, 'init_instance_callback', 'initInstance', inst);

		// Setup keyboard shortcuts
		if (kampungan.getParam('custom_undo_redo_keyboard_shortcuts')) {
			inst.addShortcut('ctrl', 'z', 'lang_undo_desc', 'Undo');
			inst.addShortcut('ctrl', 'y', 'lang_redo_desc', 'Redo');
		}

		// Add default shortcuts for gecko
		if (kampungan.isGecko) {
			inst.addShortcut('ctrl', 'b', 'lang_bold_desc', 'Bold');
			inst.addShortcut('ctrl', 'i', 'lang_italic_desc', 'Italic');
			inst.addShortcut('ctrl', 'u', 'lang_underline_desc', 'Underline');
		}

		// Setup span styles
		if (kampungan.getParam("convert_fonts_to_spans"))
			inst.getDoc().body.setAttribute('id', 'mceSpanFonts');

		if (kampungan.settings['nowrap'])
			doc.body.style.whiteSpace = "nowrap";

		doc.body.dir = this.settings['directionality'];
		doc.editorId = editor_id;

		// Add on document element in Mozilla
		if (!kampungan.isMSIE)
			doc.documentElement.editorId = editor_id;

		inst.setBaseHREF(kampungan.settings['base_href']);

		// Replace new line characters to BRs
		if (kampungan.settings['convert_newlines_to_brs']) {
			content = kampungan.regexpReplace(content, "\r\n", "<br />", "gi");
			content = kampungan.regexpReplace(content, "\r", "<br />", "gi");
			content = kampungan.regexpReplace(content, "\n", "<br />", "gi");
		}

		// Open closed anchors
	//	content = content.replace(new RegExp('<a(.*?)/>', 'gi'), '<a$1></a>');

		// Call custom cleanup code
		content = kampungan.storeAwayURLs(content);
		content = kampungan._customCleanup(inst, "insert_to_editor", content);

		if (kampungan.isMSIE) {
			// Ugly!!!
			window.setInterval('try{kampungan.getCSSClasses(kampungan.instances["' + editor_id + '"].getDoc(), "' + editor_id + '");}catch(e){}', 500);

			if (kampungan.settings["force_br_newlines"])
				doc.styleSheets[0].addRule("p", "margin: 0;");

			var body = inst.getBody();
			body.editorId = editor_id;
		}

		content = kampungan.cleanupHTMLCode(content);

		// Fix for bug #958637
		if (!kampungan.isMSIE) {
			var contentElement = inst.getDoc().createElement("body");
			var doc = inst.getDoc();

			contentElement.innerHTML = content;

			// Remove weridness!
			if (kampungan.isGecko && kampungan.settings['remove_lt_gt'])
				content = content.replace(new RegExp('&lt;&gt;', 'g'), "");

			if (kampungan.settings['cleanup_on_startup'])
				kampungan.setInnerHTML(inst.getBody(), kampungan._cleanupHTML(inst, doc, this.settings, contentElement));
			else {
				// Convert all strong/em to b/i
				content = kampungan.regexpReplace(content, "<strong", "<b", "gi");
				content = kampungan.regexpReplace(content, "<em(/?)>", "<i$1>", "gi");
				content = kampungan.regexpReplace(content, "<em ", "<i ", "gi");
				content = kampungan.regexpReplace(content, "</strong>", "</b>", "gi");
				content = kampungan.regexpReplace(content, "</em>", "</i>", "gi");
				kampungan.setInnerHTML(inst.getBody(), content);
			}

			kampungan.convertAllRelativeURLs(inst.getBody());
		} else {
			if (kampungan.settings['cleanup_on_startup']) {
				kampungan._setHTML(inst.getDoc(), content);

				// Produces permission denied error in MSIE 5.5
				eval('try {kampungan.setInnerHTML(inst.getBody(), kampungan._cleanupHTML(inst, inst.contentDocument, this.settings, inst.getBody()));} catch(e) {}');
			} else
				kampungan._setHTML(inst.getDoc(), content);
		}

		// Fix for bug #957681
		//inst.getDoc().designMode = inst.getDoc().designMode;

		// Setup element references
		var parentElm = inst.targetDoc.getElementById(inst.editorId + '_parent');
		inst.formElement = kampungan.isGecko ? parentElm.previousSibling : parentElm.nextSibling;

		kampungan.handleVisualAid(inst.getBody(), true, kampungan.settings['visual'], inst);
		kampungan.dispatchCallback(inst, 'setupcontent_callback', 'setupContent', editor_id, inst.getBody(), inst.getDoc());

		// Re-add design mode on mozilla
		if (!kampungan.isMSIE)
			kampungan.addEventHandlers(inst);

		// Add blur handler
		if (kampungan.isMSIE) {
			kampungan.addEvent(inst.getBody(), "blur", kampungan_Engine.prototype._eventPatch);
			kampungan.addEvent(inst.getBody(), "beforedeactivate", kampungan_Engine.prototype._eventPatch); // Bug #1439953

			// Workaround for drag drop/copy paste base href bug
			if (!kampungan.isOpera) {
				kampungan.addEvent(doc.body, "mousemove", kampungan_Engine.prototype.onMouseMove);
				kampungan.addEvent(doc.body, "beforepaste", kampungan_Engine.prototype._eventPatch);
				kampungan.addEvent(doc.body, "drop", kampungan_Engine.prototype._eventPatch);
			}
		}

		// Trigger node change, this call locks buttons for tables and so forth
		kampungan.selectedInstance = inst;
		kampungan.selectedElement = inst.contentWindow.document.body;

		// Call custom DOM cleanup
		kampungan._customCleanup(inst, "insert_to_editor_dom", inst.getBody());
		kampungan._customCleanup(inst, "setup_content_dom", inst.getBody());
		kampungan._setEventsEnabled(inst.getBody(), false);
		kampungan.cleanupAnchors(inst.getDoc());

		if (kampungan.getParam("convert_fonts_to_spans"))
			kampungan.convertSpansToFonts(inst.getDoc());

		inst.startContent = kampungan.trim(inst.getBody().innerHTML);
		inst.undoRedo.add({ content : inst.startContent });

		// Cleanup any mess left from storyAwayURLs
		if (kampungan.isGecko) {
			// Remove mce_src from textnodes and comments
			kampungan.selectNodes(inst.getBody(), function(n) {
				if (n.nodeType == 3 || n.nodeType == 8) {
					n.nodeValue = n.nodeValue.replace(new RegExp('\\smce_src=\"[^\"]*\"', 'gi'), "");
					n.nodeValue = n.nodeValue.replace(new RegExp('\\smce_href=\"[^\"]*\"', 'gi'), "");
				}

				return false;
			});
		}

		// Cleanup any mess left from storyAwayURLs
		kampungan._removeInternal(inst.getBody());

		kampungan.selectedInstance = inst;
		kampungan.triggerNodeChange(false, true);
	},

	storeAwayURLs : function(s) {
		// Remove all mce_src, mce_href and replace them with new ones
	//	s = s.replace(new RegExp('mce_src\\s*=\\s*\"[^ >\"]*\"', 'gi'), '');
	//	s = s.replace(new RegExp('mce_href\\s*=\\s*\"[^ >\"]*\"', 'gi'), '');

		if (!s.match(/(mce_src|mce_href)/gi, s)) {
			s = s.replace(new RegExp('src\\s*=\\s*\"([^ >\"]*)\"', 'gi'), 'src="$1" mce_src="$1"');
			s = s.replace(new RegExp('href\\s*=\\s*\"([^ >\"]*)\"', 'gi'), 'href="$1" mce_href="$1"');
		}

		return s;
	},

	_removeInternal : function(n) {
		if (kampungan.isGecko) {
			// Remove mce_src from textnodes and comments
			kampungan.selectNodes(n, function(n) {
				if (n.nodeType == 3 || n.nodeType == 8) {
					n.nodeValue = n.nodeValue.replace(new RegExp('\\smce_src=\"[^\"]*\"', 'gi'), "");
					n.nodeValue = n.nodeValue.replace(new RegExp('\\smce_href=\"[^\"]*\"', 'gi'), "");
				}

				return false;
			});
		}
	},

	removekampunganFormElements : function(form_obj) {
		// Check if form is valid
		if (typeof(form_obj) == "undefined" || form_obj == null)
			return;

		// If not a form, find the form
		if (form_obj.nodeName != "FORM") {
			if (form_obj.form)
				form_obj = form_obj.form;
			else
				form_obj = kampungan.getParentElement(form_obj, "form");
		}

		// Still nothing
		if (form_obj == null)
			return;

		// Disable all UI form elements that kampungan created
		for (var i=0; i<form_obj.elements.length; i++) {
			var elementId = form_obj.elements[i].name ? form_obj.elements[i].name : form_obj.elements[i].id;

			if (elementId.indexOf('mce_editor_') == 0)
				form_obj.elements[i].disabled = true;
		}
	},

	handleEvent : function(e) {
		var inst = kampungan.selectedInstance;

		// Remove odd, error
		if (typeof(kampungan) == "undefined")
			return true;

		//kampungan.debug(e.type + " " + e.target.nodeName + " " + (e.relatedTarget ? e.relatedTarget.nodeName : ""));

		if (kampungan.executeCallback(kampungan.selectedInstance, 'handle_event_callback', 'handleEvent', e))
			return false;

		switch (e.type) {
			case "beforedeactivate": // Was added due to bug #1439953
			case "blur":
				if (kampungan.selectedInstance)
					kampungan.selectedInstance.execCommand('mceEndTyping');

				kampungan.hideMenus();

				return;

			// Workaround for drag drop/copy paste base href bug
			case "drop":
			case "beforepaste":
				if (kampungan.selectedInstance)
					kampungan.selectedInstance.setBaseHREF(null);

				// Fixes odd MSIE bug where drag/droping elements in a iframe with height 100% breaks
				// This logic forces the width/height to be in pixels while the user is drag/dropping
				if (kampungan.isMSIE && !kampungan.isOpera) {
					var ife = kampungan.selectedInstance.iframeElement;

					/*if (ife.style.width.indexOf('%') != -1) {
						ife._oldWidth = ife.width.height;
						ife.style.width = ife.clientWidth;
					}*/

					if (ife.style.height.indexOf('%') != -1) {
						ife._oldHeight = ife.style.height;
						ife.style.height = ife.clientHeight;
					}
				}

				window.setTimeout("kampungan.selectedInstance.setBaseHREF(kampungan.settings['base_href']);kampungan._resetIframeHeight();", 1);
				return;

			case "submit":
				kampungan.removekampunganFormElements(kampungan.isMSIE ? window.event.srcElement : e.target);
				kampungan.triggerSave();
				kampungan.isNotDirty = true;
				return;

			case "reset":
				var formObj = kampungan.isMSIE ? window.event.srcElement : e.target;

				for (var i=0; i<document.forms.length; i++) {
					if (document.forms[i] == formObj)
						window.setTimeout('kampungan.resetForm(' + i + ');', 10);
				}

				return;

			case "keypress":
				if (inst && inst.handleShortcut(e))
					return false;

				if (e.target.editorId) {
					kampungan.selectedInstance = kampungan.instances[e.target.editorId];
				} else {
					if (e.target.ownerDocument.editorId)
						kampungan.selectedInstance = kampungan.instances[e.target.ownerDocument.editorId];
				}

				if (kampungan.selectedInstance)
					kampungan.selectedInstance.switchSettings();

				// Insert P element
				if (kampungan.isGecko && kampungan.settings['force_p_newlines'] && e.keyCode == 13 && !e.shiftKey) {
					// Insert P element instead of BR
					if (kampungan_ForceParagraphs._insertPara(kampungan.selectedInstance, e)) {
						// Cancel event
						kampungan.execCommand("mceAddUndoLevel");
						kampungan.cancelEvent(e);
						return false;
					}
				}

				// Handle backspace
				if (kampungan.isGecko && kampungan.settings['force_p_newlines'] && (e.keyCode == 8 || e.keyCode == 46) && !e.shiftKey) {
					// Insert P element instead of BR
					if (kampungan_ForceParagraphs._handleBackSpace(kampungan.selectedInstance, e.type)) {
						// Cancel event
						kampungan.execCommand("mceAddUndoLevel");
						kampungan.cancelEvent(e);
						return false;
					}
				}

				// Return key pressed
				if (kampungan.isMSIE && kampungan.settings['force_br_newlines'] && e.keyCode == 13) {
					if (e.target.editorId)
						kampungan.selectedInstance = kampungan.instances[e.target.editorId];

					if (kampungan.selectedInstance) {
						var sel = kampungan.selectedInstance.getDoc().selection;
						var rng = sel.createRange();

						if (kampungan.getParentElement(rng.parentElement(), "li") != null)
							return false;

						// Cancel event
						e.returnValue = false;
						e.cancelBubble = true;

						// Insert BR element
						rng.pasteHTML("<br />");
						rng.collapse(false);
						rng.select();

						kampungan.execCommand("mceAddUndoLevel");
						kampungan.triggerNodeChange(false);
						return false;
					}
				}

				// Backspace or delete
				if (e.keyCode == 8 || e.keyCode == 46) {
					kampungan.selectedElement = e.target;
					kampungan.linkElement = kampungan.getParentElement(e.target, "a");
					kampungan.imgElement = kampungan.getParentElement(e.target, "img");
					kampungan.triggerNodeChange(false);
				}

				return false;
			break;

			case "keyup":
			case "keydown":
				kampungan.hideMenus();
				kampungan.hasMouseMoved = false;

				if (inst && inst.handleShortcut(e))
					return false;

				if (e.target.editorId)
					kampungan.selectedInstance = kampungan.instances[e.target.editorId];
				else
					return;

				if (kampungan.selectedInstance)
					kampungan.selectedInstance.switchSettings();

				var inst = kampungan.selectedInstance;

				// Handle backspace
				if (kampungan.isGecko && kampungan.settings['force_p_newlines'] && (e.keyCode == 8 || e.keyCode == 46) && !e.shiftKey) {
					// Insert P element instead of BR
					if (kampungan_ForceParagraphs._handleBackSpace(kampungan.selectedInstance, e.type)) {
						// Cancel event
						kampungan.execCommand("mceAddUndoLevel");
						e.preventDefault();
						return false;
					}
				}

				kampungan.selectedElement = null;
				kampungan.selectedNode = null;
				var elm = kampungan.selectedInstance.getFocusElement();
				kampungan.linkElement = kampungan.getParentElement(elm, "a");
				kampungan.imgElement = kampungan.getParentElement(elm, "img");
				kampungan.selectedElement = elm;

				// Update visualaids on tabs
				if (kampungan.isGecko && e.type == "keyup" && e.keyCode == 9)
					kampungan.handleVisualAid(kampungan.selectedInstance.getBody(), true, kampungan.settings['visual'], kampungan.selectedInstance);

				// Fix empty elements on return/enter, check where enter occured
				if (kampungan.isMSIE && e.type == "keydown" && e.keyCode == 13)
					kampungan.enterKeyElement = kampungan.selectedInstance.getFocusElement();

				// Fix empty elements on return/enter
				if (kampungan.isMSIE && e.type == "keyup" && e.keyCode == 13) {
					var elm = kampungan.enterKeyElement;
					if (elm) {
						var re = new RegExp('^HR|IMG|BR$','g'); // Skip these
						var dre = new RegExp('^H[1-6]$','g'); // Add double on these

						if (!elm.hasChildNodes() && !re.test(elm.nodeName)) {
							if (dre.test(elm.nodeName))
								elm.innerHTML = "&nbsp;&nbsp;";
							else
								elm.innerHTML = "&nbsp;";
						}
					}
				}

				// Check if it's a position key
				var keys = kampungan.posKeyCodes;
				var posKey = false;
				for (var i=0; i<keys.length; i++) {
					if (keys[i] == e.keyCode) {
						posKey = true;
						break;
					}
				}

				// MSIE custom key handling
				if (kampungan.isMSIE && kampungan.settings['custom_undo_redo']) {
					var keys = new Array(8,46); // Backspace,Delete
					for (var i=0; i<keys.length; i++) {
						if (keys[i] == e.keyCode) {
							if (e.type == "keyup")
								kampungan.triggerNodeChange(false);
						}
					}
				}

				// If Ctrl key
				if (e.keyCode == 17)
					return true;

				// Handle Undo/Redo when typing content

				// Start typing (non position key)
				if (!posKey && e.type == "keyup")
					kampungan.execCommand("mceStartTyping");

				// Store undo bookmark
				if (e.type == "keydown" && (posKey || e.ctrlKey) && inst)
					inst.undoBookmark = inst.selection.getBookmark();

				// End typing (position key) or some Ctrl event
				if (e.type == "keyup" && (posKey || e.ctrlKey))
					kampungan.execCommand("mceEndTyping");

				if (posKey && e.type == "keyup")
					kampungan.triggerNodeChange(false);

				if (kampungan.isMSIE && e.ctrlKey)
					window.setTimeout('kampungan.triggerNodeChange(false);', 1);
			break;

			case "mousedown":
			case "mouseup":
			case "click":
			case "focus":
				kampungan.hideMenus();

				if (kampungan.selectedInstance) {
					kampungan.selectedInstance.switchSettings();
					kampungan.selectedInstance.isFocused = true;
				}

				// Check instance event trigged on
				var targetBody = kampungan.getParentElement(e.target, "body");
				for (var instanceName in kampungan.instances) {
					if (!kampungan.isInstance(kampungan.instances[instanceName]))
						continue;

					var inst = kampungan.instances[instanceName];

					// Reset design mode if lost (on everything just in case)
					inst.autoResetDesignMode();

					if (inst.getBody() == targetBody) {
						kampungan.selectedInstance = inst;
						kampungan.selectedElement = e.target;
						kampungan.linkElement = kampungan.getParentElement(kampungan.selectedElement, "a");
						kampungan.imgElement = kampungan.getParentElement(kampungan.selectedElement, "img");
						break;
					}
				}

				// Add first bookmark location
				if (!kampungan.selectedInstance.undoRedo.undoLevels[0].bookmark)
					kampungan.selectedInstance.undoRedo.undoLevels[0].bookmark = kampungan.selectedInstance.selection.getBookmark();

				if (kampungan.isSafari) {
					kampungan.selectedInstance.lastSafariSelection = kampungan.selectedInstance.selection.getBookmark();
					kampungan.selectedInstance.lastSafariSelectedElement = kampungan.selectedElement;

					var lnk = kampungan.getParentElement(kampungan.selectedElement, "a");

					// Patch the darned link
					if (lnk && e.type == "mousedown") {
						lnk.setAttribute("mce_real_href", lnk.getAttribute("href"));
						lnk.setAttribute("href", "javascript:void(0);");
					}

					// Patch back
					if (lnk && e.type == "click") {
						window.setTimeout(function() {
							lnk.setAttribute("href", lnk.getAttribute("mce_real_href"));
							lnk.removeAttribute("mce_real_href");
						}, 10);
					}
				}

				// Reset selected node
				if (e.type != "focus")
					kampungan.selectedNode = null;

				kampungan.triggerNodeChange(false);
				kampungan.execCommand("mceEndTyping");

				if (e.type == "mouseup")
					kampungan.execCommand("mceAddUndoLevel");

				// Just in case
				if (!kampungan.selectedInstance && e.target.editorId)
					kampungan.selectedInstance = kampungan.instances[e.target.editorId];

				return false;
			break;
		}
	},

	getButtonHTML : function(id, lang, img, cmd, ui, val) {
		var h = '', m, x;

		cmd = 'kampungan.execInstanceCommand(\'{$editor_id}\',\'' + cmd + '\'';

		if (typeof(ui) != "undefined" && ui != null)
			cmd += ',' + ui;

		if (typeof(val) != "undefined" && val != null)
			cmd += ",'" + val + "'";

		cmd += ');';

		// Use tilemaps when enabled and found and never in MSIE since it loads the tile each time from cache if cahce is disabled
		if (kampungan.getParam('button_tile_map') && (!kampungan.isMSIE || kampungan.isOpera) && (m = this.buttonMap[id]) != null && (kampungan.getParam("language") == "en" || img.indexOf('$lang') == -1)) {
			// Tiled button
			x = 0 - (m * 20) == 0 ? '0' : 0 - (m * 20);
			h += '<a id="{$editor_id}_' + id + '" href="javascript:' + cmd + '" onclick="' + cmd + 'return false;" onmousedown="return false;" class="mceTiledButton mceButtonNormal" target="_self">';
			h += '<img src="{$themeurl}/images/spacer.gif" style="background-position: ' + x + 'px 0" title="{$' + lang + '}" />';
			h += '</a>';
		} else {
			// Normal button
			h += '<a id="{$editor_id}_' + id + '" href="javascript:' + cmd + '" onclick="' + cmd + 'return false;" onmousedown="return false;" class="mceButtonNormal" target="_self">';
			h += '<img src="' + img + '" title="{$' + lang + '}" />';
			h += '</a>';
		}

		return h;
	},

	addButtonMap : function(m) {
		var i, a = m.replace(/\s+/, '').split(',');

		for (i=0; i<a.length; i++)
			this.buttonMap[a[i]] = i;
	},

	submitPatch : function() {
		kampungan.removekampunganFormElements(this);
		kampungan.triggerSave();
		this.mceOldSubmit();
		kampungan.isNotDirty = true;
	},

	onLoad : function() {
		// Wait for everything to be loaded first
		if (kampungan.settings.strict_loading_mode && this.loadingIndex != -1) {
			window.setTimeout('kampungan.onLoad();', 1);
			return;
		}

		if (kampungan.isMSIE && !kampungan.isOpera && window.event.type == "readystatechange" && document.readyState != "complete")
			return true;

		if (kampungan.isLoaded)
			return true;

		kampungan.isLoaded = true;

		kampungan.dispatchCallback(null, 'onpageload', 'onPageLoad');

		for (var c=0; c<kampungan.configs.length; c++) {
			kampungan.settings = kampungan.configs[c];

			var selector = kampungan.getParam("editor_selector");
			var deselector = kampungan.getParam("editor_deselector");
			var elementRefAr = new Array();

			// Add submit triggers
			if (document.forms && kampungan.settings['add_form_submit_trigger'] && !kampungan.submitTriggers) {
				for (var i=0; i<document.forms.length; i++) {
					var form = document.forms[i];

					kampungan.addEvent(form, "submit", kampungan_Engine.prototype.handleEvent);
					kampungan.addEvent(form, "reset", kampungan_Engine.prototype.handleEvent);
					kampungan.submitTriggers = true; // Do it only once

					// Patch the form.submit function
					if (kampungan.settings['submit_patch']) {
						try {
							form.mceOldSubmit = form.submit;
							form.submit = kampungan_Engine.prototype.submitPatch;
						} catch (e) {
							// Do nothing
						}
					}
				}
			}

			// Add editor instances based on mode
			var mode = kampungan.settings['mode'];
			switch (mode) {
				case "exact":
					var elements = kampungan.getParam('elements', '', true, ',');

					for (var i=0; i<elements.length; i++) {
						var element = kampungan._getElementById(elements[i]);
						var trigger = element ? element.getAttribute(kampungan.settings['textarea_trigger']) : "";

						if (kampungan.getAttrib(element, "class").indexOf(deselector) != -1)
							continue;

						if (trigger == "false")
							continue;

						if ((kampungan.settings['ask'] || kampungan.settings['convert_on_click']) && element) {
							elementRefAr[elementRefAr.length] = element;
							continue;
						}

						if (element)
							kampungan.addMCEControl(element, elements[i]);
						else if (kampungan.settings['debug'])
							alert("Error: Could not find element by id or name: " + elements[i]);
					}
				break;

				case "specific_textareas":
				case "textareas":
					var nodeList = document.getElementsByTagName("textarea");

					for (var i=0; i<nodeList.length; i++) {
						var elm = nodeList.item(i);
						var trigger = elm.getAttribute(kampungan.settings['textarea_trigger']);

						if (selector != '' && kampungan.getAttrib(elm, "class").indexOf(selector) == -1)
							continue;

						if (selector != '')
							trigger = selector != "" ? "true" : "";

						if (kampungan.getAttrib(elm, "class").indexOf(deselector) != -1)
							continue;

						if ((mode == "specific_textareas" && trigger == "true") || (mode == "textareas" && trigger != "false"))
							elementRefAr[elementRefAr.length] = elm;
					}
				break;
			}

			for (var i=0; i<elementRefAr.length; i++) {
				var element = elementRefAr[i];
				var elementId = element.name ? element.name : element.id;

				if (kampungan.settings['ask'] || kampungan.settings['convert_on_click']) {
					// Focus breaks in Mozilla
					if (kampungan.isGecko) {
						var settings = kampungan.settings;

						kampungan.addEvent(element, "focus", function (e) {window.setTimeout(function() {kampungan_Engine.prototype.confirmAdd(e, settings);}, 10);});

						if (element.nodeName != "TEXTAREA" && element.nodeName != "INPUT")
							kampungan.addEvent(element, "click", function (e) {window.setTimeout(function() {kampungan_Engine.prototype.confirmAdd(e, settings);}, 10);});
						// kampungan.addEvent(element, "mouseover", function (e) {window.setTimeout(function() {kampungan_Engine.prototype.confirmAdd(e, settings);}, 10);});
					} else {
						var settings = kampungan.settings;

						kampungan.addEvent(element, "focus", function () { kampungan_Engine.prototype.confirmAdd(null, settings); });
						kampungan.addEvent(element, "click", function () { kampungan_Engine.prototype.confirmAdd(null, settings); });
						// kampungan.addEvent(element, "mouseenter", function () { kampungan_Engine.prototype.confirmAdd(null, settings); });
					}
				} else
					kampungan.addMCEControl(element, elementId);
			}

			// Handle auto focus
			if (kampungan.settings['auto_focus']) {
				window.setTimeout(function () {
					var inst = kampungan.getInstanceById(kampungan.settings['auto_focus']);
					inst.selection.selectNode(inst.getBody(), true, true);
					inst.contentWindow.focus();
				}, 10);
			}

			kampungan.dispatchCallback(null, 'oninit', 'onInit');
		}
	},

	isInstance : function(o) {
		return o != null && typeof(o) == "object" && o.iskampungan_Control;
	},

	getParam : function(name, default_value, strip_whitespace, split_chr) {
		var value = (typeof(this.settings[name]) == "undefined") ? default_value : this.settings[name];

		// Fix bool values
		if (value == "true" || value == "false")
			return (value == "true");

		if (strip_whitespace)
			value = kampungan.regexpReplace(value, "[ \t\r\n]", "");

		if (typeof(split_chr) != "undefined" && split_chr != null) {
			value = value.split(split_chr);
			var outArray = new Array();

			for (var i=0; i<value.length; i++) {
				if (value[i] && value[i] != "")
					outArray[outArray.length] = value[i];
			}

			value = outArray;
		}

		return value;
	},

	getLang : function(name, default_value, parse_entities, va) {
		var v = (typeof(kampunganLang[name]) == "undefined") ? default_value : kampunganLang[name], n;

		if (parse_entities)
			v = kampungan.entityDecode(v);

		if (va) {
			for (n in va)
				v = this.replaceVar(v, n, va[n]);
		}

		return v;
	},

	entityDecode : function(s) {
		var e = document.createElement("div");
		e.innerHTML = s;
		return e.innerHTML;
	},

	addToLang : function(prefix, ar) {
		for (var key in ar) {
			if (typeof(ar[key]) == 'function')
				continue;

			kampunganLang[(key.indexOf('lang_') == -1 ? 'lang_' : '') + (prefix != '' ? (prefix + "_") : '') + key] = ar[key];
		}

		this.loadNextScript();

	//	for (var key in ar)
	//		kampunganLang[(key.indexOf('lang_') == -1 ? 'lang_' : '') + (prefix != '' ? (prefix + "_") : '') + key] = "|" + ar[key] + "|";
	},

	triggerNodeChange : function(focus, setup_content) {
		if (kampungan.selectedInstance) {
			var inst = kampungan.selectedInstance;
			var editorId = inst.editorId;
			var elm = (typeof(setup_content) != "undefined" && setup_content) ? kampungan.selectedElement : inst.getFocusElement();
			var undoIndex = -1;
			var undoLevels = -1;
			var anySelection = false;
			var selectedText = inst.selection.getSelectedText();

			if (setup_content && kampungan.isGecko && inst.isHidden())
				elm = inst.getBody();

			inst.switchSettings();

			if (kampungan.settings["auto_resize"]) {
				var doc = inst.getDoc();

				inst.iframeElement.style.width = doc.body.offsetWidth + "px";
				inst.iframeElement.style.height = doc.body.offsetHeight + "px";
			}

			if (kampungan.selectedElement)
				anySelection = (kampungan.selectedElement.nodeName.toLowerCase() == "img") || (selectedText && selectedText.length > 0);

			if (kampungan.settings['custom_undo_redo']) {
				undoIndex = inst.undoRedo.undoIndex;
				undoLevels = inst.undoRedo.undoLevels.length;
			}

			kampungan.dispatchCallback(inst, 'handle_node_change_callback', 'handleNodeChange', editorId, elm, undoIndex, undoLevels, inst.visualAid, anySelection, setup_content);
		}

		if (this.selectedInstance && (typeof(focus) == "undefined" || focus))
			this.selectedInstance.contentWindow.focus();
	},

	_customCleanup : function(inst, type, content) {
		var pl, po, i;

		// Call custom cleanup
		var customCleanup = kampungan.settings['cleanup_callback'];
		if (customCleanup != "" && eval("typeof(" + customCleanup + ")") != "undefined")
			content = eval(customCleanup + "(type, content, inst);");

		// Trigger plugin cleanups
		pl = inst.plugins;
		for (i=0; i<pl.length; i++) {
			po = kampungan.plugins[pl[i]];

			if (po && po.cleanup)
				content = po.cleanup(type, content, inst);
		}

		return content;
	},

	setContent : function(h) {
		if (kampungan.selectedInstance) {
			kampungan.selectedInstance.execCommand('mceSetContent', false, h);
			kampungan.selectedInstance.repaint();
		}
	},

	importThemeLanguagePack : function(name) {
		if (typeof(name) == "undefined")
			name = kampungan.settings['theme'];

		kampungan.loadScript(kampungan.baseURL + '/themes/' + name + '/langs/' + kampungan.settings['language'] + '.js');
	},

	importPluginLanguagePack : function(name, valid_languages) {
		var lang = "en", b = kampungan.baseURL + '/plugins/' + name;

		valid_languages = valid_languages.split(',');
		for (var i=0; i<valid_languages.length; i++) {
			if (kampungan.settings['language'] == valid_languages[i])
				lang = kampungan.settings['language'];
		}

		if (this.plugins[name])
			b = this.plugins[name].baseURL;

		kampungan.loadScript(b + '/langs/' + lang +  '.js');
	},

	applyTemplate : function(h, as) {
		var i, s, ar = h.match(new RegExp('\\{\\$[a-z0-9_]+\\}', 'gi'));

		if (ar && ar.length > 0) {
			for (i=ar.length-1; i>=0; i--) {
				s = ar[i].substring(2, ar[i].length-1);

				if (s.indexOf('lang_') == 0 && kampunganLang[s])
					h = kampungan.replaceVar(h, s, kampunganLang[s]);
				else if (as && as[s])
					h = kampungan.replaceVar(h, s, as[s]);
				else if (kampungan.settings[s])
					h = kampungan.replaceVar(h, s, kampungan.settings[s]);
			}
		}

		h = kampungan.replaceVar(h, "themeurl", kampungan.themeURL);

		return h;
	},

	replaceVar : function(h, r, v) {
		return h.replace(new RegExp('{\\\$' + r + '}', 'g'), v);
	},

	openWindow : function(template, args) {
		var html, width, height, x, y, resizable, scrollbars, url;

		args['mce_template_file'] = template['file'];
		args['mce_width'] = template['width'];
		args['mce_height'] = template['height'];
		kampungan.windowArgs = args;

		html = template['html'];
		if (!(width = parseInt(template['width'])))
			width = 320;

		if (!(height = parseInt(template['height'])))
			height = 200;

		// Add to height in M$ due to SP2 WHY DON'T YOU GUYS IMPLEMENT innerWidth of windows!!
		if (kampungan.isMSIE)
			height += 40;
		else
			height += 20;

		x = parseInt(screen.width / 2.0) - (width / 2.0);
		y = parseInt(screen.height / 2.0) - (height / 2.0);

		resizable = (args && args['resizable']) ? args['resizable'] : "no";
		scrollbars = (args && args['scrollbars']) ? args['scrollbars'] : "no";

		if (template['file'].charAt(0) != '/' && template['file'].indexOf('://') == -1)
			url = kampungan.baseURL + "/themes/" + kampungan.getParam("theme") + "/" + template['file'];
		else
			url = template['file'];

		// Replace all args as variables in URL
		for (var name in args) {
			if (typeof(args[name]) == 'function')
				continue;

			url = kampungan.replaceVar(url, name, escape(args[name]));
		}

		if (html) {
			html = kampungan.replaceVar(html, "css", this.settings['popups_css']);
			html = kampungan.applyTemplate(html, args);

			var win = window.open("", "mcePopup" + new Date().getTime(), "top=" + y + ",left=" + x + ",scrollbars=" + scrollbars + ",dialog=yes,minimizable=" + resizable + ",modal=yes,width=" + width + ",height=" + height + ",resizable=" + resizable);
			if (win == null) {
				alert(kampunganLang['lang_popup_blocked']);
				return;
			}

			win.document.write(html);
			win.document.close();
			win.resizeTo(width, height);
			win.focus();
		} else {
			if ((kampungan.isMSIE && !kampungan.isOpera) && resizable != 'yes' && kampungan.settings["dialog_type"] == "modal") {
				height += 10;

				var features = "resizable:" + resizable 
					+ ";scroll:"
					+ scrollbars + ";status:yes;center:yes;help:no;dialogWidth:"
					+ width + "px;dialogHeight:" + height + "px;";

				window.showModalDialog(url, window, features);
			} else {
				var modal = (resizable == "yes") ? "no" : "yes";

				if (kampungan.isGecko && kampungan.isMac)
					modal = "no";

				if (template['close_previous'] != "no")
					try {kampungan.lastWindow.close();} catch (ex) {}

				var win = window.open(url, "mcePopup" + new Date().getTime(), "top=" + y + ",left=" + x + ",scrollbars=" + scrollbars + ",dialog=" + modal + ",minimizable=" + resizable + ",modal=" + modal + ",width=" + width + ",height=" + height + ",resizable=" + resizable);
				if (win == null) {
					alert(kampunganLang['lang_popup_blocked']);
					return;
				}

				if (template['close_previous'] != "no")
					kampungan.lastWindow = win;

				eval('try { win.resizeTo(width, height); } catch(e) { }');

				// Make it bigger if statusbar is forced
				if (kampungan.isGecko) {
					if (win.document.defaultView.statusbar.visible)
						win.resizeBy(0, kampungan.isMac ? 10 : 24);
				}

				win.focus();
			}
		}
	},

	closeWindow : function(win) {
		win.close();
	},

	getVisualAidClass : function(class_name, state) {
		var aidClass = kampungan.settings['visual_table_class'];

		if (typeof(state) == "undefined")
			state = kampungan.settings['visual'];

		// Split
		var classNames = new Array();
		var ar = class_name.split(' ');
		for (var i=0; i<ar.length; i++) {
			if (ar[i] == aidClass)
				ar[i] = "";

			if (ar[i] != "")
				classNames[classNames.length] = ar[i];
		}

		if (state)
			classNames[classNames.length] = aidClass;

		// Glue
		var className = "";
		for (var i=0; i<classNames.length; i++) {
			if (i > 0)
				className += " ";

			className += classNames[i];
		}

		return className;
	},

	handleVisualAid : function(el, deep, state, inst, skip_dispatch) {
		if (!el)
			return;

		if (!skip_dispatch)
			kampungan.dispatchCallback(inst, 'handle_visual_aid_callback', 'handleVisualAid', el, deep, state, inst);

		var tableElement = null;

		switch (el.nodeName) {
			case "TABLE":
				var oldW = el.style.width;
				var oldH = el.style.height;
				var bo = kampungan.getAttrib(el, "border");

				bo = bo == "" || bo == "0" ? true : false;

				kampungan.setAttrib(el, "class", kampungan.getVisualAidClass(kampungan.getAttrib(el, "class"), state && bo));

				el.style.width = oldW;
				el.style.height = oldH;

				for (var y=0; y<el.rows.length; y++) {
					for (var x=0; x<el.rows[y].cells.length; x++) {
						var cn = kampungan.getVisualAidClass(kampungan.getAttrib(el.rows[y].cells[x], "class"), state && bo);
						kampungan.setAttrib(el.rows[y].cells[x], "class", cn);
					}
				}

				break;

			case "A":
				var anchorName = kampungan.getAttrib(el, "name");

				if (anchorName != '' && state) {
					el.title = anchorName;
					el.className = 'mceItemAnchor';
				} else if (anchorName != '' && !state)
					el.className = '';

				break;
		}

		if (deep && el.hasChildNodes()) {
			for (var i=0; i<el.childNodes.length; i++)
				kampungan.handleVisualAid(el.childNodes[i], deep, state, inst, true);
		}
	},

	/*
	applyClassesToFonts : function(doc, size) {
		var f = doc.getElementsByTagName("font");
		for (var i=0; i<f.length; i++) {
			var s = kampungan.getAttrib(f[i], "size");

			if (s != "")
				kampungan.setAttrib(f[i], 'class', "mceItemFont" + s);
		}

		if (typeof(size) != "undefined") {
			var css = "";

			for (var x=0; x<doc.styleSheets.length; x++) {
				for (var i=0; i<doc.styleSheets[x].rules.length; i++) {
					if (doc.styleSheets[x].rules[i].selectorText == '#mceSpanFonts .mceItemFont' + size) {
						css = doc.styleSheets[x].rules[i].style.cssText;
						break;
					}
				}

				if (css != "")
					break;
			}

			if (doc.styleSheets[0].rules[0].selectorText == "FONT")
				doc.styleSheets[0].removeRule(0);

			doc.styleSheets[0].addRule("FONT", css, 0);
		}
	},
	*/

	fixGeckoBaseHREFBug : function(m, e, h) {
		var nl, i, a, n, xsrc, xhref, el;

		if (kampungan.isGecko) {
			if (m == 1) {
				h = h.replace(/\ssrc=/gi, " mce_tsrc=");
				h = h.replace(/\shref=/gi, " mce_thref=");

				return h;
			} else {
				el = new Array('a','img','select','area','iframe','base','input','script','embed','object','link');

				for (a=0; a<el.length; a++) {
					n = e.getElementsByTagName(el[a]);

					for (i=0; i<n.length; i++) {
						xsrc = kampungan.getAttrib(n[i], "mce_tsrc");
						xhref = kampungan.getAttrib(n[i], "mce_thref");

						if (xsrc != "") {
							try {
								n[i].src = kampungan.convertRelativeToAbsoluteURL(kampungan.settings['base_href'], xsrc);
							} catch (e) {
								// Ignore, Firefox cast exception if local file wasn't found
							}

							n[i].removeAttribute("mce_tsrc");
						}

						if (xhref != "") {
							try {
								n[i].href = kampungan.convertRelativeToAbsoluteURL(kampungan.settings['base_href'], xhref);
							} catch (e) {
								// Ignore, Firefox cast exception if local file wasn't found
							}

							n[i].removeAttribute("mce_thref");
						}
					}
				}

				el = kampungan.selectNodes(e, function(n) {
					if (n.nodeType == 3 || n.nodeType == 8) {
						n.nodeValue = n.nodeValue.replace(/\smce_tsrc=/gi, " src=");
						n.nodeValue = n.nodeValue.replace(/\smce_thref=/gi, " href=");
					}

					return false;
				});
			}
		}

		return h;
	},

	_setHTML : function(doc, html_content) {
		// Force closed anchors open
		//html_content = html_content.replace(new RegExp('<a(.*?)/>', 'gi'), '<a$1></a>');

		html_content = kampungan.cleanupHTMLCode(html_content);

		// Try innerHTML if it fails use pasteHTML in MSIE
		try {
			kampungan.setInnerHTML(doc.body, html_content);
		} catch (e) {
			if (this.isMSIE)
				doc.body.createTextRange().pasteHTML(html_content);
		}

		// Content duplication bug fix
		if (kampungan.isMSIE && kampungan.settings['fix_content_duplication']) {
			// Remove P elements in P elements
			var paras = doc.getElementsByTagName("P");
			for (var i=0; i<paras.length; i++) {
				var node = paras[i];
				while ((node = node.parentNode) != null) {
					if (node.nodeName == "P")
						node.outerHTML = node.innerHTML;
				}
			}

			// Content duplication bug fix (Seems to be word crap)
			var html = doc.body.innerHTML;
/*
			if (html.indexOf('="mso') != -1) {
				for (var i=0; i<doc.body.all.length; i++) {
					var el = doc.body.all[i];
					el.removeAttribute("className","",0);
					el.removeAttribute("style","",0);
				}

				html = doc.body.innerHTML;
				html = kampungan.regexpReplace(html, "<o:p><\/o:p>", "<br />");
				html = kampungan.regexpReplace(html, "<o:p>&nbsp;<\/o:p>", "");
				html = kampungan.regexpReplace(html, "<st1:.*?>", "");
				html = kampungan.regexpReplace(html, "<p><\/p>", "");
				html = kampungan.regexpReplace(html, "<p><\/p>\r\n<p><\/p>", "");
				html = kampungan.regexpReplace(html, "<p>&nbsp;<\/p>", "<br />");
				html = kampungan.regexpReplace(html, "<p>\s*(<p>\s*)?", "<p>");
				html = kampungan.regexpReplace(html, "<\/p>\s*(<\/p>\s*)?", "</p>");
			}*/

			// Always set the htmlText output
			kampungan.setInnerHTML(doc.body, html);
		}

		kampungan.cleanupAnchors(doc);

		if (kampungan.getParam("convert_fonts_to_spans"))
			kampungan.convertSpansToFonts(doc);
	},

	getEditorId : function(form_element) {
		var inst = this.getInstanceById(form_element);
		if (!inst)
			return null;

		return inst.editorId;
	},

	getInstanceById : function(editor_id) {
		var inst = this.instances[editor_id];
		if (!inst) {
			for (var n in kampungan.instances) {
				var instance = kampungan.instances[n];
				if (!kampungan.isInstance(instance))
					continue;

				if (instance.formTargetElementId == editor_id) {
					inst = instance;
					break;
				}
			}
		}

		return inst;
	},

	queryInstanceCommandValue : function(editor_id, command) {
		var inst = kampungan.getInstanceById(editor_id);
		if (inst)
			return inst.queryCommandValue(command);

		return false;
	},

	queryInstanceCommandState : function(editor_id, command) {
		var inst = kampungan.getInstanceById(editor_id);
		if (inst)
			return inst.queryCommandState(command);

		return null;
	},

	setWindowArg : function(n, v) {
		this.windowArgs[n] = v;
	},

	getWindowArg : function(n, d) {
		return (typeof(this.windowArgs[n]) == "undefined") ? d : this.windowArgs[n];
	},

	getCSSClasses : function(editor_id, doc) {
		var output = new Array();

		// Is cached, use that
		if (typeof(kampungan.cssClasses) != "undefined")
			return kampungan.cssClasses;

		if (typeof(editor_id) == "undefined" && typeof(doc) == "undefined") {
			var instance;

			for (var instanceName in kampungan.instances) {
				instance = kampungan.instances[instanceName];
				if (!kampungan.isInstance(instance))
					continue;

				break;
			}

			doc = instance.getDoc();
		}

		if (typeof(doc) == "undefined") {
			var instance = kampungan.getInstanceById(editor_id);
			doc = instance.getDoc();
		}

		if (doc) {
			var styles = doc.styleSheets;

			if (styles && styles.length > 0) {
				for (var x=0; x<styles.length; x++) {
					var csses = null;

					// Just ignore any errors
					eval("try {var csses = kampungan.isMSIE ? doc.styleSheets(" + x + ").rules : styles[" + x + "].cssRules;} catch(e) {}");
					if (!csses)
						return new Array();

					for (var i=0; i<csses.length; i++) {
						var selectorText = csses[i].selectorText;

						// Can be multiple rules per selector
						if (selectorText) {
							var rules = selectorText.split(',');
							for (var c=0; c<rules.length; c++) {
								var rule = rules[c];

								// Strip spaces between selectors
								while (rule.indexOf(' ') == 0)
									rule = rule.substring(1);

								// Invalid rule
								if (rule.indexOf(' ') != -1 || rule.indexOf(':') != -1 || rule.indexOf('mceItem') != -1)
									continue;

								if (rule.indexOf(kampungan.settings['visual_table_class']) != -1 || rule.indexOf('mceEditable') != -1 || rule.indexOf('mceNonEditable') != -1)
									continue;

								// Is class rule
								if (rule.indexOf('.') != -1) {
									var cssClass = rule.substring(rule.indexOf('.') + 1);
									var addClass = true;

									for (var p=0; p<output.length && addClass; p++) {
										if (output[p] == cssClass)
											addClass = false;
									}

									if (addClass)
										output[output.length] = cssClass;
								}
							}
						}
					}
				}
			}
		}

		// Cache em
		if (output.length > 0)
			kampungan.cssClasses = output;

		return output;
	},

	regexpReplace : function(in_str, reg_exp, replace_str, opts) {
		if (in_str == null)
			return in_str;

		if (typeof(opts) == "undefined")
			opts = 'g';

		var re = new RegExp(reg_exp, opts);
		return in_str.replace(re, replace_str);
	},

	trim : function(s) {
		return s.replace(/^\s*|\s*$/g, "");
	},

	cleanupEventStr : function(s) {
		s = "" + s;
		s = s.replace('function anonymous()\n{\n', '');
		s = s.replace('\n}', '');
		s = s.replace(/^return true;/gi, ''); // Remove event blocker

		return s;
	},

	getControlHTML : function(c) {
		var i, l, n, o, v;

		l = kampungan.plugins;
		for (n in l) {
			o = l[n];

			if (o.getControlHTML && (v = o.getControlHTML(c)) != '')
				return kampungan.replaceVar(v, "pluginurl", o.baseURL);
		}

		o = kampungan.themes[kampungan.settings['theme']];
		if (o.getControlHTML && (v = o.getControlHTML(c)) != '')
			return v;

		return '';
	},

	evalFunc : function(f, idx, a) {
		var s = '(', i;

		for (i=idx; i<a.length; i++) {
			s += 'a[' + i + ']';

			if (i < a.length-1)
				s += ',';
		}

		s += ');';

		return eval("f" + s);
	},

	dispatchCallback : function(i, p, n) {
		return this.callFunc(i, p, n, 0, this.dispatchCallback.arguments);
	},

	executeCallback : function(i, p, n) {
		return this.callFunc(i, p, n, 1, this.executeCallback.arguments);
	},

	execCommandCallback : function(i, p, n) {
		return this.callFunc(i, p, n, 2, this.execCommandCallback.arguments);
	},

	callFunc : function(ins, p, n, m, a) {
		var l, i, on, o, s, v;

		s = m == 2;

		l = kampungan.getParam(p, '');

		if (l != '' && (v = kampungan.evalFunc(typeof(l) == "function" ? l : eval(l), 3, a)) == s && m > 0)
			return true;

		if (ins != null) {
			for (i=0, l = ins.plugins; i<l.length; i++) {
				o = kampungan.plugins[l[i]];

				if (o[n] && (v = kampungan.evalFunc(o[n], 3, a)) == s && m > 0)
					return true;
			}
		}

		l = kampungan.themes;
		for (on in l) {
			o = l[on];

			if (o[n] && (v = kampungan.evalFunc(o[n], 3, a)) == s && m > 0)
				return true;
		}

		return false;
	},

	xmlEncode : function(s) {
		s = "" + s;
		s = s.replace(/&/g, '&amp;');
		s = s.replace(new RegExp('"', 'g'), '&quot;');
		s = s.replace(/\'/g, '&#39;'); // &apos; is not working in MSIE
		s = s.replace(/</g, '&lt;');
		s = s.replace(/>/g, '&gt;');

		return s;
	},

	extend : function(p, np) {
		var o = {};

		o.parent = p;

		for (n in p)
			o[n] = p[n];

		for (n in np)
			o[n] = np[n];

		return o;
	},

	hideMenus : function() {
		var e = kampungan.lastSelectedMenuBtn;

		if (kampungan.lastMenu) {
			kampungan.lastMenu.hide();
			kampungan.lastMenu = null;
		}

		if (e) {
			kampungan.switchClass(e, kampungan.lastMenuBtnClass);
			kampungan.lastSelectedMenuBtn = null;
		}
	},

	explode : function(d, s) {
		var ar = s.split(d), oar = new Array(), i;
	
		for (i = 0; i<ar.length; i++) {
			if (ar[i] != "")
				oar[oar.length] = ar[i];
		}
	
		return oar;
	}
};

// Global instances
var kampungan = kampungan_Engine; // Compatiblity with gzip compressors
var kampungan = new kampungan_Engine();
var kampunganLang = {};

/* file:jscripts/kampungan/classes/kampungan_Control.class.js */

function kampungan_Control(settings) {
	var t, i, to, fu, p, x, fn, fu, pn, s = settings;

	this.undoRedoLevel = true;
	this.iskampungan_Control = true;

	// Default settings
	this.settings = s;
	this.settings['theme'] = kampungan.getParam("theme", "default");
	this.settings['width'] = kampungan.getParam("width", -1);
	this.settings['height'] = kampungan.getParam("height", -1);
	this.selection = new kampungan_Selection(this);
	this.undoRedo = new kampungan_UndoRedo(this);
	this.cleanup = new kampungan_Cleanup();
	this.shortcuts = new Array();
	this.hasMouseMoved = false;

	this.cleanup.init({
		valid_elements : s.valid_elements,
		extended_valid_elements : s.extended_valid_elements,
		entities : s.entities,
		entity_encoding : s.entity_encoding,
		debug : s.cleanup_debug,
		url_converter : 'kampungan_Cleanup.prototype._urlConverter',
		indent : s.apply_source_formatting,
		invalid_elements : s.invalid_elements,
		verify_html : s.verify_html,
		fix_content_duplication : s.fix_content_duplication
	});

	// Wrap old theme
	t = this.settings['theme'];
	if (!kampungan.hasTheme(t)) {
		fn = kampungan.callbacks;
		to = {};

		for (i=0; i<fn.length; i++) {
			if ((fu = window['kampungan_' + t + "_" + fn[i]]))
				to[fn[i]] = fu;
		}

		kampungan.addTheme(t, to);
	}

	// Wrap old plugins
	this.plugins = new Array();
	p = kampungan.getParam('plugins', '', true, ',');
	if (p.length > 0) {
		for (i=0; i<p.length; i++) {
			pn = p[i];

			if (pn.charAt(0) == '-')
				pn = pn.substring(1);

			if (!kampungan.hasPlugin(pn)) {
				fn = kampungan.callbacks;
				to = {};

				for (x=0; x<fn.length; x++) {
					if ((fu = window['kampungan_' + pn + "_" + fn[x]]))
						to[fn[x]] = fu;
				}

				kampungan.addPlugin(pn, to);
			}

			this.plugins[this.plugins.length] = pn; 
		}
	}
};

kampungan_Control.prototype = {
	hasPlugin : function(n) {
		var i;

		for (i=0; i<this.plugins.length; i++) {
			if (this.plugins[i] == n)
				return true;
		}

		return false;
	},

	addPlugin : function(n, p) {
		if (!this.hasPlugin(n)) {
			kampungan.addPlugin(n, p);
			this.plugins[this.plugins.length] = n;
		}
	},

	repaint : function() {
		if (kampungan.isMSIE && !kampungan.isOpera)
			return;

		try {
			var s = this.selection;
			var b = s.getBookmark(true);
			this.getBody().style.display = 'none';
			this.getDoc().execCommand('selectall', false, null);
			this.getSel().collapseToStart();
			this.getBody().style.display = 'block';
			s.moveToBookmark(b);
		} catch (ex) {
			// Ignore
		}
	},

	switchSettings : function() {
		if (kampungan.configs.length > 1 && kampungan.currentConfig != this.settings['index']) {
			kampungan.settings = this.settings;
			kampungan.currentConfig = this.settings['index'];
		}
	},

	getBody : function() {
		return this.getDoc().body;
	},

	getDoc : function() {
		return this.contentWindow.document;
	},

	getWin : function() {
		return this.contentWindow;
	},

	addShortcut : function(m, k, d, cmd, ui, va) {
		var n = typeof(k) == "number", ie = kampungan.isMSIE, c, sc, i;
		var scl = this.shortcuts;

		if (!kampungan.getParam('custom_shortcuts'))
			return false;

		m = m.toLowerCase();
		k = ie && !n ? k.toUpperCase() : k;
		c = n ? null : k.charCodeAt(0);
		d = d && d.indexOf('lang_') == 0 ? kampungan.getLang(d) : d;

		sc = {
			alt : m.indexOf('alt') != -1,
			ctrl : m.indexOf('ctrl') != -1,
			shift : m.indexOf('shift') != -1,
			charCode : c,
			keyCode : n ? k : (ie ? c : null),
			desc : d,
			cmd : cmd,
			ui : ui,
			val : va
		};

		for (i=0; i<scl.length; i++) {
			if (sc.alt == scl[i].alt && sc.ctrl == scl[i].ctrl && sc.shift == scl[i].shift
				&& sc.charCode == scl[i].charCode && sc.keyCode == scl[i].keyCode) {
				return false;
			}
		}

		scl[scl.length] = sc;

		return true;
	},

	handleShortcut : function(e) {
		var i, s = this.shortcuts, o;

		for (i=0; i<s.length; i++) {
			o = s[i];
			if (o.alt == e.altKey && o.ctrl == e.ctrlKey && (o.keyCode == e.keyCode || o.charCode == e.charCode)) {
				if (o.cmd && (e.type == "keydown" || (e.type == "keypress" && !kampungan.isOpera)))
					kampungan.execCommand(o.cmd, o.ui, o.val);

				kampungan.cancelEvent(e);
				return true;
			}
		}

		return false;
	},

	autoResetDesignMode : function() {
		// Add fix for tab/style.display none/block problems in Gecko
		if (!kampungan.isMSIE && this.isHidden() && kampungan.getParam('auto_reset_designmode'))
			eval('try { this.getDoc().designMode = "On"; } catch(e) {}');
	},

	isHidden : function() {
		if (kampungan.isMSIE)
			return false;

		var s = this.getSel();

		// Weird, wheres that cursor selection?
		return (!s || !s.rangeCount || s.rangeCount == 0);
	},

	isDirty : function() {
		// Is content modified and not in a submit procedure
		return this.startContent != kampungan.trim(this.getBody().innerHTML) && !kampungan.isNotDirty;
	},

	_mergeElements : function(scmd, pa, ch, override) {
		if (scmd == "removeformat") {
			pa.className = "";
			pa.style.cssText = "";
			ch.className = "";
			ch.style.cssText = "";
			return;
		}

		var st = kampungan.parseStyle(kampungan.getAttrib(pa, "style"));
		var stc = kampungan.parseStyle(kampungan.getAttrib(ch, "style"));
		var className = kampungan.getAttrib(pa, "class");

		className += " " + kampungan.getAttrib(ch, "class");

		if (override) {
			for (var n in st) {
				if (typeof(st[n]) == 'function')
					continue;

				stc[n] = st[n];
			}
		} else {
			for (var n in stc) {
				if (typeof(stc[n]) == 'function')
					continue;

				st[n] = stc[n];
			}
		}

		kampungan.setAttrib(pa, "style", kampungan.serializeStyle(st));
		kampungan.setAttrib(pa, "class", kampungan.trim(className));
		ch.className = "";
		ch.style.cssText = "";
		ch.removeAttribute("class");
		ch.removeAttribute("style");
	},

	_setUseCSS : function(b) {
		var d = this.getDoc();

		try {d.execCommand("useCSS", false, !b);} catch (ex) {}
		try {d.execCommand("styleWithCSS", false, b);} catch (ex) {}

		if (!kampungan.getParam("table_inline_editing"))
			try {d.execCommand('enableInlineTableEditing', false, "false");} catch (ex) {}

		if (!kampungan.getParam("object_resizing"))
			try {d.execCommand('enableObjectResizing', false, "false");} catch (ex) {}
	},

	execCommand : function(command, user_interface, value) {
		var doc = this.getDoc();
		var win = this.getWin();
		var focusElm = this.getFocusElement();

		// Is non udno specific command
		if (!new RegExp('mceStartTyping|mceEndTyping|mceBeginUndoLevel|mceEndUndoLevel|mceAddUndoLevel', 'gi').test(command))
			this.undoBookmark = null;

		if (this.lastSafariSelection && !new RegExp('mceStartTyping|mceEndTyping|mceBeginUndoLevel|mceEndUndoLevel|mceAddUndoLevel', 'gi').test(command)) {
			this.selection.moveToBookmark(this.lastSafariSelection);
			kampungan.selectedElement = this.lastSafariSelectedElement;
		}

		// Mozilla issue
		if (!kampungan.isMSIE && !this.useCSS) {
			this._setUseCSS(false);
			this.useCSS = true;
		}

		//debug("command: " + command + ", user_interface: " + user_interface + ", value: " + value);
		this.contentDocument = doc; // <-- Strange, unless this is applied Mozilla 1.3 breaks

		if (kampungan.execCommandCallback(this, 'execcommand_callback', 'execCommand', this.editorId, this.getBody(), command, user_interface, value))
			return;

		// Fix align on images
		if (focusElm && focusElm.nodeName == "IMG") {
			var align = focusElm.getAttribute('align');
			var img = command == "JustifyCenter" ? focusElm.cloneNode(false) : focusElm;

			switch (command) {
				case "JustifyLeft":
					if (align == 'left')
						img.removeAttribute('align');
					else
						img.setAttribute('align', 'left');

					// Remove the div
					var div = focusElm.parentNode;
					if (div && div.nodeName == "DIV" && div.childNodes.length == 1 && div.parentNode)
						div.parentNode.replaceChild(img, div);

					this.selection.selectNode(img);
					this.repaint();
					kampungan.triggerNodeChange();
					return;

				case "JustifyCenter":
					img.removeAttribute('align');

					// Is centered
					var div = kampungan.getParentElement(focusElm, "div");
					if (div && div.style.textAlign == "center") {
						// Remove div
						if (div.nodeName == "DIV" && div.childNodes.length == 1 && div.parentNode)
							div.parentNode.replaceChild(img, div);
					} else {
						// Add div
						var div = this.getDoc().createElement("div");
						div.style.textAlign = 'center';
						div.appendChild(img);
						focusElm.parentNode.replaceChild(div, focusElm);
					}

					this.selection.selectNode(img);
					this.repaint();
					kampungan.triggerNodeChange();
					return;

				case "JustifyRight":
					if (align == 'right')
						img.removeAttribute('align');
					else
						img.setAttribute('align', 'right');

					// Remove the div
					var div = focusElm.parentNode;
					if (div && div.nodeName == "DIV" && div.childNodes.length == 1 && div.parentNode)
						div.parentNode.replaceChild(img, div);

					this.selection.selectNode(img);
					this.repaint();
					kampungan.triggerNodeChange();
					return;
			}
		}

		if (kampungan.settings['force_br_newlines']) {
			var alignValue = "";

			if (doc.selection.type != "Control") {
				switch (command) {
						case "JustifyLeft":
							alignValue = "left";
							break;

						case "JustifyCenter":
							alignValue = "center";
							break;

						case "JustifyFull":
							alignValue = "justify";
							break;

						case "JustifyRight":
							alignValue = "right";
							break;
				}

				if (alignValue != "") {
					var rng = doc.selection.createRange();

					if ((divElm = kampungan.getParentElement(rng.parentElement(), "div")) != null)
						divElm.setAttribute("align", alignValue);
					else if (rng.pasteHTML && rng.htmlText.length > 0)
						rng.pasteHTML('<div align="' + alignValue + '">' + rng.htmlText + "</div>");

					kampungan.triggerNodeChange();
					return;
				}
			}
		}

		switch (command) {
			case "mceRepaint":
				this.repaint();
				return true;

			case "InsertUnorderedList":
			case "InsertOrderedList":
				var tag = (command == "InsertUnorderedList") ? "ul" : "ol";

				if (kampungan.isSafari)
					this.execCommand("mceInsertContent", false, "<" + tag + "><li>&nbsp;</li><" + tag + ">");
				else
					this.getDoc().execCommand(command, user_interface, value);

				kampungan.triggerNodeChange();
				break;

			case "Strikethrough":
				if (kampungan.isSafari)
					this.execCommand("mceInsertContent", false, "<strike>" + this.selection.getSelectedHTML() + "</strike>");
				else
					this.getDoc().execCommand(command, user_interface, value);

				kampungan.triggerNodeChange();
				break;

			case "mceSelectNode":
				this.selection.selectNode(value);
				kampungan.triggerNodeChange();
				kampungan.selectedNode = value;
				break;

			case "FormatBlock":
				if (value == null || value == "") {
					var elm = kampungan.getParentElement(this.getFocusElement(), "p,div,h1,h2,h3,h4,h5,h6,pre,address,blockquote,dt,dl,dd,samp");

					if (elm)
						this.execCommand("mceRemoveNode", false, elm);
				} else {
					if (kampungan.isGecko && new RegExp('<(div|blockquote|code|dt|dd|dl|samp)>', 'gi').test(value))
						value = value.replace(/[^a-z]/gi, '');

					if (kampungan.isMSIE && new RegExp('blockquote|code|samp', 'gi').test(value)) {
						var b = this.selection.getBookmark();
						this.getDoc().execCommand("FormatBlock", false, '<p>');
						kampungan.renameElement(kampungan.getParentBlockElement(this.getFocusElement()), value);
						this.selection.moveToBookmark(b);
					} else
						this.getDoc().execCommand("FormatBlock", false, value);
				}

				kampungan.triggerNodeChange();

				break;

			case "mceRemoveNode":
				if (!value)
					value = kampungan.getParentElement(this.getFocusElement());

				if (kampungan.isMSIE) {
					value.outerHTML = value.innerHTML;
				} else {
					var rng = value.ownerDocument.createRange();
					rng.setStartBefore(value);
					rng.setEndAfter(value);
					rng.deleteContents();
					rng.insertNode(rng.createContextualFragment(value.innerHTML));
				}

				kampungan.triggerNodeChange();

				break;

			case "mceSelectNodeDepth":
				var parentNode = this.getFocusElement();
				for (var i=0; parentNode; i++) {
					if (parentNode.nodeName.toLowerCase() == "body")
						break;

					if (parentNode.nodeName.toLowerCase() == "#text") {
						i--;
						parentNode = parentNode.parentNode;
						continue;
					}

					if (i == value) {
						this.selection.selectNode(parentNode, false);
						kampungan.triggerNodeChange();
						kampungan.selectedNode = parentNode;
						return;
					}

					parentNode = parentNode.parentNode;
				}

				break;

			case "SetStyleInfo":
				var rng = this.getRng();
				var sel = this.getSel();
				var scmd = value['command'];
				var sname = value['name'];
				var svalue = value['value'] == null ? '' : value['value'];
				//var svalue = value['value'] == null ? '' : value['value'];
				var wrapper = value['wrapper'] ? value['wrapper'] : "span";
				var parentElm = null;
				var invalidRe = new RegExp("^BODY|HTML$", "g");
				var invalidParentsRe = kampungan.settings['merge_styles_invalid_parents'] != '' ? new RegExp(kampungan.settings['merge_styles_invalid_parents'], "gi") : null;

				// Whole element selected check
				if (kampungan.isMSIE) {
					// Control range
					if (rng.item)
						parentElm = rng.item(0);
					else {
						var pelm = rng.parentElement();
						var prng = doc.selection.createRange();
						prng.moveToElementText(pelm);

						if (rng.htmlText == prng.htmlText || rng.boundingWidth == 0) {
							if (invalidParentsRe == null || !invalidParentsRe.test(pelm.nodeName))
								parentElm = pelm;
						}
					}
				} else {
					var felm = this.getFocusElement();
					if (sel.isCollapsed || (new RegExp('td|tr|tbody|table', 'gi').test(felm.nodeName) && sel.anchorNode == felm.parentNode))
						parentElm = felm;
				}

				// Whole element selected
				if (parentElm && !invalidRe.test(parentElm.nodeName)) {
					if (scmd == "setstyle")
						kampungan.setStyleAttrib(parentElm, sname, svalue);

					if (scmd == "setattrib")
						kampungan.setAttrib(parentElm, sname, svalue);

					if (scmd == "removeformat") {
						parentElm.style.cssText = '';
						kampungan.setAttrib(parentElm, 'class', '');
					}

					// Remove style/attribs from all children
					var ch = kampungan.getNodeTree(parentElm, new Array(), 1);
					for (var z=0; z<ch.length; z++) {
						if (ch[z] == parentElm)
							continue;

						if (scmd == "setstyle")
							kampungan.setStyleAttrib(ch[z], sname, '');

						if (scmd == "setattrib")
							kampungan.setAttrib(ch[z], sname, '');

						if (scmd == "removeformat") {
							ch[z].style.cssText = '';
							kampungan.setAttrib(ch[z], 'class', '');
						}
					}
				} else {
					this._setUseCSS(false); // Bug in FF when running in fullscreen
					doc.execCommand("FontName", false, "#mce_temp_font#");
					var elementArray = kampungan.getElementsByAttributeValue(this.getBody(), "font", "face", "#mce_temp_font#");

					// Change them all
					for (var x=0; x<elementArray.length; x++) {
						elm = elementArray[x];
						if (elm) {
							var spanElm = doc.createElement(wrapper);

							if (scmd == "setstyle")
								kampungan.setStyleAttrib(spanElm, sname, svalue);

							if (scmd == "setattrib")
								kampungan.setAttrib(spanElm, sname, svalue);

							if (scmd == "removeformat") {
								spanElm.style.cssText = '';
								kampungan.setAttrib(spanElm, 'class', '');
							}

							if (elm.hasChildNodes()) {
								for (var i=0; i<elm.childNodes.length; i++)
									spanElm.appendChild(elm.childNodes[i].cloneNode(true));
							}

							spanElm.setAttribute("mce_new", "true");
							elm.parentNode.replaceChild(spanElm, elm);

							// Remove style/attribs from all children
							var ch = kampungan.getNodeTree(spanElm, new Array(), 1);
							for (var z=0; z<ch.length; z++) {
								if (ch[z] == spanElm)
									continue;

								if (scmd == "setstyle")
									kampungan.setStyleAttrib(ch[z], sname, '');

								if (scmd == "setattrib")
									kampungan.setAttrib(ch[z], sname, '');

								if (scmd == "removeformat") {
									ch[z].style.cssText = '';
									kampungan.setAttrib(ch[z], 'class', '');
								}
							}
						}
					}
				}

				// Cleaup wrappers
				var nodes = doc.getElementsByTagName(wrapper);
				for (var i=nodes.length-1; i>=0; i--) {
					var elm = nodes[i];
					var isNew = kampungan.getAttrib(elm, "mce_new") == "true";

					elm.removeAttribute("mce_new");

					// Is only child a element
					if (elm.childNodes && elm.childNodes.length == 1 && elm.childNodes[0].nodeType == 1) {
						//kampungan.debug("merge1" + isNew);
						this._mergeElements(scmd, elm, elm.childNodes[0], isNew);
						continue;
					}

					// Is I the only child
					if (elm.parentNode.childNodes.length == 1 && !invalidRe.test(elm.nodeName) && !invalidRe.test(elm.parentNode.nodeName)) {
						//kampungan.debug("merge2" + isNew + "," + elm.nodeName + "," + elm.parentNode.nodeName);
						if (invalidParentsRe == null || !invalidParentsRe.test(elm.parentNode.nodeName))
							this._mergeElements(scmd, elm.parentNode, elm, false);
					}
				}

				// Remove empty wrappers
				var nodes = doc.getElementsByTagName(wrapper);
				for (var i=nodes.length-1; i>=0; i--) {
					var elm = nodes[i];
					var isEmpty = true;

					// Check if it has any attribs
					var tmp = doc.createElement("body");
					tmp.appendChild(elm.cloneNode(false));

					// Is empty span, remove it
					tmp.innerHTML = tmp.innerHTML.replace(new RegExp('style=""|class=""', 'gi'), '');
					//kampungan.debug(tmp.innerHTML);
					if (new RegExp('<span>', 'gi').test(tmp.innerHTML)) {
						for (var x=0; x<elm.childNodes.length; x++) {
							if (elm.parentNode != null)
								elm.parentNode.insertBefore(elm.childNodes[x].cloneNode(true), elm);
						}

						elm.parentNode.removeChild(elm);
					}
				}

				// Re add the visual aids
				if (scmd == "removeformat")
					kampungan.handleVisualAid(this.getBody(), true, this.visualAid, this);

				kampungan.triggerNodeChange();

				break;

			case "FontName":
				if (value == null) {
					var s = this.getSel();

					// Find font and select it
					if (kampungan.isGecko && s.isCollapsed) {
						var f = kampungan.getParentElement(this.getFocusElement(), "font");

						if (f != null)
							this.selection.selectNode(f, false);
					}

					// Remove format
					this.getDoc().execCommand("RemoveFormat", false, null);

					// Collapse range if font was found
					if (f != null && kampungan.isGecko) {
						var r = this.getRng().cloneRange();
						r.collapse(true);
						s.removeAllRanges();
						s.addRange(r);
					}
				} else
					this.getDoc().execCommand('FontName', false, value);

				if (kampungan.isGecko)
					window.setTimeout('kampungan.triggerNodeChange(false);', 1);

				return;

			case "FontSize":
				this.getDoc().execCommand('FontSize', false, value);

				if (kampungan.isGecko)
					window.setTimeout('kampungan.triggerNodeChange(false);', 1);

				return;

			case "forecolor":
				this.getDoc().execCommand('forecolor', false, value);
				break;

			case "HiliteColor":
				if (kampungan.isGecko) {
					this._setUseCSS(true);
					this.getDoc().execCommand('hilitecolor', false, value);
					this._setUseCSS(false);
				} else
					this.getDoc().execCommand('BackColor', false, value);
				break;

			case "Cut":
			case "Copy":
			case "Paste":
				var cmdFailed = false;

				// Try executing command
				eval('try {this.getDoc().execCommand(command, user_interface, value);} catch (e) {cmdFailed = true;}');

				if (kampungan.isOpera && cmdFailed)
					alert('Currently not supported by your browser, use keyboard shortcuts instead.');

				// Alert error in gecko if command failed
				if (kampungan.isGecko && cmdFailed) {
					// Confirm more info
					if (confirm(kampungan.entityDecode(kampungan.getLang('lang_clipboard_msg'))))
						window.open('http://www.mozilla.org/editor/midasdemo/securityprefs.html', 'mceExternal');

					return;
				} else
					kampungan.triggerNodeChange();
			break;

			case "mceSetContent":
				if (!value)
					value = "";

				// Call custom cleanup code
				value = kampungan.storeAwayURLs(value);
				value = kampungan._customCleanup(this, "insert_to_editor", value);
				kampungan._setHTML(doc, value);
				kampungan.setInnerHTML(doc.body, kampungan._cleanupHTML(this, doc, kampungan.settings, doc.body));
				kampungan.convertAllRelativeURLs(doc.body);

				// Cleanup any mess left from storyAwayURLs
				kampungan._removeInternal(this.getBody());

				// When editing always use fonts internaly
				if (kampungan.getParam("convert_fonts_to_spans"))
					kampungan.convertSpansToFonts(doc);

				kampungan.handleVisualAid(doc.body, true, this.visualAid, this);
				kampungan._setEventsEnabled(doc.body, false);
				return true;

			case "mceCleanup":
				var b = this.selection.getBookmark();
				kampungan._setHTML(this.contentDocument, this.getBody().innerHTML);
				kampungan.setInnerHTML(this.getBody(), kampungan._cleanupHTML(this, this.contentDocument, this.settings, this.getBody(), this.visualAid));
				kampungan.convertAllRelativeURLs(doc.body);

				// When editing always use fonts internaly
				if (kampungan.getParam("convert_fonts_to_spans"))
					kampungan.convertSpansToFonts(doc);

				kampungan.handleVisualAid(this.getBody(), true, this.visualAid, this);
				kampungan._setEventsEnabled(this.getBody(), false);
				this.repaint();
				this.selection.moveToBookmark(b);
				kampungan.triggerNodeChange();
			break;

			case "mceReplaceContent":
				// Force empty string
				if (!value)
					value = '';

				this.getWin().focus();

				var selectedText = "";

				if (kampungan.isMSIE) {
					var rng = doc.selection.createRange();
					selectedText = rng.text;
				} else
					selectedText = this.getSel().toString();

				if (selectedText.length > 0) {
					value = kampungan.replaceVar(value, "selection", selectedText);
					kampungan.execCommand('mceInsertContent', false, value);
				}

				kampungan.triggerNodeChange();
			break;

			case "mceSetAttribute":
				if (typeof(value) == 'object') {
					var targetElms = (typeof(value['targets']) == "undefined") ? "p,img,span,div,td,h1,h2,h3,h4,h5,h6,pre,address" : value['targets'];
					var targetNode = kampungan.getParentElement(this.getFocusElement(), targetElms);

					if (targetNode) {
						targetNode.setAttribute(value['name'], value['value']);
						kampungan.triggerNodeChange();
					}
				}
			break;

			case "mceSetCSSClass":
				this.execCommand("SetStyleInfo", false, {command : "setattrib", name : "class", value : value});
			break;

			case "mceInsertRawHTML":
				var key = 'kampungan_marker';

				this.execCommand('mceBeginUndoLevel');

				// Insert marker key
				this.execCommand('mceInsertContent', false, key);

				// Store away scroll pos
				var scrollX = this.getDoc().body.scrollLeft + this.getDoc().documentElement.scrollLeft;
				var scrollY = this.getDoc().body.scrollTop + this.getDoc().documentElement.scrollTop;

				// Find marker and replace with RAW HTML
				var html = this.getBody().innerHTML;
				if ((pos = html.indexOf(key)) != -1)
					kampungan.setInnerHTML(this.getBody(), html.substring(0, pos) + value + html.substring(pos + key.length));

				// Restore scoll pos
				this.contentWindow.scrollTo(scrollX, scrollY);

				this.execCommand('mceEndUndoLevel');

				break;

			case "mceInsertContent":
				// Force empty string
				if (!value)
					value = '';

				var insertHTMLFailed = false;
				this.getWin().focus();

				if (kampungan.isGecko || kampungan.isOpera) {
					try {
						// Is plain text or HTML, &amp;, &nbsp; etc will be encoded wrong in FF
						if (value.indexOf('<') == -1 && !value.match(/(&#38;|&#160;|&#60;|&#62;)/g)) {
							var r = this.getRng();
							var n = this.getDoc().createTextNode(kampungan.entityDecode(value));
							var s = this.getSel();
							var r2 = r.cloneRange();

							// Insert text at cursor position
							s.removeAllRanges();
							r.deleteContents();
							r.insertNode(n);

							// Move the cursor to the end of text
							r2.selectNode(n);
							r2.collapse(false);
							s.removeAllRanges();
							s.addRange(r2);
						} else {
							value = kampungan.fixGeckoBaseHREFBug(1, this.getDoc(), value);
							this.getDoc().execCommand('inserthtml', false, value);
							kampungan.fixGeckoBaseHREFBug(2, this.getDoc(), value);
						}
					} catch (ex) {
						insertHTMLFailed = true;
					}

					if (!insertHTMLFailed) {
						kampungan.triggerNodeChange();
						return;
					}
				}

				// Ugly hack in Opera due to non working "inserthtml"
				if (kampungan.isOpera && insertHTMLFailed) {
					this.getDoc().execCommand("insertimage", false, kampungan.uniqueURL);
					var ar = kampungan.getElementsByAttributeValue(this.getBody(), "img", "src", kampungan.uniqueURL);
					ar[0].outerHTML = value;
					return;
				}

				if (!kampungan.isMSIE) {
					var isHTML = value.indexOf('<') != -1;
					var sel = this.getSel();
					var rng = this.getRng();

					if (isHTML) {
						if (kampungan.isSafari) {
							var tmpRng = this.getDoc().createRange();

							tmpRng.setStart(this.getBody(), 0);
							tmpRng.setEnd(this.getBody(), 0);

							value = tmpRng.createContextualFragment(value);
						} else
							value = rng.createContextualFragment(value);
					} else {
						// Setup text node
						var el = document.createElement("div");
						el.innerHTML = value;
						value = el.firstChild.nodeValue;
						value = doc.createTextNode(value);
					}

					// Insert plain text in Safari
					if (kampungan.isSafari && !isHTML) {
						this.execCommand('InsertText', false, value.nodeValue);
						kampungan.triggerNodeChange();
						return true;
					} else if (kampungan.isSafari && isHTML) {
						rng.deleteContents();
						rng.insertNode(value);
						kampungan.triggerNodeChange();
						return true;
					}

					rng.deleteContents();

					// If target node is text do special treatment, (Mozilla 1.3 fix)
					if (rng.startContainer.nodeType == 3) {
						var node = rng.startContainer.splitText(rng.startOffset);
						node.parentNode.insertBefore(value, node); 
					} else
						rng.insertNode(value);

					if (!isHTML) {
						// Removes weird selection trails
						sel.selectAllChildren(doc.body);
						sel.removeAllRanges();

						// Move cursor to end of content
						var rng = doc.createRange();

						rng.selectNode(value);
						rng.collapse(false);

						sel.addRange(rng);
					} else
						rng.collapse(false);

					kampungan.fixGeckoBaseHREFBug(2, this.getDoc(), value);
				} else {
					var rng = doc.selection.createRange();
					var c = value.indexOf('<!--') != -1;

					// Fix comment bug, add tag before comments
					if (c)
						value = kampungan.uniqueTag + value;

					if (rng.item)
						rng.item(0).outerHTML = value;
					else
						rng.pasteHTML(value);

					// Remove unique tag
					if (c) {
						var e = this.getDoc().getElementById('mceTMPElement');
						e.parentNode.removeChild(e);
					}
				}

				kampungan.triggerNodeChange();
			break;

			case "mceStartTyping":
				if (kampungan.settings['custom_undo_redo'] && this.undoRedo.typingUndoIndex == -1) {
					this.undoRedo.typingUndoIndex = this.undoRedo.undoIndex;
					this.execCommand('mceAddUndoLevel');
					//kampungan.debug("mceStartTyping");
				}
				break;

			case "mceEndTyping":
				if (kampungan.settings['custom_undo_redo'] && this.undoRedo.typingUndoIndex != -1) {
					this.execCommand('mceAddUndoLevel');
					this.undoRedo.typingUndoIndex = -1;
					//kampungan.debug("mceEndTyping");
				}
				break;

			case "mceBeginUndoLevel":
				this.undoRedoLevel = false;
				break;

			case "mceEndUndoLevel":
				this.undoRedoLevel = true;
				this.execCommand('mceAddUndoLevel');
				break;

			case "mceAddUndoLevel":
				if (kampungan.settings['custom_undo_redo'] && this.undoRedoLevel) {
					if (this.undoRedo.add())
						kampungan.triggerNodeChange(false);
				}
				break;

			case "Undo":
				if (kampungan.settings['custom_undo_redo']) {
					kampungan.execCommand("mceEndTyping");
					this.undoRedo.undo();
					kampungan.triggerNodeChange();
				} else
					this.getDoc().execCommand(command, user_interface, value);
				break;

			case "Redo":
				if (kampungan.settings['custom_undo_redo']) {
					kampungan.execCommand("mceEndTyping");
					this.undoRedo.redo();
					kampungan.triggerNodeChange();
				} else
					this.getDoc().execCommand(command, user_interface, value);
				break;

			case "mceToggleVisualAid":
				this.visualAid = !this.visualAid;
				kampungan.handleVisualAid(this.getBody(), true, this.visualAid, this);
				kampungan.triggerNodeChange();
				break;

			case "Indent":
				this.getDoc().execCommand(command, user_interface, value);
				kampungan.triggerNodeChange();
				if (kampungan.isMSIE) {
					var n = kampungan.getParentElement(this.getFocusElement(), "blockquote");
					do {
						if (n && n.nodeName == "BLOCKQUOTE") {
							n.removeAttribute("dir");
							n.removeAttribute("style");
						}
					} while (n != null && (n = n.parentNode) != null);
				}
				break;

			case "removeformat":
				var text = this.selection.getSelectedText();

				if (kampungan.isOpera) {
					this.getDoc().execCommand("RemoveFormat", false, null);
					return;
				}

				if (kampungan.isMSIE) {
					try {
						var rng = doc.selection.createRange();
						rng.execCommand("RemoveFormat", false, null);
					} catch (e) {
						// Do nothing
					}

					this.execCommand("SetStyleInfo", false, {command : "removeformat"});
				} else {
					this.getDoc().execCommand(command, user_interface, value);

					this.execCommand("SetStyleInfo", false, {command : "removeformat"});
				}

				// Remove class
				if (text.length == 0)
					this.execCommand("mceSetCSSClass", false, "");

				kampungan.triggerNodeChange();
				break;

			default:
				this.getDoc().execCommand(command, user_interface, value);

				if (kampungan.isGecko)
					window.setTimeout('kampungan.triggerNodeChange(false);', 1);
				else
					kampungan.triggerNodeChange();
		}

		// Add undo level after modification
		if (command != "mceAddUndoLevel" && command != "Undo" && command != "Redo" && command != "mceStartTyping" && command != "mceEndTyping")
			kampungan.execCommand("mceAddUndoLevel");
	},

	queryCommandValue : function(c) {
		try {
			return this.getDoc().queryCommandValue(c);
		} catch (e) {
			return null;
		}
	},

	queryCommandState : function(c) {
		return this.getDoc().queryCommandState(c);
	},

	_onAdd : function(replace_element, form_element_name, target_document) {
		var hc, th, to, editorTemplate;

		th = this.settings['theme'];
		to = kampungan.themes[th];

		var targetDoc = target_document ? target_document : document;

		this.targetDoc = targetDoc;

		kampungan.themeURL = kampungan.baseURL + "/themes/" + this.settings['theme'];
		this.settings['themeurl'] = kampungan.themeURL;

		if (!replace_element) {
			alert("Error: Could not find the target element.");
			return false;
		}

		if (to.getEditorTemplate)
			editorTemplate = to.getEditorTemplate(this.settings, this.editorId);

		var deltaWidth = editorTemplate['delta_width'] ? editorTemplate['delta_width'] : 0;
		var deltaHeight = editorTemplate['delta_height'] ? editorTemplate['delta_height'] : 0;
		var html = '<span id="' + this.editorId + '_parent" class="mceEditorContainer">' + editorTemplate['html'];

		html = kampungan.replaceVar(html, "editor_id", this.editorId);
		this.settings['default_document'] = kampungan.baseURL + "/blank.htm";

		this.settings['old_width'] = this.settings['width'];
		this.settings['old_height'] = this.settings['height'];

		// Set default width, height
		if (this.settings['width'] == -1)
			this.settings['width'] = replace_element.offsetWidth;

		if (this.settings['height'] == -1)
			this.settings['height'] = replace_element.offsetHeight;

		// Try the style width
		if (this.settings['width'] == 0)
			this.settings['width'] = replace_element.style.width;

		// Try the style height
		if (this.settings['height'] == 0)
			this.settings['height'] = replace_element.style.height; 

		// If no width/height then default to 320x240, better than nothing
		if (this.settings['width'] == 0)
			this.settings['width'] = 320;

		if (this.settings['height'] == 0)
			this.settings['height'] = 240;

		this.settings['area_width'] = parseInt(this.settings['width']);
		this.settings['area_height'] = parseInt(this.settings['height']);
		this.settings['area_width'] += deltaWidth;
		this.settings['area_height'] += deltaHeight;

		// Special % handling
		if (("" + this.settings['width']).indexOf('%') != -1)
			this.settings['area_width'] = "100%";

		if (("" + this.settings['height']).indexOf('%') != -1)
			this.settings['area_height'] = "100%";

		if (("" + replace_element.style.width).indexOf('%') != -1) {
			this.settings['width'] = replace_element.style.width;
			this.settings['area_width'] = "100%";
		}

		if (("" + replace_element.style.height).indexOf('%') != -1) {
			this.settings['height'] = replace_element.style.height;
			this.settings['area_height'] = "100%";
		}

		html = kampungan.applyTemplate(html);

		this.settings['width'] = this.settings['old_width'];
		this.settings['height'] = this.settings['old_height'];

		this.visualAid = this.settings['visual'];
		this.formTargetElementId = form_element_name;

		// Get replace_element contents
		if (replace_element.nodeName == "TEXTAREA" || replace_element.nodeName == "INPUT")
			this.startContent = replace_element.value;
		else
			this.startContent = replace_element.innerHTML;

		// If not text area or input
		if (replace_element.nodeName != "TEXTAREA" && replace_element.nodeName != "INPUT") {
			this.oldTargetElement = replace_element;

			// Debug mode
			if (kampungan.settings['debug']) {
				hc = '<textarea wrap="off" id="' + form_element_name + '" name="' + form_element_name + '" cols="100" rows="15"></textarea>';
			} else {
				hc = '<input type="hidden" id="' + form_element_name + '" name="' + form_element_name + '" />';
				this.oldTargetElement.style.display = "none";
			}

			html += '</span>';

			if (kampungan.isGecko)
				html = hc + html;
			else
				html += hc;

			// Output HTML and set editable
			if (kampungan.isGecko) {
				var rng = replace_element.ownerDocument.createRange();
				rng.setStartBefore(replace_element);

				var fragment = rng.createContextualFragment(html);
				kampungan.insertAfter(fragment, replace_element);
			} else
				replace_element.insertAdjacentHTML("beforeBegin", html);
		} else {
			html += '</span>';

			// Just hide the textarea element
			this.oldTargetElement = replace_element;

			if (!kampungan.settings['debug'])
				this.oldTargetElement.style.display = "none";

			// Output HTML and set editable
			if (kampungan.isGecko) {
				var rng = replace_element.ownerDocument.createRange();
				rng.setStartBefore(replace_element);

				var fragment = rng.createContextualFragment(html);
				kampungan.insertAfter(fragment, replace_element);
			} else
				replace_element.insertAdjacentHTML("beforeBegin", html);
		}

		// Setup iframe
		var dynamicIFrame = false;
		var tElm = targetDoc.getElementById(this.editorId);

		if (!kampungan.isMSIE) {
			// Node case is preserved in XML strict mode
			if (tElm && (tElm.nodeName == "SPAN" || tElm.nodeName == "span")) {
				tElm = kampungan._createIFrame(tElm, targetDoc);
				dynamicIFrame = true;
			}

			this.targetElement = tElm;
			this.iframeElement = tElm;
			this.contentDocument = tElm.contentDocument;
			this.contentWindow = tElm.contentWindow;

			//this.getDoc().designMode = "on";
		} else {
			if (tElm && tElm.nodeName == "SPAN")
				tElm = kampungan._createIFrame(tElm, targetDoc, targetDoc.parentWindow);
			else
				tElm = targetDoc.frames[this.editorId];

			this.targetElement = tElm;
			this.iframeElement = targetDoc.getElementById(this.editorId);

			if (kampungan.isOpera) {
				this.contentDocument = this.iframeElement.contentDocument;
				this.contentWindow = this.iframeElement.contentWindow;
				dynamicIFrame = true;
			} else {
				this.contentDocument = tElm.window.document;
				this.contentWindow = tElm.window;
			}

			this.getDoc().designMode = "on";
		}

		// Setup base HTML
		var doc = this.contentDocument;
		if (dynamicIFrame) {
			var html = kampungan.getParam('doctype') + '<html><head xmlns="http://www.w3.org/1999/xhtml"><base href="' + kampungan.settings['base_href'] + '" /><title>blank_page</title><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></head><body class="mceContentBody"></body></html>';

			try {
				if (!this.isHidden())
					this.getDoc().designMode = "on";

				doc.open();
				doc.write(html);
				doc.close();
			} catch (e) {
				// Failed Mozilla 1.3
				this.getDoc().location.href = kampungan.baseURL + "/blank.htm";
			}
		}

		// This timeout is needed in MSIE 5.5 for some odd reason
		// it seems that the document.frames isn't initialized yet?
		if (kampungan.isMSIE)
			window.setTimeout("kampungan.addEventHandlers(kampungan.instances[\"" + this.editorId + "\"]);", 1);

		kampungan.setupContent(this.editorId, true);

		return true;
	},

	setBaseHREF : function(u) {
		var h, b, d, nl;

		d = this.getDoc();
		nl = d.getElementsByTagName("base");
		b = nl.length > 0 ? nl[0] : null;

		if (!b) {
			nl = d.getElementsByTagName("head");
			h = nl.length > 0 ? nl[0] : null;

			b = d.createElement("base");
			b.setAttribute('href', u);
			h.appendChild(b);
		} else {
			if (u == "" || u == null)
				b.parentNode.removeChild(b);
			else
				b.setAttribute('href', u);
		}
	},

	getFocusElement : function() {
		return this.selection.getFocusElement();
	},

	getSel : function() {
		return this.selection.getSel();
	},

	getRng : function() {
		return this.selection.getRng();
	},

	triggerSave : function(skip_cleanup, skip_callback) {
		var e, nl = new Array(), i, s;

		this.switchSettings();
		s = kampungan.settings;

		// Force hidden tabs visible while serializing
		if (kampungan.isMSIE && !kampungan.isOpera) {
			e = this.iframeElement;

			do {
				if (e.style && e.style.display == 'none') {
					e.style.display = 'block';
					nl[nl.length] = {elm : e, type : 'style'};
				}

				if (e.style && s.hidden_tab_class.length > 0 && e.className.indexOf(s.hidden_tab_class) != -1) {
					e.className = s.display_tab_class;
					nl[nl.length] = {elm : e, type : 'class'};
				}
			} while ((e = e.parentNode) != null)
		}

		kampungan.settings['preformatted'] = false;

		// Default to false
		if (typeof(skip_cleanup) == "undefined")
			skip_cleanup = false;

		// Default to false
		if (typeof(skip_callback) == "undefined")
			skip_callback = false;

		kampungan._setHTML(this.getDoc(), this.getBody().innerHTML);

		// Remove visual aids when cleanup is disabled
		if (this.settings['cleanup'] == false) {
			kampungan.handleVisualAid(this.getBody(), true, false, this);
			kampungan._setEventsEnabled(this.getBody(), true);
		}

		kampungan._customCleanup(this, "submit_content_dom", this.contentWindow.document.body);
		var htm = skip_cleanup ? this.getBody().innerHTML : kampungan._cleanupHTML(this, this.getDoc(), this.settings, this.getBody(), kampungan.visualAid, true, true);
		htm = kampungan._customCleanup(this, "submit_content", htm);

		if (!skip_callback && kampungan.settings['save_callback'] != "")
			var content = eval(kampungan.settings['save_callback'] + "(this.formTargetElementId,htm,this.getBody());");

		// Use callback content if available
		if ((typeof(content) != "undefined") && content != null)
			htm = content;

		// Replace some weird entities (Bug: #1056343)
		htm = kampungan.regexpReplace(htm, "&#40;", "(", "gi");
		htm = kampungan.regexpReplace(htm, "&#41;", ")", "gi");
		htm = kampungan.regexpReplace(htm, "&#59;", ";", "gi");
		htm = kampungan.regexpReplace(htm, "&#34;", "&quot;", "gi");
		htm = kampungan.regexpReplace(htm, "&#94;", "^", "gi");

		if (this.formElement)
			this.formElement.value = htm;

		if (kampungan.isSafari && this.formElement)
			this.formElement.innerText = htm;

		// Hide them again (tabs in MSIE)
		for (i=0; i<nl.length; i++) {
			if (nl[i].type == 'style')
				nl[i].elm.style.display = 'none';
			else
				nl[i].elm.className = s.hidden_tab_class;
		}
	}
};

/* file:jscripts/kampungan/classes/kampungan_Cleanup.class.js */

kampungan_Engine.prototype.cleanupHTMLCode = function(s) {
	s = s.replace(new RegExp('<p \\/>', 'gi'), '<p>&nbsp;</p>');
	s = s.replace(new RegExp('<p>\\s*<\\/p>', 'gi'), '<p>&nbsp;</p>');

	// Fix close BR elements
	s = s.replace(new RegExp('<br>\\s*<\\/br>', 'gi'), '<br />');

	// Open closed tags like <b/> to <b></b>
	s = s.replace(new RegExp('<(h[1-6]|p|div|address|pre|form|table|li|ol|ul|td|b|font|em|strong|i|strike|u|span|a|ul|ol|li|blockquote)([a-z]*)([^\\\\|>]*)\\/>', 'gi'), '<$1$2$3></$1$2>');

	// Remove trailing space <b > to <b>
	s = s.replace(new RegExp('\\s+></', 'gi'), '></');

	// Close tags <img></img> to <img/>
	s = s.replace(new RegExp('<(img|br|hr)([^>]*)><\\/(img|br|hr)>', 'gi'), '<$1$2 />');

	// Weird MSIE bug, <p><hr /></p> breaks runtime?
	if (kampungan.isMSIE)
		s = s.replace(new RegExp('<p><hr \\/><\\/p>', 'gi'), "<hr>");

	// Convert relative anchors to absolute URLs ex: #something to file.htm#something
	if (kampungan.getParam('convert_urls'))
		s = s.replace(new RegExp('(href=\"{0,1})(\\s*#)', 'gi'), '$1' + kampungan.settings['document_base_url'] + "#");

	return s;
};

kampungan_Engine.prototype.parseStyle = function(str) {
	var ar = new Array();

	if (str == null)
		return ar;

	var st = str.split(';');

	kampungan.clearArray(ar);

	for (var i=0; i<st.length; i++) {
		if (st[i] == '')
			continue;

		var re = new RegExp('^\\s*([^:]*):\\s*(.*)\\s*$');
		var pa = st[i].replace(re, '$1||$2').split('||');
//kampungan.debug(str, pa[0] + "=" + pa[1], st[i].replace(re, '$1||$2'));
		if (pa.length == 2)
			ar[pa[0].toLowerCase()] = pa[1];
	}

	return ar;
};

kampungan_Engine.prototype.compressStyle = function(ar, pr, sf, res) {
	var box = new Array();

	box[0] = ar[pr + '-top' + sf];
	box[1] = ar[pr + '-left' + sf];
	box[2] = ar[pr + '-right' + sf];
	box[3] = ar[pr + '-bottom' + sf];

	for (var i=0; i<box.length; i++) {
		if (box[i] == null)
			return;

		for (var a=0; a<box.length; a++) {
			if (box[a] != box[i])
				return;
		}
	}

	// They are all the same
	ar[res] = box[0];
	ar[pr + '-top' + sf] = null;
	ar[pr + '-left' + sf] = null;
	ar[pr + '-right' + sf] = null;
	ar[pr + '-bottom' + sf] = null;
};

kampungan_Engine.prototype.serializeStyle = function(ar) {
	var str = "";

	// Compress box
	kampungan.compressStyle(ar, "border", "", "border");
	kampungan.compressStyle(ar, "border", "-width", "border-width");
	kampungan.compressStyle(ar, "border", "-color", "border-color");
	kampungan.compressStyle(ar, "border", "-style", "border-style");
	kampungan.compressStyle(ar, "padding", "", "padding");
	kampungan.compressStyle(ar, "margin", "", "margin");

	for (var key in ar) {
		var val = ar[key];

		if (typeof(val) == 'function')
			continue;

		if (key.indexOf('mso-') == 0)
			continue;

		if (val != null && val != '') {
			val = '' + val; // Force string

			// Fix style URL
			val = val.replace(new RegExp("url\\(\\'?([^\\']*)\\'?\\)", 'gi'), "url('$1')");

			// Convert URL
			if (val.indexOf('url(') != -1 && kampungan.getParam('convert_urls')) {
				var m = new RegExp("url\\('(.*?)'\\)").exec(val);

				if (m.length > 1)
					val = "url('" + eval(kampungan.getParam('urlconverter_callback') + "(m[1], null, true);") + "')";
			}

			// Force HEX colors
			if (kampungan.getParam("force_hex_style_colors"))
				val = kampungan.convertRGBToHex(val, true);

			if (val != "url('')")
				str += key.toLowerCase() + ": " + val + "; ";
		}
	}

	if (new RegExp('; $').test(str))
		str = str.substring(0, str.length - 2);

	return str;
};

kampungan_Engine.prototype.convertRGBToHex = function(s, k) {
	if (s.toLowerCase().indexOf('rgb') != -1) {
		var re = new RegExp("(.*?)rgb\\s*?\\(\\s*?([0-9]+).*?,\\s*?([0-9]+).*?,\\s*?([0-9]+).*?\\)(.*?)", "gi");
		var rgb = s.replace(re, "$1,$2,$3,$4,$5").split(',');
		if (rgb.length == 5) {
			r = parseInt(rgb[1]).toString(16);
			g = parseInt(rgb[2]).toString(16);
			b = parseInt(rgb[3]).toString(16);

			r = r.length == 1 ? '0' + r : r;
			g = g.length == 1 ? '0' + g : g;
			b = b.length == 1 ? '0' + b : b;

			s = "#" + r + g + b;

			if (k)
				s = rgb[0] + s + rgb[4];
		}
	}

	return s;
};

kampungan_Engine.prototype.convertHexToRGB = function(s) {
	if (s.indexOf('#') != -1) {
		s = s.replace(new RegExp('[^0-9A-F]', 'gi'), '');
		return "rgb(" + parseInt(s.substring(0, 2), 16) + "," + parseInt(s.substring(2, 4), 16) + "," + parseInt(s.substring(4, 6), 16) + ")";
	}

	return s;
};

kampungan_Engine.prototype.convertSpansToFonts = function(doc) {
	var sizes = kampungan.getParam('font_size_style_values').replace(/\s+/, '').split(',');

	var h = doc.body.innerHTML;
	h = h.replace(/<span/gi, '<font');
	h = h.replace(/<\/span/gi, '</font');
	doc.body.innerHTML = h;

	var s = doc.getElementsByTagName("font");
	for (var i=0; i<s.length; i++) {
		var size = kampungan.trim(s[i].style.fontSize).toLowerCase();
		var fSize = 0;

		for (var x=0; x<sizes.length; x++) {
			if (sizes[x] == size) {
				fSize = x + 1;
				break;
			}
		}

		if (fSize > 0) {
			kampungan.setAttrib(s[i], 'size', fSize);
			s[i].style.fontSize = '';
		}

		var fFace = s[i].style.fontFamily;
		if (fFace != null && fFace != "") {
			kampungan.setAttrib(s[i], 'face', fFace);
			s[i].style.fontFamily = '';
		}

		var fColor = s[i].style.color;
		if (fColor != null && fColor != "") {
			kampungan.setAttrib(s[i], 'color', kampungan.convertRGBToHex(fColor));
			s[i].style.color = '';
		}
	}
};

kampungan_Engine.prototype.convertFontsToSpans = function(doc) {
	var sizes = kampungan.getParam('font_size_style_values').replace(/\s+/, '').split(',');

	var h = doc.body.innerHTML;
	h = h.replace(/<font/gi, '<span');
	h = h.replace(/<\/font/gi, '</span');
	doc.body.innerHTML = h;

	var fsClasses = kampungan.getParam('font_size_classes');
	if (fsClasses != '')
		fsClasses = fsClasses.replace(/\s+/, '').split(',');
	else
		fsClasses = null;

	var s = doc.getElementsByTagName("span");
	for (var i=0; i<s.length; i++) {
		var fSize, fFace, fColor;

		fSize = kampungan.getAttrib(s[i], 'size');
		fFace = kampungan.getAttrib(s[i], 'face');
		fColor = kampungan.getAttrib(s[i], 'color');

		if (fSize != "") {
			fSize = parseInt(fSize);

			if (fSize > 0 && fSize < 8) {
				if (fsClasses != null)
					kampungan.setAttrib(s[i], 'class', fsClasses[fSize-1]);
				else
					s[i].style.fontSize = sizes[fSize-1];
			}

			s[i].removeAttribute('size');
		}

		if (fFace != "") {
			s[i].style.fontFamily = fFace;
			s[i].removeAttribute('face');
		}

		if (fColor != "") {
			s[i].style.color = fColor;
			s[i].removeAttribute('color');
		}
	}
};

kampungan_Engine.prototype.cleanupAnchors = function(doc) {
	var i, cn, x, an = doc.getElementsByTagName("a");

	// Loops backwards due to bug #1467987
	for (i=an.length-1; i>=0; i--) {
		if (kampungan.getAttrib(an[i], "name") != "" && kampungan.getAttrib(an[i], "href") == "") {
			cn = an[i].childNodes;

			for (x=cn.length-1; x>=0; x--)
				kampungan.insertAfter(cn[x], an[i]);
		}
	}
};

kampungan_Engine.prototype.getContent = function(editor_id) {
	var h;

	if (typeof(editor_id) != "undefined")
		kampungan.selectedInstance = kampungan.getInstanceById(editor_id);

	if (kampungan.selectedInstance) {
		h = kampungan._cleanupHTML(this.selectedInstance, this.selectedInstance.getDoc(), kampungan.settings, this.selectedInstance.getBody(), false, true);

		// When editing always use fonts internaly
		if (kampungan.getParam("convert_fonts_to_spans"))
			kampungan.convertSpansToFonts(this.selectedInstance.getDoc());

		return h;
	}

	return null;
};

kampungan_Engine.prototype._fixListElements = function(d) {
	var nl, x, a = ['ol', 'ul'], i, n, p, r = new RegExp('^(OL|UL)$'), np;

	for (x=0; x<a.length; x++) {
		nl = d.getElementsByTagName(a[x]);

		for (i=0; i<nl.length; i++) {
			n = nl[i];
			p = n.parentNode;

			if (r.test(p.nodeName)) {
				np = kampungan.prevNode(n, 'LI');

				if (!np) {
					np = d.createElement('li');
					np.innerHTML = '&nbsp;';
					np.appendChild(n);
					p.insertBefore(np, p.firstChild);
				} else
					np.appendChild(n);
			}
		}
	}
};

kampungan_Engine.prototype._fixTables = function(d) {
	var nl, i, n, p, np, x, t;

	nl = d.getElementsByTagName('table');
	for (i=0; i<nl.length; i++) {
		n = nl[i];

		if ((p = kampungan.getParentElement(n, 'p,div,h1,h2,h3,h4,h5,h6')) != null) {
			np = p.cloneNode(false);
			np.removeAttribute('id');

			t = n;

			while ((n = n.nextSibling))
				np.appendChild(n);

			kampungan.insertAfter(np, p);
			kampungan.insertAfter(t, p);
		}
	}
};

kampungan_Engine.prototype._cleanupHTML = function(inst, doc, config, elm, visual, on_save, on_submit) {
	var h, d, t1, t2, t3, t4, t5, c, s;

	if (!kampungan.getParam('cleanup'))
		return elm.innerHTML;

	on_save = typeof(on_save) == 'undefined' ? false : on_save;

	c = inst.cleanup;
	s = inst.settings;
	d = c.settings.debug;

	if (d)
		t1 = new Date().getTime();

	if (kampungan.getParam("convert_fonts_to_spans"))
		kampungan.convertFontsToSpans(doc);

	if (kampungan.getParam("fix_list_elements"))
		kampungan._fixListElements(doc);

	if (kampungan.getParam("fix_table_elements"))
		kampungan._fixTables(doc);

	// Call custom cleanup code
	kampungan._customCleanup(inst, on_save ? "get_from_editor_dom" : "insert_to_editor_dom", doc.body);

	if (d)
		t2 = new Date().getTime();

	c.settings.on_save = on_save;
	//for (var i=0; i<100; i++)

	c.idCount = 0;
	c.serializationId++;
	c.serializedNodes = new Array();
	c.sourceIndex = -1;

	if (s.cleanup_serializer == "xml")
		h = c.serializeNodeAsXML(elm);
	else
		h = c.serializeNodeAsHTML(elm);

	if (d)
		t3 = new Date().getTime();

	// Post processing
	h = h.replace(/<\/?(body|head|html)[^>]*>/gi, '');
	h = h.replace(new RegExp(' (rowspan="1"|colspan="1")', 'g'), '');
	h = h.replace(/<p><hr \/><\/p>/g, '<hr />');
	h = h.replace(/<p>(&nbsp;|&#160;)<\/p><hr \/><p>(&nbsp;|&#160;)<\/p>/g, '<hr />');
	h = h.replace(/<td>\s*<br \/>\s*<\/td>/g, '<td>&nbsp;</td>');
	h = h.replace(/<p>\s*<br \/>\s*<\/p>/g, '<p>&nbsp;</p>');
	h = h.replace(/<p>\s*(&nbsp;|&#160;)\s*<br \/>\s*(&nbsp;|&#160;)\s*<\/p>/g, '<p>&nbsp;</p>');
	h = h.replace(/<p>\s*(&nbsp;|&#160;)\s*<br \/>\s*<\/p>/g, '<p>&nbsp;</p>');
	h = h.replace(/<p>\s*<br \/>\s*&nbsp;\s*<\/p>/g, '<p>&nbsp;</p>');
	h = h.replace(new RegExp('<a>(.*?)<\\/a>', 'g'), '$1');
	h = h.replace(/<p([^>]*)>\s*<\/p>/g, '<p$1>&nbsp;</p>');

	// Clean body
	if (/^\s*(<br \/>|<p>&nbsp;<\/p>|<p>&#160;<\/p>|<p><\/p>)\s*$/.test(h))
		h = '';

	// If preformatted
	if (s.preformatted) {
		h = h.replace(/^<pre>/, '');
		h = h.replace(/<\/pre>$/, '');
		h = '<pre>' + h + '</pre>';
	}

	// Gecko specific processing
	if (kampungan.isGecko) {
		h = h.replace(/<o:p _moz-userdefined="" \/>/g, '');
		h = h.replace(/<td([^>]*)>\s*<br \/>\s*<\/td>/g, '<td$1>&nbsp;</td>');
	}

	if (s.force_br_newlines)
		h = h.replace(/<p>(&nbsp;|&#160;)<\/p>/g, '<br />');

	// Call custom cleanup code
	h = kampungan._customCleanup(inst, on_save ? "get_from_editor" : "insert_to_editor", h);

	// Remove internal classes
	if (on_save) {
		h = h.replace(new RegExp(' ?(mceItem[a-zA-Z0-9]*|' + s.visual_table_class + ')', 'g'), '');
		h = h.replace(new RegExp(' ?class=""', 'g'), '');
	}

	if (s.remove_linebreaks && !c.settings.indent)
		h = h.replace(/\n|\r/g, ' ');

	if (d)
		t4 = new Date().getTime();

	if (on_save && c.settings.indent)
		h = c.formatHTML(h);

	// If encoding (not recommended option)
	if (on_submit && (s.encoding == "xml" || s.encoding == "html"))
		h = c.xmlEncode(h);

	if (d)
		t5 = new Date().getTime();

	if (c.settings.debug)
		kampungan.debug("Cleanup in ms: Pre=" + (t2-t1) + ", Serialize: " + (t3-t2) + ", Post: " + (t4-t3) + ", Format: " + (t5-t4) + ", Sum: " + (t5-t1) + ".");

	return h;
};

function kampungan_Cleanup() {
	this.isMSIE = (navigator.appName == "Microsoft Internet Explorer");
	this.rules = kampungan.clearArray(new Array());

	// Default config
	this.settings = {
		indent_elements : 'head,table,tbody,thead,tfoot,form,tr,ul,ol,blockquote,object',
		newline_before_elements : 'h1,h2,h3,h4,h5,h6,pre,address,div,ul,ol,li,meta,option,area,title,link,base,script,td',
		newline_after_elements : 'br,hr,p,pre,address,div,ul,ol,meta,option,area,link,base,script',
		newline_before_after_elements : 'html,head,body,table,thead,tbody,tfoot,tr,form,ul,ol,blockquote,p,object,param,hr,div',
		indent_char : '\t',
		indent_levels : 1,
		entity_encoding : 'raw',
		valid_elements : '*[*]',
		entities : '',
		url_converter : '',
		invalid_elements : '',
		verify_html : false
	};

	this.vElements = kampungan.clearArray(new Array());
	this.vElementsRe = '';
	this.closeElementsRe = /^(IMG|BR|HR|LINK|META|BASE|INPUT|BUTTON|AREA)$/;
	this.codeElementsRe = /^(SCRIPT|STYLE)$/;
	this.serializationId = 0;
	this.mceAttribs = {
		href : 'mce_href',
		src : 'mce_src',
		type : 'mce_type'
	};
}

kampungan_Cleanup.prototype = {
	init : function(s) {
		var n, a, i, ir, or, st;

		for (n in s)
			this.settings[n] = s[n];

		// Setup code formating
		s = this.settings;

		// Setup regexps
		this.inRe = this._arrayToRe(s.indent_elements.split(','), '', '^<(', ')[^>]*');
		this.ouRe = this._arrayToRe(s.indent_elements.split(','), '', '^<\\/(', ')[^>]*');
		this.nlBeforeRe = this._arrayToRe(s.newline_before_elements.split(','), 'gi', '<(',  ')([^>]*)>');
		this.nlAfterRe = this._arrayToRe(s.newline_after_elements.split(','), 'gi', '<(',  ')([^>]*)>');
		this.nlBeforeAfterRe = this._arrayToRe(s.newline_before_after_elements.split(','), 'gi', '<(\\/?)(', ')([^>]*)>');

		if (s.invalid_elements != '')
			this.iveRe = this._arrayToRe(s.invalid_elements.toUpperCase().split(','), 'g', '^(', ')$');
		else
			this.iveRe = null;

		// Setup separator
		st = '';
		for (i=0; i<s.indent_levels; i++)
			st += s.indent_char;

		this.inStr = st;

		// If verify_html if false force *[*]
		if (!s.verify_html) {
			s.valid_elements = '*[*]';
			s.extended_valid_elements = '';
		}

		this.fillStr = s.entity_encoding == "named" ? "&nbsp;" : "&#160;";
		this.idCount = 0;
	},

	addRuleStr : function(s) {
		var r = this.parseRuleStr(s);
		var n;

		for (n in r) {
			if (r[n])
				this.rules[n] = r[n];
		}

		this.vElements = kampungan.clearArray(new Array());

		for (n in this.rules) {
			if (this.rules[n])
				this.vElements[this.vElements.length] = this.rules[n].tag;
		}

		this.vElementsRe = this._arrayToRe(this.vElements, '');
	},

	parseRuleStr : function(s) {
		var ta, p, r, a, i, x, px, t, tn, y, av, or = kampungan.clearArray(new Array()), dv;

		if (s == null || s.length == 0)
			return or;

		ta = s.split(',');
		for (x=0; x<ta.length; x++) {
			s = ta[x];
			if (s.length == 0)
				continue;

			// Split tag/attrs
			p = this.split(/\[|\]/, s);
			if (p == null || p.length < 1)
				t = s.toUpperCase();
			else
				t = p[0].toUpperCase();

			// Handle all tag names
			tn = this.split('/', t);
			for (y=0; y<tn.length; y++) {
				r = {};

				r.tag = tn[y];
				r.forceAttribs = null;
				r.defaultAttribs = null;
				r.validAttribValues = null;

				// Handle prefixes
				px = r.tag.charAt(0);
				r.forceOpen = px == '+';
				r.removeEmpty = px == '-';
				r.fill = px == '#';
				r.tag = r.tag.replace(/\+|-|#/g, '');
				r.oTagName = tn[0].replace(/\+|-|#/g, '').toLowerCase();
				r.isWild = new RegExp('\\*|\\?|\\+', 'g').test(r.tag);
				r.validRe = new RegExp(this._wildcardToRe('^' + r.tag + '$'));

				// Setup valid attributes
				if (p.length > 1) {
					r.vAttribsRe = '^(';
					a = this.split(/\|/, p[1]);

					for (i=0; i<a.length; i++) {
						t = a[i];

						av = new RegExp('(=|:|<)(.*?)$').exec(t);
						t = t.replace(new RegExp('(=|:|<).*?$'), '');
						if (av && av.length > 0) {
							if (av[0].charAt(0) == ':') {
								if (!r.forceAttribs)
									r.forceAttribs = kampungan.clearArray(new Array());

								r.forceAttribs[t.toLowerCase()] = av[0].substring(1);
							} else if (av[0].charAt(0) == '=') {
								if (!r.defaultAttribs)
									r.defaultAttribs = kampungan.clearArray(new Array());

								dv = av[0].substring(1);

								r.defaultAttribs[t.toLowerCase()] = dv == "" ? "mce_empty" : dv;
							} else if (av[0].charAt(0) == '<') {
								if (!r.validAttribValues)
									r.validAttribValues = kampungan.clearArray(new Array());

								r.validAttribValues[t.toLowerCase()] = this._arrayToRe(this.split('?', av[0].substring(1)), '');
							}
						}

						r.vAttribsRe += '' + t.toLowerCase() + (i != a.length - 1 ? '|' : '');

						a[i] = t.toLowerCase();
					}

					r.vAttribsRe += ')$';
					r.vAttribsRe = this._wildcardToRe(r.vAttribsRe);
					r.vAttribsReIsWild = new RegExp('\\*|\\?|\\+', 'g').test(r.vAttribsRe);
					r.vAttribsRe = new RegExp(r.vAttribsRe);
					r.vAttribs = a.reverse();

					//kampungan.debug(r.tag, r.oTagName, r.vAttribsRe, r.vAttribsReWC);
				} else {
					r.vAttribsRe = '';
					r.vAttribs = kampungan.clearArray(new Array());
					r.vAttribsReIsWild = false;
				}

				or[r.tag] = r;
			}
		}

		return or;
	},

	serializeNodeAsXML : function(n) {
		var s, b;

		if (!this.xmlDoc) {
			if (this.isMSIE) {
				try {this.xmlDoc = new ActiveXObject('MSXML2.DOMDocument');} catch (e) {}

				if (!this.xmlDoc)
					try {this.xmlDoc = new ActiveXObject('Microsoft.XmlDom');} catch (e) {}
			} else
				this.xmlDoc = document.implementation.createDocument('', '', null);

			if (!this.xmlDoc)
				alert("Error XML Parser could not be found.");
		}

		if (this.xmlDoc.firstChild)
			this.xmlDoc.removeChild(this.xmlDoc.firstChild);

		b = this.xmlDoc.createElement("html");
		b = this.xmlDoc.appendChild(b);

		this._convertToXML(n, b);

		if (this.isMSIE)
			return this.xmlDoc.xml;
		else
			return new XMLSerializer().serializeToString(this.xmlDoc);
	},

	_convertToXML : function(n, xn) {
		var xd, el, i, l, cn, at, no, hc = false;

		if (this._isDuplicate(n))
			return;

		xd = this.xmlDoc;

		switch (n.nodeType) {
			case 1: // Element
				hc = n.hasChildNodes();

				el = xd.createElement(n.nodeName.toLowerCase());

				at = n.attributes;
				for (i=at.length-1; i>-1; i--) {
					no = at[i];

					if (no.specified && no.nodeValue)
						el.setAttribute(no.nodeName.toLowerCase(), no.nodeValue);
				}

				if (!hc && !this.closeElementsRe.test(n.nodeName))
					el.appendChild(xd.createTextNode(""));

				xn = xn.appendChild(el);
				break;

			case 3: // Text
				xn.appendChild(xd.createTextNode(n.nodeValue));
				return;

			case 8: // Comment
				xn.appendChild(xd.createComment(n.nodeValue));
				return;
		}

		if (hc) {
			cn = n.childNodes;

			for (i=0, l=cn.length; i<l; i++)
				this._convertToXML(cn[i], xn);
		}
	},

	serializeNodeAsHTML : function(n) {
		var en, no, h = '', i, l, r, cn, va = false, f = false, at, hc;

		this._setupRules(); // Will initialize cleanup rules

		if (this._isDuplicate(n))
			return '';

		switch (n.nodeType) {
			case 1: // Element
				hc = n.hasChildNodes();

				// MSIE sometimes produces <//tag>
				if ((kampungan.isMSIE && !kampungan.isOpera) && n.nodeName.indexOf('/') != -1)
					break;

				if (this.vElementsRe.test(n.nodeName) && (!this.iveRe || !this.iveRe.test(n.nodeName))) {
					va = true;

					r = this.rules[n.nodeName];
					if (!r) {
						at = this.rules;
						for (no in at) {
							if (at[no] && at[no].validRe.test(n.nodeName)) {
								r = at[no];
								break;
							}
						}
					}

					en = r.isWild ? n.nodeName.toLowerCase() : r.oTagName;
					f = r.fill;

					if (r.removeEmpty && !hc)
						return "";

					h += '<' + en;

					if (r.vAttribsReIsWild) {
						// Serialize wildcard attributes
						at = n.attributes;
						for (i=at.length-1; i>-1; i--) {
							no = at[i];
							if (no.specified && r.vAttribsRe.test(no.nodeName))
								h += this._serializeAttribute(n, r, no.nodeName);
						}
					} else {
						// Serialize specific attributes
						for (i=r.vAttribs.length-1; i>-1; i--)
							h += this._serializeAttribute(n, r, r.vAttribs[i]);
					}

					// Serialize mce_ atts
					if (!this.settings.on_save) {
						at = this.mceAttribs;

						for (no in at) {
							if (at[no])
								h += this._serializeAttribute(n, r, at[no]);
						}
					}

					// Close these
					if (this.closeElementsRe.test(n.nodeName))
						return h + ' />';

					h += '>';

					if (this.isMSIE && this.codeElementsRe.test(n.nodeName))
						h += n.innerHTML;
				}
			break;

			case 3: // Text
				if (n.parentNode && this.codeElementsRe.test(n.parentNode.nodeName))
					return this.isMSIE ? '' : n.nodeValue;

				return this.xmlEncode(n.nodeValue);

			case 8: // Comment
				return "<!--" + this._trimComment(n.nodeValue) + "-->";
		}

		if (hc) {
			cn = n.childNodes;

			for (i=0, l=cn.length; i<l; i++)
				h += this.serializeNodeAsHTML(cn[i]);
		}

		// Fill empty nodes
		if (f && !hc)
			h += this.fillStr;

		// End element
		if (va)
			h += '</' + en + '>';

		return h;
	},

	_serializeAttribute : function(n, r, an) {
		var av = '', t, os = this.settings.on_save;

		if (os && (an.indexOf('mce_') == 0 || an.indexOf('_moz') == 0))
			return '';

		if (os && this.mceAttribs[an])
			av = this._getAttrib(n, this.mceAttribs[an]);

		if (av.length == 0)
			av = this._getAttrib(n, an);

		if (av.length == 0 && r.defaultAttribs && (t = r.defaultAttribs[an])) {
			av = t;

			if (av == "mce_empty")
				return " " + an + '=""';
		}

		if (r.forceAttribs && (t = r.forceAttribs[an]))
			av = t;

		if (os && av.length != 0 && this.settings.url_converter.length != 0 && /^(src|href|longdesc)$/.test(an))
			av = eval(this.settings.url_converter + '(this, n, av)');

		if (av.length != 0 && r.validAttribValues && r.validAttribValues[an] && !r.validAttribValues[an].test(av))
			return "";

		if (av.length != 0 && av == "{$uid}")
			av = "uid_" + (this.idCount++);

		if (av.length != 0)
			return " " + an + "=" + '"' + this.xmlEncode(av) + '"';

		return "";
	},

	formatHTML : function(h) {
		var s = this.settings, p = '', i = 0, li = 0, o = '', l;

		h = h.replace(/\r/g, ''); // Windows sux, isn't carriage return a thing of the past :)
		h = '\n' + h;
		h = h.replace(new RegExp('\\n\\s+', 'gi'), '\n'); // Remove previous formatting
		h = h.replace(this.nlBeforeRe, '\n<$1$2>');
		h = h.replace(this.nlAfterRe, '<$1$2>\n');
		h = h.replace(this.nlBeforeAfterRe, '\n<$1$2$3>\n');
		h += '\n';

		//kampungan.debug(h);

		while ((i = h.indexOf('\n', i + 1)) != -1) {
			if ((l = h.substring(li + 1, i)).length != 0) {
				if (this.ouRe.test(l) && p.length >= s.indent_levels)
					p = p.substring(s.indent_levels);

				o += p + l + '\n';
	
				if (this.inRe.test(l))
					p += this.inStr;
			}

			li = i;
		}

		//kampungan.debug(h);

		return o;
	},

	xmlEncode : function(s) {
		var i, l, e, o = '', c;

		this._setupEntities(); // Will intialize lookup table

		switch (this.settings.entity_encoding) {
			case "raw":
				return kampungan.xmlEncode(s);

			case "named":
				for (i=0, l=s.length; i<l; i++) {
					c = s.charCodeAt(i);
					e = this.entities[c];

					if (e && e != '')
						o += '&' + e + ';';
					else
						o += String.fromCharCode(c);
				}

				return o;

			case "numeric":
				for (i=0, l=s.length; i<l; i++) {
					c = s.charCodeAt(i);

					if (c > 127 || c == 60 || c == 62 || c == 38 || c == 39 || c == 34)
						o += '&#' + c + ";";
					else
						o += String.fromCharCode(c);
				}

				return o;
		}

		return s;
	},

	split : function(re, s) {
		var c = s.split(re);
		var i, l, o = new Array();

		for (i=0, l=c.length; i<l; i++) {
			if (c[i] != '')
				o[i] = c[i];
		}

		return o;
	},

	_trimComment : function(s) {
		// Remove mce_src, mce_href
		s = s.replace(new RegExp('\\smce_src=\"[^\"]*\"', 'gi'), "");
		s = s.replace(new RegExp('\\smce_href=\"[^\"]*\"', 'gi'), "");

		return s;
	},

	_getAttrib : function(e, n, d) {
		if (typeof(d) == "undefined")
			d = "";

		if (!e || e.nodeType != 1)
			return d;

		var v = e.getAttribute(n, 0);

		if (n == "class" && !v)
			v = e.className;

		if (this.isMSIE && n == "http-equiv")
			v = e.httpEquiv;

		if (this.isMSIE && e.nodeName == "FORM" && n == "enctype" && v == "application/x-www-form-urlencoded")
			v = "";

		if (this.isMSIE && e.nodeName == "INPUT" && n == "size" && v == "20")
			v = "";

		if (this.isMSIE && e.nodeName == "INPUT" && n == "maxlength" && v == "2147483647")
			v = "";

		if (n == "style" && !kampungan.isOpera)
			v = e.style.cssText;

		if (n == 'style')
			v = kampungan.serializeStyle(kampungan.parseStyle(v));

		if (this.settings.on_save && n.indexOf('on') != -1 && this.settings.on_save && v && v != "")
			v = kampungan.cleanupEventStr(v);

		return (v && v != "") ? '' + v : d;
	},

	_urlConverter : function(c, n, v) {
		if (!c.settings.on_save)
			return kampungan.convertRelativeToAbsoluteURL(kampungan.settings.base_href, v);
		else if (kampungan.getParam('convert_urls'))
			return eval(kampungan.settings.urlconverter_callback + "(v, n, true);");

		return v;
	},

	_arrayToRe : function(a, op, be, af) {
		var i, r;

		op = typeof(op) == "undefined" ? "gi" : op;
		be = typeof(be) == "undefined" ? "^(" : be;
		af = typeof(af) == "undefined" ? ")$" : af;

		r = be;

		for (i=0; i<a.length; i++)
			r += this._wildcardToRe(a[i]) + (i != a.length-1 ? "|" : "");

		r += af;

		return new RegExp(r, op);
	},

	_wildcardToRe : function(s) {
		s = s.replace(/\?/g, '(\\S?)');
		s = s.replace(/\+/g, '(\\S+)');
		s = s.replace(/\*/g, '(\\S*)');

		return s;
	},

	_setupEntities : function() {
		var n, a, i, s = this.settings;

		// Setup entities
		if (!this.entitiesDone) {
			if (s.entity_encoding == "named") {
				n = kampungan.clearArray(new Array());
				a = this.split(',', s.entities);
				for (i=0; i<a.length; i+=2)
					n[a[i]] = a[i+1];

				this.entities = n;
			}

			this.entitiesDone = true;
		}
	},

	_setupRules : function() {
		var s = this.settings;

		// Setup default rule
		if (!this.rulesDone) {
			this.addRuleStr(s.valid_elements);
			this.addRuleStr(s.extended_valid_elements);

			this.rulesDone = true;
		}
	},

	_isDuplicate : function(n) {
		var i;

		if (!this.settings.fix_content_duplication)
			return false;

		if (kampungan.isMSIE && !kampungan.isOpera && n.nodeType == 1) {
			// Mark elements
			if (n.mce_serialized == this.serializationId)
				return true;

			n.setAttribute('mce_serialized', this.serializationId);
		} else {
			// Search lookup table for text nodes  and comments
			for (i=0; i<this.serializedNodes.length; i++) {
				if (this.serializedNodes[i] == n)
					return true;
			}

			this.serializedNodes[this.serializedNodes.length] = n;
		}

		return false;
	}
};

/* file:jscripts/kampungan/classes/kampungan_DOMUtils.class.js */

kampungan_Engine.prototype.getElementByAttributeValue = function(n, e, a, v) {
	return (n = this.getElementsByAttributeValue(n, e, a, v)).length == 0 ? null : n[0];
};

kampungan_Engine.prototype.getElementsByAttributeValue = function(n, e, a, v) {
	var i, nl = n.getElementsByTagName(e), o = new Array();

	for (i=0; i<nl.length; i++) {
		if (kampungan.getAttrib(nl[i], a).indexOf(v) != -1)
			o[o.length] = nl[i];
	}

	return o;
};

kampungan_Engine.prototype.isBlockElement = function(n) {
	return n != null && n.nodeType == 1 && this.blockRegExp.test(n.nodeName);
};

kampungan_Engine.prototype.getParentBlockElement = function(n) {
	while (n) {
		if (this.isBlockElement(n))
			return n;

		n = n.parentNode;
	}

	return null;
};

kampungan_Engine.prototype.insertAfter = function(n, r){
	if (r.nextSibling)
		r.parentNode.insertBefore(n, r.nextSibling);
	else
		r.parentNode.appendChild(n);
};

kampungan_Engine.prototype.setInnerHTML = function(e, h) {
	var i, nl, n;

	if (kampungan.isMSIE && !kampungan.isOpera) {
		// Since MSIE handles invalid HTML better that valid XHTML we
		// need to make some things invalid. <hr /> gets converted to <hr>.
		h = h.replace(/\s\/>/g, '>');

		// Since MSIE auto generated emtpy P tags some times we must tell it to keep the real ones
		h = h.replace(/<p([^>]*)>\u00A0?<\/p>/gi, '<p$1 mce_keep="true">&nbsp;</p>'); // Keep empty paragraphs
		h = h.replace(/<p([^>]*)>\s*&nbsp;\s*<\/p>/gi, '<p$1 mce_keep="true">&nbsp;</p>'); // Keep empty paragraphs
		h = h.replace(/<p([^>]*)>\s+<\/p>/gi, '<p$1 mce_keep="true">&nbsp;</p>'); // Keep empty paragraphs

		// Remove first comment
		e.innerHTML = kampungan.uniqueTag + h;
		e.firstChild.removeNode(true);

		// Remove weird auto generated empty paragraphs unless it's supposed to be there
		nl = e.getElementsByTagName("p");
		for (i=nl.length-1; i>=0; i--) {
			n = nl[i];

			if (n.nodeName == 'P' && !n.hasChildNodes() && !n.mce_keep)
				n.parentNode.removeChild(n);
		}
	} else {
		h = this.fixGeckoBaseHREFBug(1, e, h);
		e.innerHTML = h;
		this.fixGeckoBaseHREFBug(2, e, h);
	}
};

kampungan_Engine.prototype.getOuterHTML = function(e) {
	if (kampungan.isMSIE)
		return e.outerHTML;

	var d = e.ownerDocument.createElement("body");
	d.appendChild(e);
	return d.innerHTML;
};

kampungan_Engine.prototype.setOuterHTML = function(e, h) {
	if (kampungan.isMSIE) {
		e.outerHTML = h;
		return;
	}

	var d = e.ownerDocument.createElement("body");
	d.innerHTML = h;
	e.parentNode.replaceChild(d.firstChild, e);
};

kampungan_Engine.prototype._getElementById = function(id, d) {
	var e, i, j, f;

	if (typeof(d) == "undefined")
		d = document;

	e = d.getElementById(id);
	if (!e) {
		f = d.forms;

		for (i=0; i<f.length; i++) {
			for (j=0; j<f[i].elements.length; j++) {
				if (f[i].elements[j].name == id) {
					e = f[i].elements[j];
					break;
				}
			}
		}
	}

	return e;
};

kampungan_Engine.prototype.getNodeTree = function(n, na, t, nn) {
	var i;

	if (typeof(t) == "undefined" || n.nodeType == t && (typeof(nn) == "undefined" || n.nodeName == nn))
		na[na.length] = n;

	if (n.hasChildNodes()) {
		for (i=0; i<n.childNodes.length; i++)
			kampungan.getNodeTree(n.childNodes[i], na, t, nn);
	}

	return na;
};

kampungan_Engine.prototype.getParentElement = function(node, names, attrib_name, attrib_value) {
	if (typeof(names) == "undefined") {
		if (node.nodeType == 1)
			return node;

		// Find parent node that is a element
		while ((node = node.parentNode) != null && node.nodeType != 1) ;

		return node;
	}

	if (node == null)
		return null;

	var namesAr = names.toUpperCase().split(',');

	do {
		for (var i=0; i<namesAr.length; i++) {
			if (node.nodeName == namesAr[i] || names == "*") {
				if (typeof(attrib_name) == "undefined")
					return node;
				else if (node.getAttribute(attrib_name)) {
					if (typeof(attrib_value) == "undefined") {
						if (node.getAttribute(attrib_name) != "")
							return node;
					} else if (node.getAttribute(attrib_name) == attrib_value)
						return node;
				}
			}
		}
	} while ((node = node.parentNode) != null);

	return null;
};

kampungan_Engine.prototype.getParentNode = function(n, f) {
	while (n) {
		if (f(n))
			return n;

		n = n.parentNode;
	}

	return null;
};

kampungan_Engine.prototype.getAttrib = function(elm, name, default_value) {
	if (typeof(default_value) == "undefined")
		default_value = "";

	// Not a element
	if (!elm || elm.nodeType != 1)
		return default_value;

	var v = elm.getAttribute(name);

	// Try className for class attrib
	if (name == "class" && !v)
		v = elm.className;

	// Workaround for a issue with Firefox 1.5rc2+
	if (kampungan.isGecko && name == "src" && elm.src != null && elm.src != "")
		v = elm.src;

	// Workaround for a issue with Firefox 1.5rc2+
	if (kampungan.isGecko && name == "href" && elm.href != null && elm.href != "")
		v = elm.href;

	if (name == "http-equiv" && kampungan.isMSIE)
		v = elm.httpEquiv;

	if (name == "style" && !kampungan.isOpera)
		v = elm.style.cssText;

	return (v && v != "") ? v : default_value;
};

kampungan_Engine.prototype.setAttrib = function(element, name, value, fix_value) {
	if (typeof(value) == "number" && value != null)
		value = "" + value;

	if (fix_value) {
		if (value == null)
			value = "";

		var re = new RegExp('[^0-9%]', 'g');
		value = value.replace(re, '');
	}

	if (name == "style")
		element.style.cssText = value;

	if (name == "class")
		element.className = value;

	if (value != null && value != "" && value != -1)
		element.setAttribute(name, value);
	else
		element.removeAttribute(name);
};

kampungan_Engine.prototype.setStyleAttrib = function(elm, name, value) {
	eval('elm.style.' + name + '=value;');

	// Style attrib deleted
	if (kampungan.isMSIE && value == null || value == '') {
		var str = kampungan.serializeStyle(kampungan.parseStyle(elm.style.cssText));
		elm.style.cssText = str;
		elm.setAttribute("style", str);
	}
};

kampungan_Engine.prototype.switchClass = function(ei, c) {
	var e;

	if (kampungan.switchClassCache[ei])
		e = kampungan.switchClassCache[ei];
	else
		e = kampungan.switchClassCache[ei] = document.getElementById(ei);

	if (e) {
		// Keep tile mode
		if (kampungan.settings.button_tile_map && e.className && e.className.indexOf('mceTiledButton') == 0)
			c = 'mceTiledButton ' + c;

		e.className = c;
	}
};

kampungan_Engine.prototype.getAbsPosition = function(n) {
	var p = {absLeft : 0, absTop : 0};

	while (n) {
		p.absLeft += n.offsetLeft;
		p.absTop += n.offsetTop;
		n = n.offsetParent;
	}

	return p;
};

kampungan_Engine.prototype.prevNode = function(e, n) {
	var a = n.split(','), i;

	while ((e = e.previousSibling) != null) {
		for (i=0; i<a.length; i++) {
			if (e.nodeName == a[i])
				return e;
		}
	}

	return null;
};

kampungan_Engine.prototype.nextNode = function(e, n) {
	var a = n.split(','), i;

	while ((e = e.nextSibling) != null) {
		for (i=0; i<a.length; i++) {
			if (e.nodeName == a[i])
				return e;
		}
	}

	return null;
};

kampungan_Engine.prototype.selectNodes = function(n, f, a) {
	var i;

	if (!a)
		a = new Array();

	if (f(n))
		a[a.length] = n;

	if (n.hasChildNodes()) {
		for (i=0; i<n.childNodes.length; i++)
			kampungan.selectNodes(n.childNodes[i], f, a);
	}

	return a;
};

kampungan_Engine.prototype.addCSSClass = function(e, c, b) {
	var o = this.removeCSSClass(e, c);

	return e.className = b ? c + (o != '' ? (' ' + o) : '') : (o != '' ? (o + ' ') : '') + c;
};

kampungan_Engine.prototype.removeCSSClass = function(e, c) {
	var a = this.explode(' ', e.className), i;

	for (i=0; i<a.length; i++) {
		if (a[i] == c)
			a[i] = '';
	}

	return e.className = a.join(' ');
};

kampungan_Engine.prototype.renameElement = function(e, n, d) {
	var ne, i, ar;

	d = typeof(d) == "undefined" ? kampungan.selectedInstance.getDoc() : d;

	if (e) {
		ne = d.createElement(n);

		ar = e.attributes;
		for (i=ar.length-1; i>-1; i--) {
			if (ar[i].specified && ar[i].nodeValue)
				ne.setAttribute(ar[i].nodeName.toLowerCase(), ar[i].nodeValue);
		}

		ar = e.childNodes;
		for (i=0; i<ar.length; i++)
			ne.appendChild(ar[i].cloneNode(true));

		e.parentNode.replaceChild(ne, e);
	}
};

/* file:jscripts/kampungan/classes/kampungan_URL.class.js */

kampungan_Engine.prototype.parseURL = function(url_str) {
	var urlParts = new Array();

	if (url_str) {
		var pos, lastPos;

		// Parse protocol part
		pos = url_str.indexOf('://');
		if (pos != -1) {
			urlParts['protocol'] = url_str.substring(0, pos);
			lastPos = pos + 3;
		}

		// Find port or path start
		for (var i=lastPos; i<url_str.length; i++) {
			var chr = url_str.charAt(i);

			if (chr == ':')
				break;

			if (chr == '/')
				break;
		}
		pos = i;

		// Get host
		urlParts['host'] = url_str.substring(lastPos, pos);

		// Get port
		urlParts['port'] = "";
		lastPos = pos;
		if (url_str.charAt(pos) == ':') {
			pos = url_str.indexOf('/', lastPos);
			urlParts['port'] = url_str.substring(lastPos+1, pos);
		}

		// Get path
		lastPos = pos;
		pos = url_str.indexOf('?', lastPos);

		if (pos == -1)
			pos = url_str.indexOf('#', lastPos);

		if (pos == -1)
			pos = url_str.length;

		urlParts['path'] = url_str.substring(lastPos, pos);

		// Get query
		lastPos = pos;
		if (url_str.charAt(pos) == '?') {
			pos = url_str.indexOf('#');
			pos = (pos == -1) ? url_str.length : pos;
			urlParts['query'] = url_str.substring(lastPos+1, pos);
		}

		// Get anchor
		lastPos = pos;
		if (url_str.charAt(pos) == '#') {
			pos = url_str.length;
			urlParts['anchor'] = url_str.substring(lastPos+1, pos);
		}
	}

	return urlParts;
};

kampungan_Engine.prototype.serializeURL = function(up) {
	var o = "";

	if (up['protocol'])
		o += up['protocol'] + "://";

	if (up['host'])
		o += up['host'];

	if (up['port'])
		o += ":" + up['port'];

	if (up['path'])
		o += up['path'];

	if (up['query'])
		o += "?" + up['query'];

	if (up['anchor'])
		o += "#" + up['anchor'];

	return o;
};

kampungan_Engine.prototype.convertAbsoluteURLToRelativeURL = function(base_url, url_to_relative) {
	var baseURL = this.parseURL(base_url);
	var targetURL = this.parseURL(url_to_relative);
	var strTok1;
	var strTok2;
	var breakPoint = 0;
	var outPath = "";
	var forceSlash = false;

	if (targetURL.path == "")
		targetURL.path = "/";
	else
		forceSlash = true;

	// Crop away last path part
	base_url = baseURL.path.substring(0, baseURL.path.lastIndexOf('/'));
	strTok1 = base_url.split('/');
	strTok2 = targetURL.path.split('/');

	if (strTok1.length >= strTok2.length) {
		for (var i=0; i<strTok1.length; i++) {
			if (i >= strTok2.length || strTok1[i] != strTok2[i]) {
				breakPoint = i + 1;
				break;
			}
		}
	}

	if (strTok1.length < strTok2.length) {
		for (var i=0; i<strTok2.length; i++) {
			if (i >= strTok1.length || strTok1[i] != strTok2[i]) {
				breakPoint = i + 1;
				break;
			}
		}
	}

	if (breakPoint == 1)
		return targetURL.path;

	for (var i=0; i<(strTok1.length-(breakPoint-1)); i++)
		outPath += "../";

	for (var i=breakPoint-1; i<strTok2.length; i++) {
		if (i != (breakPoint-1))
			outPath += "/" + strTok2[i];
		else
			outPath += strTok2[i];
	}

	targetURL.protocol = null;
	targetURL.host = null;
	targetURL.port = null;
	targetURL.path = outPath == "" && forceSlash ? "/" : outPath;

	// Remove document prefix from local anchors
	var fileName = baseURL.path;
	var pos;

	if ((pos = fileName.lastIndexOf('/')) != -1)
		fileName = fileName.substring(pos + 1);

	// Is local anchor
	if (fileName == targetURL.path && targetURL.anchor != "")
		targetURL.path = "";

	// If empty and not local anchor force filename or slash
	if (targetURL.path == "" && !targetURL.anchor)
		targetURL.path = fileName != "" ? fileName : "/";

	return this.serializeURL(targetURL);
};

kampungan_Engine.prototype.convertRelativeToAbsoluteURL = function(base_url, relative_url) {
	var baseURL = this.parseURL(base_url);
	var relURL = this.parseURL(relative_url);

	if (relative_url == "" || relative_url.charAt(0) == '/' || relative_url.indexOf('://') != -1 || relative_url.indexOf('mailto:') != -1 || relative_url.indexOf('javascript:') != -1)
		return relative_url;

	// Split parts
	baseURLParts = baseURL['path'].split('/');
	relURLParts = relURL['path'].split('/');

	// Remove empty chunks
	var newBaseURLParts = new Array();
	for (var i=baseURLParts.length-1; i>=0; i--) {
		if (baseURLParts[i].length == 0)
			continue;

		newBaseURLParts[newBaseURLParts.length] = baseURLParts[i];
	}
	baseURLParts = newBaseURLParts.reverse();

	// Merge relURLParts chunks
	var newRelURLParts = new Array();
	var numBack = 0;
	for (var i=relURLParts.length-1; i>=0; i--) {
		if (relURLParts[i].length == 0 || relURLParts[i] == ".")
			continue;

		if (relURLParts[i] == '..') {
			numBack++;
			continue;
		}

		if (numBack > 0) {
			numBack--;
			continue;
		}

		newRelURLParts[newRelURLParts.length] = relURLParts[i];
	}

	relURLParts = newRelURLParts.reverse();

	// Remove end from absolute path
	var len = baseURLParts.length-numBack;
	var absPath = (len <= 0 ? "" : "/") + baseURLParts.slice(0, len).join('/') + "/" + relURLParts.join('/');
	var start = "", end = "";

	// Build output URL
	relURL.protocol = baseURL.protocol;
	relURL.host = baseURL.host;
	relURL.port = baseURL.port;

	// Re-add trailing slash if it's removed
	if (relURL.path.charAt(relURL.path.length-1) == "/")
		absPath += "/";

	relURL.path = absPath;

	return this.serializeURL(relURL);
};

kampungan_Engine.prototype.convertURL = function(url, node, on_save) {
	var prot = document.location.protocol;
	var host = document.location.hostname;
	var port = document.location.port;

	// Pass through file protocol
	if (prot == "file:")
		return url;

	// Something is wrong, remove weirdness
	url = kampungan.regexpReplace(url, '(http|https):///', '/');

	// Mailto link or anchor (Pass through)
	if (url.indexOf('mailto:') != -1 || url.indexOf('javascript:') != -1 || kampungan.regexpReplace(url,'[ \t\r\n\+]|%20','').charAt(0) == "#")
		return url;

	// Fix relative/Mozilla
	if (!kampungan.isMSIE && !on_save && url.indexOf("://") == -1 && url.charAt(0) != '/')
		return kampungan.settings['base_href'] + url;

	// Handle relative URLs
	if (on_save && kampungan.getParam('relative_urls')) {
		var curl = kampungan.convertRelativeToAbsoluteURL(kampungan.settings['base_href'], url);
		if (curl.charAt(0) == '/')
			curl = kampungan.settings['document_base_prefix'] + curl;

		var urlParts = kampungan.parseURL(curl);
		var tmpUrlParts = kampungan.parseURL(kampungan.settings['document_base_url']);

		// Force relative
		if (urlParts['host'] == tmpUrlParts['host'] && (urlParts['port'] == tmpUrlParts['port']))
			return kampungan.convertAbsoluteURLToRelativeURL(kampungan.settings['document_base_url'], curl);
	}

	// Handle absolute URLs
	if (!kampungan.getParam('relative_urls')) {
		var urlParts = kampungan.parseURL(url);
		var baseUrlParts = kampungan.parseURL(kampungan.settings['base_href']);

		// Force absolute URLs from relative URLs
		url = kampungan.convertRelativeToAbsoluteURL(kampungan.settings['base_href'], url);

		// If anchor and path is the same page
		if (urlParts['anchor'] && urlParts['path'] == baseUrlParts['path'])
			return "#" + urlParts['anchor'];
	}

	// Remove current domain
	if (kampungan.getParam('remove_script_host')) {
		var start = "", portPart = "";

		if (port != "")
			portPart = ":" + port;

		start = prot + "//" + host + portPart + "/";

		if (url.indexOf(start) == 0)
			url = url.substring(start.length-1);
	}

	return url;
};

kampungan_Engine.prototype.convertAllRelativeURLs = function(body) {
	// Convert all image URL:s to absolute URL
	var elms = body.getElementsByTagName("img");
	for (var i=0; i<elms.length; i++) {
		var src = kampungan.getAttrib(elms[i], 'src');

		var msrc = kampungan.getAttrib(elms[i], 'mce_src');
		if (msrc != "")
			src = msrc;

		if (src != "") {
			src = kampungan.convertRelativeToAbsoluteURL(kampungan.settings['base_href'], src);
			elms[i].setAttribute("src", src);
		}
	}

	// Convert all link URL:s to absolute URL
	var elms = body.getElementsByTagName("a");
	for (var i=0; i<elms.length; i++) {
		var href = kampungan.getAttrib(elms[i], 'href');

		var mhref = kampungan.getAttrib(elms[i], 'mce_href');
		if (mhref != "")
			href = mhref;

		if (href && href != "") {
			href = kampungan.convertRelativeToAbsoluteURL(kampungan.settings['base_href'], href);
			elms[i].setAttribute("href", href);
		}
	}
};

/* file:jscripts/kampungan/classes/kampungan_Array.class.js */

kampungan_Engine.prototype.clearArray = function(a) {
	for (var k in a)
		a[k] = null;

	return a;
};

/* file:jscripts/kampungan/classes/kampungan_Event.class.js */

kampungan_Engine.prototype._setEventsEnabled = function(node, state) {
	var events = new Array('onfocus','onblur','onclick','ondblclick',
				'onmousedown','onmouseup','onmouseover','onmousemove',
				'onmouseout','onkeypress','onkeydown','onkeydown','onkeyup');

	var evs = kampungan.settings['event_elements'].split(',');
	for (var y=0; y<evs.length; y++){
		var elms = node.getElementsByTagName(evs[y]);
		for (var i=0; i<elms.length; i++) {
			var event = "";

			for (var x=0; x<events.length; x++) {
				if ((event = kampungan.getAttrib(elms[i], events[x])) != '') {
					event = kampungan.cleanupEventStr("" + event);

					if (!state)
						event = "return true;" + event;
					else
						event = event.replace(/^return true;/gi, '');

					elms[i].removeAttribute(events[x]);
					elms[i].setAttribute(events[x], event);
				}
			}
		}
	}
};

kampungan_Engine.prototype._eventPatch = function(editor_id) {
	var n, inst, win, e;

	// Remove odd, error
	if (typeof(kampungan) == "undefined")
		return true;

	try {
		// Try selected instance first
		if (kampungan.selectedInstance) {
			win = kampungan.selectedInstance.getWin();

			if (win && win.event) {
				e = win.event;

				if (!e.target)
					e.target = e.srcElement;

				kampungan_Engine.prototype.handleEvent(e);
				return;
			}
		}

		// Search for it
		for (n in kampungan.instances) {
			inst = kampungan.instances[n];

			if (!kampungan.isInstance(inst))
				continue;

			kampungan.selectedInstance = inst;
			win = inst.getWin();

			if (win && win.event) {
				e = win.event;

				if (!e.target)
					e.target = e.srcElement;

				kampungan_Engine.prototype.handleEvent(e);
				return;
			}
		}
	} catch (ex) {
		// Ignore error if iframe is pointing to external URL
	}
};

kampungan_Engine.prototype.unloadHandler = function() {
	kampungan.triggerSave(true, true);
};

kampungan_Engine.prototype.addEventHandlers = function(inst) {
	var doc = inst.getDoc();

	inst.switchSettings();

	if (kampungan.isMSIE) {
		kampungan.addEvent(doc, "keypress", kampungan_Engine.prototype._eventPatch);
		kampungan.addEvent(doc, "keyup", kampungan_Engine.prototype._eventPatch);
		kampungan.addEvent(doc, "keydown", kampungan_Engine.prototype._eventPatch);
		kampungan.addEvent(doc, "mouseup", kampungan_Engine.prototype._eventPatch);
		kampungan.addEvent(doc, "mousedown", kampungan_Engine.prototype._eventPatch);
		kampungan.addEvent(doc, "click", kampungan_Engine.prototype._eventPatch);
	} else {
		kampungan.addEvent(doc, "keypress", kampungan.handleEvent);
		kampungan.addEvent(doc, "keydown", kampungan.handleEvent);
		kampungan.addEvent(doc, "keyup", kampungan.handleEvent);
		kampungan.addEvent(doc, "click", kampungan.handleEvent);
		kampungan.addEvent(doc, "mouseup", kampungan.handleEvent);
		kampungan.addEvent(doc, "mousedown", kampungan.handleEvent);
		kampungan.addEvent(doc, "focus", kampungan.handleEvent);
		kampungan.addEvent(doc, "blur", kampungan.handleEvent);

		eval('try { doc.designMode = "On"; } catch(e) {}'); // Force designmode
	}
};

kampungan_Engine.prototype.onMouseMove = function() {
	var inst;

	if (!kampungan.hasMouseMoved) {
		inst = kampungan.selectedInstance;

		// Workaround for bug #1437457 (Odd MSIE bug)
		if (inst.isFocused) {
			inst.undoBookmark = inst.selection.getBookmark();
			kampungan.hasMouseMoved = true;
		}
	}

//	kampungan.cancelEvent(inst.getWin().event);
//	return false;
};

kampungan_Engine.prototype.cancelEvent = function(e) {
	if (kampungan.isMSIE) {
		e.returnValue = false;
		e.cancelBubble = true;
	} else
		e.preventDefault();
};

kampungan_Engine.prototype.addEvent = function(o, n, h) {
	if (o.attachEvent)
		o.attachEvent("on" + n, h);
	else
		o.addEventListener(n, h, false);
};

kampungan_Engine.prototype.addSelectAccessibility = function(e, s, w) {
	// Add event handlers 
	if (!s._isAccessible) {
		s.onkeydown = kampungan.accessibleEventHandler;
		s.onblur = kampungan.accessibleEventHandler;
		s._isAccessible = true;
		s._win = w;
	}

	return false;
};

kampungan_Engine.prototype.accessibleEventHandler = function(e) {
	var win = this._win;
	e = kampungan.isMSIE ? win.event : e;
	var elm = kampungan.isMSIE ? e.srcElement : e.target;

	// Unpiggyback onchange on blur
	if (e.type == "blur") {
		if (elm.oldonchange) {
			elm.onchange = elm.oldonchange;
			elm.oldonchange = null;
		}

		return true;
	}

	// Piggyback onchange
	if (elm.nodeName == "SELECT" && !elm.oldonchange) {
		elm.oldonchange = elm.onchange;
		elm.onchange = null;
	}

	// Execute onchange and remove piggyback
	if (e.keyCode == 13 || e.keyCode == 32) {
		elm.onchange = elm.oldonchange;
		elm.onchange();
		elm.oldonchange = null;

		kampungan.cancelEvent(e);
		return false;
	}

	return true;
};

kampungan_Engine.prototype._resetIframeHeight = function() {
	var ife;

	if (kampungan.isMSIE && !kampungan.isOpera) {
		ife = kampungan.selectedInstance.iframeElement;

/*		if (ife._oldWidth) {
			ife.style.width = ife._oldWidth;
			ife.width = ife._oldWidth;
		}*/

		if (ife._oldHeight) {
			ife.style.height = ife._oldHeight;
			ife.height = ife._oldHeight;
		}
	}
};

/* file:jscripts/kampungan/classes/kampungan_Selection.class.js */

function kampungan_Selection(inst) {
	this.instance = inst;
};

kampungan_Selection.prototype = {
	getSelectedHTML : function() {
		var inst = this.instance;
		var e, r = this.getRng(), h;

		if (kampungan.isSafari) {
			// Not realy perfect!!
			return r.toString();
		}

		e = document.createElement("body");

		if (kampungan.isGecko)
			e.appendChild(r.cloneContents());
		else 
			e.innerHTML = r.item ? r.item(0).outerHTML : r.htmlText;

		h = kampungan._cleanupHTML(inst, inst.contentDocument, inst.settings, e, e, false, true, false);

		// When editing always use fonts internaly
		if (kampungan.getParam("convert_fonts_to_spans"))
			kampungan.convertSpansToFonts(inst.getDoc());

		return h;
	},

	getSelectedText : function() {
		var inst = this.instance;
		var d, r, s, t;

		if (kampungan.isMSIE) {
			d = inst.getDoc();

			if (d.selection.type == "Text") {
				r = d.selection.createRange();
				t = r.text;
			} else
				t = '';
		} else {
			s = this.getSel();

			if (s && s.toString)
				t = s.toString();
			else
				t = '';
		}

		return t;
	},

	getBookmark : function(simple) {
		var rng = this.getRng();
		var doc = this.instance.getDoc();
		var sp, le, s, e, nl, i, si, ei;
		var trng, sx, sy, xx = -999999999;

		// Skip Opera for now
		if (kampungan.isOpera)
			return null;

		sx = doc.body.scrollLeft + doc.documentElement.scrollLeft;
		sy = doc.body.scrollTop + doc.documentElement.scrollTop;

		if (kampungan.isSafari || kampungan.isGecko)
			return {rng : rng, scrollX : sx, scrollY : sy};

		if (kampungan.isMSIE) {
			if (simple)
				return {rng : rng};

			if (rng.item) {
				e = rng.item(0);

				nl = doc.getElementsByTagName(e.nodeName);
				for (i=0; i<nl.length; i++) {
					if (e == nl[i]) {
						sp = i;
						break;
					}
				}

				return {
					tag : e.nodeName,
					index : sp,
					scrollX : sx,
					scrollY : sy
				};
			} else {
				trng = rng.duplicate();
				trng.collapse(true);
				sp = Math.abs(trng.move('character', xx));

				trng = rng.duplicate();
				trng.collapse(false);
				le = Math.abs(trng.move('character', xx)) - sp;

				return {
					start : sp,
					length : le,
					scrollX : sx,
					scrollY : sy
				};
			}
		}

		if (kampungan.isGecko) {
			s = kampungan.getParentElement(rng.startContainer);
			for (si=0; si<s.childNodes.length && s.childNodes[si] != rng.startContainer; si++) ;

			nl = doc.getElementsByTagName(s.nodeName);
			for (i=0; i<nl.length; i++) {
					if (s == nl[i]) {
						sp = i;
						break;
					}
			}

			e = kampungan.getParentElement(rng.endContainer);
			for (ei=0; ei<e.childNodes.length && e.childNodes[ei] != rng.endContainer; ei++) ;

			nl = doc.getElementsByTagName(e.nodeName);
			for (i=0; i<nl.length; i++) {
					if (e == nl[i]) {
						le = i;
						break;
					}
			}

			//kampungan.debug(s.nodeName, sp, rng.startOffset, '-' , e.nodeName, le, rng.endOffset);
			//kampungan.debug(sx, sy);

			return {
				startTag : s.nodeName,
				start : sp,
				startIndex : si,
				endTag : e.nodeName,
				end : le,
				endIndex : ei,
				startOffset : rng.startOffset,
				endOffset : rng.endOffset,
				scrollX : sx,
				scrollY : sy
			};
		}

		return null;
	},

	moveToBookmark : function(bookmark) {
		var rng, nl, i;
		var inst = this.instance;
		var doc = inst.getDoc();
		var win = inst.getWin();
		var sel = this.getSel();

		if (!bookmark)
			return false;

		if (kampungan.isSafari) {
			sel.setBaseAndExtent(bookmark.startContainer, bookmark.startOffset, bookmark.endContainer, bookmark.endOffset);
			return true;
		}

		if (kampungan.isMSIE) {
			if (bookmark.rng) {
				bookmark.rng.select();
				return true;
			}

			win.focus();

			if (bookmark.tag) {
				rng = inst.getBody().createControlRange();

				nl = doc.getElementsByTagName(bookmark.tag);

				if (nl.length > bookmark.index) {
					try {
						rng.addElement(nl[bookmark.index]);
					} catch (ex) {
						// Might be thrown if the node no longer exists
					}
				}
			} else {
				rng = inst.getSel().createRange();
				rng.moveToElementText(inst.getBody());
				rng.collapse(true);
				rng.moveStart('character', bookmark.start);
				rng.moveEnd('character', bookmark.length);
			}

			rng.select();

			win.scrollTo(bookmark.scrollX, bookmark.scrollY);
			return true;
		}

		if (kampungan.isGecko && bookmark.rng) {
			sel.removeAllRanges();
			sel.addRange(bookmark.rng);
			win.scrollTo(bookmark.scrollX, bookmark.scrollY);
			return true;
		}

		if (kampungan.isGecko) {
	//		try {
				rng = doc.createRange();

				nl = doc.getElementsByTagName(bookmark.startTag);
				if (nl.length > bookmark.start)
					rng.setStart(nl[bookmark.start].childNodes[bookmark.startIndex], bookmark.startOffset);

				nl = doc.getElementsByTagName(bookmark.endTag);
				if (nl.length > bookmark.end)
					rng.setEnd(nl[bookmark.end].childNodes[bookmark.endIndex], bookmark.endOffset);

				sel.removeAllRanges();
				sel.addRange(rng);
	/*		} catch {
				// Ignore
			}*/

			win.scrollTo(bookmark.scrollX, bookmark.scrollY);
			return true;
		}

		return false;
	},

	selectNode : function(node, collapse, select_text_node, to_start) {
		var inst = this.instance, sel, rng, nodes;

		if (!node)
			return;

		if (typeof(collapse) == "undefined")
			collapse = true;

		if (typeof(select_text_node) == "undefined")
			select_text_node = false;

		if (typeof(to_start) == "undefined")
			to_start = true;

		if (kampungan.isMSIE) {
			rng = inst.getBody().createTextRange();

			try {
				rng.moveToElementText(node);

				if (collapse)
					rng.collapse(to_start);

				rng.select();
			} catch (e) {
				// Throws illigal agrument in MSIE some times
			}
		} else {
			sel = this.getSel();

			if (!sel)
				return;

			if (kampungan.isSafari) {
				sel.setBaseAndExtent(node, 0, node, node.innerText.length);

				if (collapse) {
					if (to_start)
						sel.collapseToStart();
					else
						sel.collapseToEnd();
				}

				this.scrollToNode(node);

				return;
			}

			rng = inst.getDoc().createRange();

			if (select_text_node) {
				// Find first textnode in tree
				nodes = kampungan.getNodeTree(node, new Array(), 3);
				if (nodes.length > 0)
					rng.selectNodeContents(nodes[0]);
				else
					rng.selectNodeContents(node);
			} else
				rng.selectNode(node);

			if (collapse) {
				// Special treatment of textnode collapse
				if (!to_start && node.nodeType == 3) {
					rng.setStart(node, node.nodeValue.length);
					rng.setEnd(node, node.nodeValue.length);
				} else
					rng.collapse(to_start);
			}

			sel.removeAllRanges();
			sel.addRange(rng);
		}

		this.scrollToNode(node);

		// Set selected element
		kampungan.selectedElement = null;
		if (node.nodeType == 1)
			kampungan.selectedElement = node;
	},

	scrollToNode : function(node) {
		var inst = this.instance;
		var pos, doc, scrollX, scrollY, height;

		// Scroll to node position
		pos = kampungan.getAbsPosition(node);
		doc = inst.getDoc();
		scrollX = doc.body.scrollLeft + doc.documentElement.scrollLeft;
		scrollY = doc.body.scrollTop + doc.documentElement.scrollTop;
		height = kampungan.isMSIE ? document.getElementById(inst.editorId).style.pixelHeight : inst.targetElement.clientHeight;

		// Only scroll if out of visible area
		if (!kampungan.settings['auto_resize'] && !(pos.absTop > scrollY && pos.absTop < (scrollY - 25 + height)))
			inst.contentWindow.scrollTo(pos.absLeft, pos.absTop - height + 25); 
	},

	getSel : function() {
		var inst = this.instance;

		if (kampungan.isMSIE && !kampungan.isOpera)
			return inst.getDoc().selection;

		return inst.contentWindow.getSelection();
	},

	getRng : function() {
		var inst = this.instance;
		var sel = this.getSel();

		if (sel == null)
			return null;

		if (kampungan.isMSIE && !kampungan.isOpera)
			return sel.createRange();

		if (kampungan.isSafari && !sel.getRangeAt)
			return '' + window.getSelection();

		return sel.getRangeAt(0);
	},

	getFocusElement : function() {
		var inst = this.instance;

		if (kampungan.isMSIE && !kampungan.isOpera) {
			var doc = inst.getDoc();
			var rng = doc.selection.createRange();

	//		if (rng.collapse)
	//			rng.collapse(true);

			var elm = rng.item ? rng.item(0) : rng.parentElement();
		} else {
			if (inst.isHidden())
				return inst.getBody();

			var sel = this.getSel();
			var rng = this.getRng();

			if (!sel || !rng)
				return null;

			var elm = rng.commonAncestorContainer;
			//var elm = (sel && sel.anchorNode) ? sel.anchorNode : null;

			// Handle selection a image or other control like element such as anchors
			if (!rng.collapsed) {
				// Is selection small
				if (rng.startContainer == rng.endContainer) {
					if (rng.startOffset - rng.endOffset < 2) {
						if (rng.startContainer.hasChildNodes())
							elm = rng.startContainer.childNodes[rng.startOffset];
					}
				}
			}

			// Get the element parent of the node
			elm = kampungan.getParentElement(elm);

			//if (kampungan.selectedElement != null && kampungan.selectedElement.nodeName.toLowerCase() == "img")
			//	elm = kampungan.selectedElement;
		}

		return elm;
	}
};

/* file:jscripts/kampungan/classes/kampungan_UndoRedo.class.js */

function kampungan_UndoRedo(inst) {
	this.instance = inst;
	this.undoLevels = new Array();
	this.undoIndex = 0;
	this.typingUndoIndex = -1;
	this.undoRedo = true;
};

kampungan_UndoRedo.prototype = {
	add : function(l) {
		var b;

		if (l) {
			this.undoLevels[this.undoLevels.length] = l;
			return true;
		}

		var inst = this.instance;

		if (this.typingUndoIndex != -1) {
			this.undoIndex = this.typingUndoIndex;
			// kampungan.debug("Override: " + this.undoIndex);
		}

		var newHTML = kampungan.trim(inst.getBody().innerHTML);
		if (this.undoLevels[this.undoIndex] && newHTML != this.undoLevels[this.undoIndex].content) {
			//kampungan.debug(newHTML, this.undoLevels[this.undoIndex]);

			kampungan.dispatchCallback(inst, 'onchange_callback', 'onChange', inst);

			// Time to compress
			var customUndoLevels = kampungan.settings['custom_undo_redo_levels'];
			if (customUndoLevels != -1 && this.undoLevels.length > customUndoLevels) {
				for (var i=0; i<this.undoLevels.length-1; i++) {
					//kampungan.debug(this.undoLevels[i] + "=" + this.undoLevels[i+1]);
					this.undoLevels[i] = this.undoLevels[i+1];
				}

				this.undoLevels.length--;
				this.undoIndex--;
			}

			b = inst.undoBookmark;
			if (!b)
				b = inst.selection.getBookmark();

			this.undoIndex++;
			this.undoLevels[this.undoIndex] = {
				content : newHTML,
				bookmark : b
			};

			this.undoLevels.length = this.undoIndex + 1;

			//kampungan.debug("level added" + this.undoIndex);
			return true;

			// kampungan.debug(this.undoIndex + "," + (this.undoLevels.length-1));
		}

		return false;
	},

	undo : function() {
		var inst = this.instance;

		// Do undo
		if (this.undoIndex > 0) {
			this.undoIndex--;
			kampungan.setInnerHTML(inst.getBody(), this.undoLevels[this.undoIndex].content);
			inst.repaint();
			if (inst.settings.custom_undo_redo_restore_selection)
				inst.selection.moveToBookmark(this.undoLevels[this.undoIndex].bookmark);
		}

		// kampungan.debug("Undo - undo levels:" + this.undoLevels.length + ", undo index: " + this.undoIndex);
	},

	redo : function() {
		var inst = this.instance;

		kampungan.execCommand("mceEndTyping");

		if (this.undoIndex < (this.undoLevels.length-1)) {
			this.undoIndex++;
			kampungan.setInnerHTML(inst.getBody(), this.undoLevels[this.undoIndex].content);
			inst.repaint();
//					if (this.undoIndex > 0)
//						inst.selection.moveToBookmark(this.undoLevels[this.undoIndex-1].bookmark);
			if (inst.settings.custom_undo_redo_restore_selection)
				inst.selection.moveToBookmark(this.undoLevels[this.undoIndex].bookmark);
			// kampungan.debug("Redo - undo levels:" + this.undoLevels.length + ", undo index: " + this.undoIndex);
		}

		kampungan.triggerNodeChange();
	}
};

/* file:jscripts/kampungan/classes/kampungan_ForceParagraphs.class.js */

var kampungan_ForceParagraphs = {
	_insertPara : function(inst, e) {
		function isEmpty(para) {
			function isEmptyHTML(html) {
				return html.replace(new RegExp('[ \t\r\n]+', 'g'), '').toLowerCase() == "";
			}

			// Check for images
			if (para.getElementsByTagName("img").length > 0)
				return false;

			// Check for tables
			if (para.getElementsByTagName("table").length > 0)
				return false;

			// Check for HRs
			if (para.getElementsByTagName("hr").length > 0)
				return false;

			// Check all textnodes
			var nodes = kampungan.getNodeTree(para, new Array(), 3);
			for (var i=0; i<nodes.length; i++) {
				if (!isEmptyHTML(nodes[i].nodeValue))
					return false;
			}

			// No images, no tables, no hrs, no text content then it's empty
			return true;
		}

		var doc = inst.getDoc();
		var sel = inst.getSel();
		var win = inst.contentWindow;
		var rng = sel.getRangeAt(0);
		var body = doc.body;
		var rootElm = doc.documentElement;
		var blockName = "P";

	//	kampungan.debug(body.innerHTML);

	//	debug(e.target, sel.anchorNode.nodeName, sel.focusNode.nodeName, rng.startContainer, rng.endContainer, rng.commonAncestorContainer, sel.anchorOffset, sel.focusOffset, rng.toString());

		// Setup before range
		var rngBefore = doc.createRange();
		rngBefore.setStart(sel.anchorNode, sel.anchorOffset);
		rngBefore.collapse(true);

		// Setup after range
		var rngAfter = doc.createRange();
		rngAfter.setStart(sel.focusNode, sel.focusOffset);
		rngAfter.collapse(true);

		// Setup start/end points
		var direct = rngBefore.compareBoundaryPoints(rngBefore.START_TO_END, rngAfter) < 0;
		var startNode = direct ? sel.anchorNode : sel.focusNode;
		var startOffset = direct ? sel.anchorOffset : sel.focusOffset;
		var endNode = direct ? sel.focusNode : sel.anchorNode;
		var endOffset = direct ? sel.focusOffset : sel.anchorOffset;

		startNode = startNode.nodeName == "BODY" ? startNode.firstChild : startNode;
		endNode = endNode.nodeName == "BODY" ? endNode.firstChild : endNode;

		// kampungan.debug(startNode, endNode);

		// Get block elements
		var startBlock = kampungan.getParentBlockElement(startNode);
		var endBlock = kampungan.getParentBlockElement(endNode);

		// If absolute force paragraph generation within
		if (startBlock && new RegExp('absolute|relative|static', 'gi').test(startBlock.style.position))
			startBlock = null;

		if (endBlock && new RegExp('absolute|relative|static', 'gi').test(endBlock.style.position))
			endBlock = null;

		// Use current block name
		if (startBlock != null) {
			blockName = startBlock.nodeName;

			// Use P instead
			if (blockName == "TD" || blockName == "TABLE" || (blockName == "DIV" && new RegExp('left|right', 'gi').test(startBlock.style.cssFloat)))
				blockName = "P";
		}

		// Within a list use normal behaviour
		if (kampungan.getParentElement(startBlock, "OL,UL") != null)
			return false;

		// Within a table create new paragraphs
		if ((startBlock != null && startBlock.nodeName == "TABLE") || (endBlock != null && endBlock.nodeName == "TABLE"))
			startBlock = endBlock = null;

		// Setup new paragraphs
		var paraBefore = (startBlock != null && startBlock.nodeName == blockName) ? startBlock.cloneNode(false) : doc.createElement(blockName);
		var paraAfter = (endBlock != null && endBlock.nodeName == blockName) ? endBlock.cloneNode(false) : doc.createElement(blockName);

		// Is header, then force paragraph under
		if (/^(H[1-6])$/.test(blockName))
			paraAfter = doc.createElement("p");

		// Setup chop nodes
		var startChop = startNode;
		var endChop = endNode;

		// Get startChop node
		node = startChop;
		do {
			if (node == body || node.nodeType == 9 || kampungan.isBlockElement(node))
				break;

			startChop = node;
		} while ((node = node.previousSibling ? node.previousSibling : node.parentNode));

		// Get endChop node
		node = endChop;
		do {
			if (node == body || node.nodeType == 9 || kampungan.isBlockElement(node))
				break;

			endChop = node;
		} while ((node = node.nextSibling ? node.nextSibling : node.parentNode));

		// Fix when only a image is within the TD
		if (startChop.nodeName == "TD")
			startChop = startChop.firstChild;

		if (endChop.nodeName == "TD")
			endChop = endChop.lastChild;

		// If not in a block element
		if (startBlock == null) {
			// Delete selection
			rng.deleteContents();
			sel.removeAllRanges();

			if (startChop != rootElm && endChop != rootElm) {
				// Insert paragraph before
				rngBefore = rng.cloneRange();

				if (startChop == body)
					rngBefore.setStart(startChop, 0);
				else
					rngBefore.setStartBefore(startChop);

				paraBefore.appendChild(rngBefore.cloneContents());

				// Insert paragraph after
				if (endChop.parentNode.nodeName == blockName)
					endChop = endChop.parentNode;

				// If not after image
				//if (rng.startContainer.nodeName != "BODY" && rng.endContainer.nodeName != "BODY")
					rng.setEndAfter(endChop);

				if (endChop.nodeName != "#text" && endChop.nodeName != "BODY")
					rngBefore.setEndAfter(endChop);

				var contents = rng.cloneContents();
				if (contents.firstChild && (contents.firstChild.nodeName == blockName || contents.firstChild.nodeName == "BODY"))
					paraAfter.innerHTML = contents.firstChild.innerHTML;
				else
					paraAfter.appendChild(contents);

				// Check if it's a empty paragraph
				if (isEmpty(paraBefore))
					paraBefore.innerHTML = "&nbsp;";

				// Check if it's a empty paragraph
				if (isEmpty(paraAfter))
					paraAfter.innerHTML = "&nbsp;";

				// Delete old contents
				rng.deleteContents();
				rngAfter.deleteContents();
				rngBefore.deleteContents();

				// Insert new paragraphs
				paraAfter.normalize();
				rngBefore.insertNode(paraAfter);
				paraBefore.normalize();
				rngBefore.insertNode(paraBefore);

				// kampungan.debug("1: ", paraBefore.innerHTML, paraAfter.innerHTML);
			} else {
				body.innerHTML = "<" + blockName + ">&nbsp;</" + blockName + "><" + blockName + ">&nbsp;</" + blockName + ">";
				paraAfter = body.childNodes[1];
			}

			inst.selection.selectNode(paraAfter, true, true);

			return true;
		}

		// Place first part within new paragraph
		if (startChop.nodeName == blockName)
			rngBefore.setStart(startChop, 0);
		else
			rngBefore.setStartBefore(startChop);

		rngBefore.setEnd(startNode, startOffset);
		paraBefore.appendChild(rngBefore.cloneContents());

		// Place secound part within new paragraph
		rngAfter.setEndAfter(endChop);
		rngAfter.setStart(endNode, endOffset);
		var contents = rngAfter.cloneContents();

		if (contents.firstChild && contents.firstChild.nodeName == blockName) {
	/*		var nodes = contents.firstChild.childNodes;
			for (var i=0; i<nodes.length; i++) {
				//kampungan.debug(nodes[i].nodeName);
				if (nodes[i].nodeName != "BODY")
					paraAfter.appendChild(nodes[i]);
			}
	*/
			paraAfter.innerHTML = contents.firstChild.innerHTML;
		} else
			paraAfter.appendChild(contents);

		// Check if it's a empty paragraph
		if (isEmpty(paraBefore))
			paraBefore.innerHTML = "&nbsp;";

		// Check if it's a empty paragraph
		if (isEmpty(paraAfter))
			paraAfter.innerHTML = "&nbsp;";

		// Create a range around everything
		var rng = doc.createRange();

		if (!startChop.previousSibling && startChop.parentNode.nodeName.toUpperCase() == blockName) {
			rng.setStartBefore(startChop.parentNode);
		} else {
			if (rngBefore.startContainer.nodeName.toUpperCase() == blockName && rngBefore.startOffset == 0)
				rng.setStartBefore(rngBefore.startContainer);
			else
				rng.setStart(rngBefore.startContainer, rngBefore.startOffset);
		}

		if (!endChop.nextSibling && endChop.parentNode.nodeName.toUpperCase() == blockName)
			rng.setEndAfter(endChop.parentNode);
		else
			rng.setEnd(rngAfter.endContainer, rngAfter.endOffset);

		// Delete all contents and insert new paragraphs
		rng.deleteContents();
		rng.insertNode(paraAfter);
		rng.insertNode(paraBefore);
		//kampungan.debug("2", paraBefore.innerHTML, paraAfter.innerHTML);

		// Normalize
		paraAfter.normalize();
		paraBefore.normalize();

		inst.selection.selectNode(paraAfter, true, true);

		return true;
	},

	_handleBackSpace : function(inst) {
		var r = inst.getRng(), sn = r.startContainer, nv, s = false;

		if (sn && sn.nextSibling && sn.nextSibling.nodeName == "BR") {
			nv = sn.nodeValue;

			// Handle if a backspace is pressed after a space character #bug 1466054
			if (nv != null && nv.length >= r.startOffset && nv.charAt(r.startOffset - 1) == ' ')
				s = true;

			// Only remove BRs if we are at the end of line #bug 1464152
			if (nv != null && r.startOffset == nv.length)
				sn.nextSibling.parentNode.removeChild(sn.nextSibling);
		}

		return s;
	}
};

/* file:jscripts/kampungan/classes/kampungan_Layer.class.js */

function kampungan_Layer(id, bm) {
	this.id = id;
	this.blockerElement = null;
	this.events = false;
	this.element = null;
	this.blockMode = typeof(bm) != 'undefined' ? bm : true;
	this.doc = document;
};

kampungan_Layer.prototype = {
	moveRelativeTo : function(re, p) {
		var rep = this.getAbsPosition(re);
		var w = parseInt(re.offsetWidth);
		var h = parseInt(re.offsetHeight);
		var e = this.getElement();
		var ew = parseInt(e.offsetWidth);
		var eh = parseInt(e.offsetHeight);
		var x, y;

		switch (p) {
			case "tl":
				x = rep.absLeft;
				y = rep.absTop;
				break;

			case "tr":
				x = rep.absLeft + w;
				y = rep.absTop;
				break;

			case "bl":
				x = rep.absLeft;
				y = rep.absTop + h;
				break;

			case "br":
				x = rep.absLeft + w;
				y = rep.absTop + h;
				break;

			case "cc":
				x = rep.absLeft + (w / 2) - (ew / 2);
				y = rep.absTop + (h / 2) - (eh / 2);
				break;
		}

		this.moveTo(x, y);
	},

	moveBy : function(x, y) {
		var e = this.getElement();
		this.moveTo(parseInt(e.style.left) + x, parseInt(e.style.top) + y);
	},

	moveTo : function(x, y) {
		var e = this.getElement();

		e.style.left = x + "px";
		e.style.top = y + "px";

		this.updateBlocker();
	},

	resizeBy : function(w, h) {
		var e = this.getElement();
		this.resizeTo(parseInt(e.style.width) + w, parseInt(e.style.height) + h);
	},

	resizeTo : function(w, h) {
		var e = this.getElement();

		if (w != null)
			e.style.width = w + "px";

		if (h != null)
			e.style.height = h + "px";

		this.updateBlocker();
	},

	show : function() {
		this.getElement().style.display = 'block';
		this.updateBlocker();
	},

	hide : function() {
		this.getElement().style.display = 'none';
		this.updateBlocker();
	},

	isVisible : function() {
		return this.getElement().style.display == 'block';
	},

	getElement : function() {
		if (!this.element)
			this.element = this.doc.getElementById(this.id);

		return this.element;
	},

	setBlockMode : function(s) {
		this.blockMode = s;
	},

	updateBlocker : function() {
		var e, b, x, y, w, h;

		b = this.getBlocker();
		if (b) {
			if (this.blockMode) {
				e = this.getElement();
				x = this.parseInt(e.style.left);
				y = this.parseInt(e.style.top);
				w = this.parseInt(e.offsetWidth);
				h = this.parseInt(e.offsetHeight);

				b.style.left = x + 'px';
				b.style.top = y + 'px';
				b.style.width = w + 'px';
				b.style.height = h + 'px';
				b.style.display = e.style.display;
			} else
				b.style.display = 'none';
		}
	},

	getBlocker : function() {
		var d, b;

		if (!this.blockerElement && this.blockMode) {
			d = this.doc;
			b = d.createElement("iframe");

			b.style.cssText = 'display: none; position: absolute; left: 0; top: 0';
			b.src = 'javascript:false;';
			b.frameBorder = '0';
			b.scrolling = 'no';

			d.body.appendChild(b);
			this.blockerElement = b;
		}

		return this.blockerElement;
	},

	getAbsPosition : function(n) {
		var p = {absLeft : 0, absTop : 0};

		while (n) {
			p.absLeft += n.offsetLeft;
			p.absTop += n.offsetTop;
			n = n.offsetParent;
		}

		return p;
	},

	create : function(n, c, p) {
		var d = this.doc, e = d.createElement(n);

		e.setAttribute('id', this.id);

		if (c)
			e.className = c;

		if (!p)
			p = d.body;

		p.appendChild(e);

		return this.element = e;
	},

	parseInt : function(s) {
		if (s == null || s == '')
			return 0;

		return parseInt(s);
	}
};

/* file:jscripts/kampungan/classes/kampungan_Menu.class.js */

function kampungan_Menu() {
	var id;

	if (typeof(kampungan.menuCounter) == "undefined")
		kampungan.menuCounter = 0;

	id = "mc_menu_" + kampungan.menuCounter++;

	kampungan_Layer.call(this, id, true);

	this.id = id;
	this.items = new Array();
	this.needsUpdate = true;
};

// Extends the kampungan_Layer class
kampungan_Menu.prototype = kampungan.extend(kampungan_Layer.prototype, {
	init : function(s) {
		var n;

		// Default params
		this.settings = {
			separator_class : 'mceMenuSeparator',
			title_class : 'mceMenuTitle',
			disabled_class : 'mceMenuDisabled',
			menu_class : 'mceMenu',
			drop_menu : true
		};

		for (n in s)
			this.settings[n] = s[n];

		this.create('div', this.settings.menu_class);
	},

	clear : function() {
		this.items = new Array();
	},

	addTitle : function(t) {
		this.add({type : 'title', text : t});
	},

	addDisabled : function(t) {
		this.add({type : 'disabled', text : t});
	},

	addSeparator : function() {
		this.add({type : 'separator'});
	},

	addItem : function(t, js) {
		this.add({text : t, js : js});
	},

	add : function(mi) {
		this.items[this.items.length] = mi;
		this.needsUpdate = true;
	},

	update : function() {
		var e = this.getElement(), h = '', i, t, m = this.items, s = this.settings;

		if (this.settings.drop_menu)
			h += '<span class="mceMenuLine"></span>';

		h += '<table border="0" cellpadding="0" cellspacing="0">';

		for (i=0; i<m.length; i++) {
			t = kampungan.xmlEncode(m[i].text);
			c = m[i].class_name ? ' class="' + m[i].class_name + '"' : '';

			switch (m[i].type) {
				case 'separator':
					h += '<tr class="' + s.separator_class + '"><td>';
					break;

				case 'title':
					h += '<tr class="' + s.title_class + '"><td><span' + c +'>' + t + '</span>';
					break;

				case 'disabled':
					h += '<tr class="' + s.disabled_class + '"><td><span' + c +'>' + t + '</span>';
					break;

				default:
					h += '<tr><td><a href="javascript:void(0);" onmousedown="' + kampungan.xmlEncode(m[i].js) + ';return false;"><span' + c +'>' + t + '</span></a>';
			}

			h += '</td></tr>';
		}

		h += '</table>';

		e.innerHTML = h;

		this.needsUpdate = false;
		this.updateBlocker();
	},

	show : function() {
		var nl, i;

		if (kampungan.lastMenu == this)
			return;

		if (this.needsUpdate)
			this.update();

		if (kampungan.lastMenu && kampungan.lastMenu != this)
			kampungan.lastMenu.hide();

		kampungan_Layer.prototype.show.call(this);

		if (!kampungan.isOpera) {
			// Accessibility stuff
/*			nl = this.getElement().getElementsByTagName("a");
			if (nl.length > 0)
				nl[0].focus();*/
		}

		kampungan.lastMenu = this;
	}
});

/* file:jscripts/kampungan/classes/kampungan_Debug.class.js */

kampungan_Engine.prototype.debug = function() {
	var m = "", e, a, i;

	e = document.getElementById("kampungan_debug");
	if (!e) {
		var d = document.createElement("div");
		d.setAttribute("className", "debugger");
		d.className = "debugger";
		d.innerHTML = 'Debug output:<textarea id="kampungan_debug" style="width: 100%; height: 300px" wrap="nowrap" mce_editable="false"></textarea>';

		document.body.appendChild(d);
		e = document.getElementById("kampungan_debug");
	}

	a = this.debug.arguments;
	for (i=0; i<a.length; i++) {
		m += a[i];
		if (i<a.length-1)
			m += ', ';
	}

	e.value += m + "\n";
};
