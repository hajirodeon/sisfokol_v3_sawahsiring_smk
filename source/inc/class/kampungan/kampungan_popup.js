

// Some global instances, this will be filled later
var kampungan = null, kampunganLang = null;


function kampungan_Popup() {
};


kampungan_Popup.prototype.init = function() {
	var win = window.opener ? window.opener : window.dialogArguments;
	var inst;

	if (!win) {
		// Try parent
		win = parent.parent;

		// Try top
		if (typeof(win.kampungan) == "undefined")
			win = top;
	}

	window.opener = win;
	this.windowOpener = win;
	this.onLoadEval = "";

	// Setup parent references
	kampungan = win.kampungan;
	kampunganLang = win.kampunganLang;

	if (!kampungan) {
		alert("kampungan object reference not found from popup.");
		return;
	}

	inst = kampungan.selectedInstance;
	this.isWindow = kampungan.getWindowArg('mce_inside_iframe', false) == false;
	this.storeSelection = (kampungan.isMSIE && !kampungan.isOpera) && !this.isWindow && kampungan.getWindowArg('mce_store_selection', true);

	if (this.isWindow)
		window.focus();

	// Store selection
	if (this.storeSelection)
		inst.selectionBookmark = inst.selection.getBookmark(true);

	// Setup dir
	if (kampunganLang['lang_dir'])
		document.dir = kampunganLang['lang_dir'];

	// Setup title
	var re = new RegExp('{|\\\$|}', 'g');
	var title = document.title.replace(re, "");
	if (typeof kampunganLang[title] != "undefined") {
		var divElm = document.createElement("div");
		divElm.innerHTML = kampunganLang[title];
		document.title = divElm.innerHTML;

		if (kampungan.setWindowTitle != null)
			kampungan.setWindowTitle(window, divElm.innerHTML);
	}

	// Output Popup CSS class
	document.write('<link href="' + kampungan.getParam("popups_css") + '" rel="stylesheet" type="text/css">');

	kampungan.addEvent(window, "load", this.onLoad);
};


kampungan_Popup.prototype.onLoad = function() {
	var dir, i, elms, body = document.body;

	if (kampungan.getWindowArg('mce_replacevariables', true))
		body.innerHTML = kampungan.applyTemplate(body.innerHTML, kampungan.windowArgs);

	dir = kampungan.selectedInstance.settings['directionality'];
	if (dir == "rtl" && document.forms && document.forms.length > 0) {
		elms = document.forms[0].elements;
		for (i=0; i<elms.length; i++) {
			if ((elms[i].type == "text" || elms[i].type == "textarea") && elms[i].getAttribute("dir") != "ltr")
				elms[i].dir = dir;
		}
	}

	if (body.style.display == 'none')
		body.style.display = 'block';

	// Execute real onload (Opera fix)
	if (kampunganPopup.onLoadEval != "")
		eval(kampunganPopup.onLoadEval);
};


kampungan_Popup.prototype.executeOnLoad = function(str) {
	if (kampungan.isOpera)
		this.onLoadEval = str;
	else
		eval(str);
};


kampungan_Popup.prototype.resizeToInnerSize = function() {
	// Netscape 7.1 workaround
	if (this.isWindow && kampungan.isNS71) {
		window.resizeBy(0, 10);
		return;
	}

	if (this.isWindow) {
		var doc = document;
		var body = doc.body;
		var oldMargin, wrapper, iframe, nodes, dx, dy;

		if (body.style.display == 'none')
			body.style.display = 'block';

		// Remove margin
		oldMargin = body.style.margin;
		body.style.margin = '0';

		// Create wrapper
		wrapper = doc.createElement("div");
		wrapper.id = 'mcBodyWrapper';
		wrapper.style.display = 'none';
		wrapper.style.margin = '0';

		// Wrap body elements
		nodes = doc.body.childNodes;
		for (var i=nodes.length-1; i>=0; i--) {
			if (wrapper.hasChildNodes())
				wrapper.insertBefore(nodes[i].cloneNode(true), wrapper.firstChild);
			else
				wrapper.appendChild(nodes[i].cloneNode(true));

			nodes[i].parentNode.removeChild(nodes[i]);
		}

		// Add wrapper
		doc.body.appendChild(wrapper);

		// Create iframe
		iframe = document.createElement("iframe");
		iframe.id = "mcWinIframe";
		iframe.src = document.location.href.toLowerCase().indexOf('https') == -1 ? "about:blank" : kampungan.settings['default_document'];
		iframe.width = "100%";
		iframe.height = "100%";
		iframe.style.margin = '0';

		// Add iframe
		doc.body.appendChild(iframe);

		// Measure iframe
		iframe = document.getElementById('mcWinIframe');
		dx = kampungan.getWindowArg('mce_width') - iframe.clientWidth;
		dy = kampungan.getWindowArg('mce_height') - iframe.clientHeight;

		// Resize window
		// kampungan.debug(kampungan.getWindowArg('mce_width') + "," + kampungan.getWindowArg('mce_height') + " - " + dx + "," + dy);
		window.resizeBy(dx, dy);

		// Hide iframe and show wrapper
		body.style.margin = oldMargin;
		iframe.style.display = 'none';
		wrapper.style.display = 'block';
	}
};


kampungan_Popup.prototype.resizeToContent = function() {
	var isMSIE = (navigator.appName == "Microsoft Internet Explorer");
	var isOpera = (navigator.userAgent.indexOf("Opera") != -1);

	if (isOpera)
		return;

	if (isMSIE) {
		try { window.resizeTo(10, 10); } catch (e) {}

		var elm = document.body;
		var width = elm.offsetWidth;
		var height = elm.offsetHeight;
		var dx = (elm.scrollWidth - width) + 4;
		var dy = elm.scrollHeight - height;

		try { window.resizeBy(dx, dy); } catch (e) {}
	} else {
		window.scrollBy(1000, 1000);
		if (window.scrollX > 0 || window.scrollY > 0) {
			window.resizeBy(window.innerWidth * 2, window.innerHeight * 2);
			window.sizeToContent();
			window.scrollTo(0, 0);
			var x = parseInt(screen.width / 2.0) - (window.outerWidth / 2.0);
			var y = parseInt(screen.height / 2.0) - (window.outerHeight / 2.0);
			window.moveTo(x, y);
		}
	}
};


kampungan_Popup.prototype.getWindowArg = function(name, default_value) {
	return kampungan.getWindowArg(name, default_value);
};


kampungan_Popup.prototype.restoreSelection = function() {
	if (this.storeSelection) {
		var inst = kampungan.selectedInstance;

		inst.getWin().focus();

		if (inst.selectionBookmark)
			inst.selection.moveToBookmark(inst.selectionBookmark);
	}
};


kampungan_Popup.prototype.execCommand = function(command, user_interface, value) {
	var inst = kampungan.selectedInstance;

	this.restoreSelection();
	inst.execCommand(command, user_interface, value);

	// Store selection
	if (this.storeSelection)
		inst.selectionBookmark = inst.selection.getBookmark(true);
};


kampungan_Popup.prototype.close = function() {
	kampungan.closeWindow(window);
};


kampungan_Popup.prototype.pickColor = function(e, element_id) {
	kampungan.selectedInstance.execCommand('mceColorPicker', true, {
		element_id : element_id,
		document : document,
		window : window,
		store_selection : false
	});
};


kampungan_Popup.prototype.openBrowser = function(element_id, type, option) {
	var cb = kampungan.getParam(option, kampungan.getParam("file_browser_callback"));
	var url = document.getElementById(element_id).value;

	kampungan.setWindowArg("window", window);
	kampungan.setWindowArg("document", document);

	// Call to external callback
	if (eval('typeof(kampunganPopup.windowOpener.' + cb + ')') == "undefined")
		alert("Callback function: " + cb + " could not be found.");
	else
		eval("kampunganPopup.windowOpener." + cb + "(element_id, url, type, window);");
};


kampungan_Popup.prototype.importClass = function(c) {
	window[c] = function() {};

	for (var n in window.opener[c].prototype)
		window[c].prototype[n] = window.opener[c].prototype[n];

	window[c].constructor = window.opener[c].constructor;
};

// Setup global instance
var kampunganPopup = new kampungan_Popup();

kampunganPopup.init();
