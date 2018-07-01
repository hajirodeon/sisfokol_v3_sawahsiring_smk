/**
 * $RCSfile: editor_plugin_src.js,v $
 * $Revision: 1.2 $
 * $Date: 2006/05/03 14:12:12 $
 *
 * @author Moxiecode
 * @copyright Copyright © 2004-2006, Moxiecode Systems AB, All rights reserved.
 */

/* Import plugin specific language pack */
kampungan.importPluginLanguagePack('layer', 'en');

var kampungan_LayerPlugin = {
	getInfo : function() {
		return {
			longname : 'Layer',
			author : 'Moxiecode Systems',
			authorurl : 'http://kampungan.moxiecode.com',
			infourl : 'http://kampungan.moxiecode.com/kampungan/docs/plugin_layer.html',
			version : kampungan.majorVersion + "." + kampungan.minorVersion
		};
	},

	initInstance : function(inst) {
		if (kampungan.isMSIE && !kampungan.isOpera)
			inst.getDoc().execCommand('2D-Position');
	},

	handleEvent : function(e) {
		var inst = kampungan.selectedInstance, self = kampungan_LayerPlugin;
		var w = inst.getWin(), le = inst._lastStyleElm, e;

		if (kampungan.isGecko) {
			e = self._getParentLayer(inst.getFocusElement());

			if (e) {
				if (!inst._lastStyleElm) {
					e.style.overflow = 'auto';
					inst._lastStyleElm = e;
				}
			} else if (le) {
				le = inst._lastStyleElm;
				le.style.width = le.scrollWidth + 'px';
				le.style.height = le.scrollHeight + 'px';
				le.style.overflow = '';
				inst._lastStyleElm = null;
			}
		}

		return true;
	},

	handleVisualAid : function(el, deep, state, inst) {
		var nl = inst.getDoc().getElementsByTagName("div"), i;

		for (i=0; i<nl.length; i++) {
			if (new RegExp('absolute|relative|static', 'gi').test(nl[i].style.position)) {
				if (state)
					kampungan.addCSSClass(nl[i], 'mceVisualAid');
				else
					kampungan.removeCSSClass(nl[i], 'mceVisualAid');					
			}
		}
	},

	getControlHTML : function(cn) {
		switch (cn) {
			case "moveforward":
				return kampungan.getButtonHTML(cn, 'lang_layer_forward_desc', '{$pluginurl}/images/forward.gif', 'mceMoveForward', true);

			case "movebackward":
				return kampungan.getButtonHTML(cn, 'lang_layer_backward_desc', '{$pluginurl}/images/backward.gif', 'mceMoveBackward', true);

			case "absolute":
				return kampungan.getButtonHTML(cn, 'lang_layer_absolute_desc', '{$pluginurl}/images/absolute.gif', 'mceMakeAbsolute', true);

			case "insertlayer":
				return kampungan.getButtonHTML(cn, 'lang_layer_insertlayer_desc', '{$pluginurl}/images/insert_layer.gif', 'mceInsertLayer', true);
		}

		return "";
	},

	execCommand : function(editor_id, element, command, user_interface, value) {
		var self = kampungan_LayerPlugin;

		// Handle commands
		switch (command) {
			case "mceInsertLayer":
				self._insertLayer();
				return true;

			case "mceMoveForward":
				self._move(1);
				return true;

			case "mceMoveBackward":
				self._move(-1);
				return true;

			case "mceMakeAbsolute":
				self._toggleAbsolute();
				return true;
		}

		// Pass to next handler in chain
		return false;
	},

	handleNodeChange : function(editor_id, node, undo_index, undo_levels, visual_aid, any_selection) {
		var inst = kampungan.getInstanceById(editor_id), self = kampungan_LayerPlugin;
		var le = self._getParentLayer(inst.getFocusElement());
		var p = kampungan.getParentElement(inst.getFocusElement(), 'div,p,img');

		kampungan.switchClass(editor_id + '_absolute', 'mceButtonDisabled');
		kampungan.switchClass(editor_id + '_moveforward', 'mceButtonDisabled');
		kampungan.switchClass(editor_id + '_movebackward', 'mceButtonDisabled');

		if (p)
			kampungan.switchClass(editor_id + '_absolute', 'mceButtonNormal');

		if (le && le.style.position.toLowerCase() == "absolute") {
			kampungan.switchClass(editor_id + '_absolute', 'mceButtonSelected');
			kampungan.switchClass(editor_id + '_moveforward', 'mceButtonNormal');
			kampungan.switchClass(editor_id + '_movebackward', 'mceButtonNormal');
		}
	},

	// Private plugin specific methods

	_move : function(d) {
		var inst = kampungan.selectedInstance, self = kampungan_LayerPlugin, i, z = new Array();
		var le = self._getParentLayer(inst.getFocusElement()), ci = -1, fi = -1;
		var nl = kampungan.selectNodes(inst.getBody(), function(n) {
			return n.nodeType == 1 && new RegExp('absolute|relative|static', 'gi').test(n.style.position);
		});

		// Find z-indexes
		for (i=0; i<nl.length; i++) {
			z[i] = nl[i].style.zIndex ? parseInt(nl[i].style.zIndex) : 0;

			if (ci < 0 && nl[i] == le)
				ci = i;
		}

		if (d < 0) {
			// Move back

			// Try find a lower one
			for (i=0; i<z.length; i++) {
				if (z[i] < z[ci]) {
					fi = i;
					break;
				}
			}

			if (fi > -1) {
				nl[ci].style.zIndex = z[fi];
				nl[fi].style.zIndex = z[ci];
			} else {
				if (z[ci] > 0)
					nl[ci].style.zIndex = z[ci] - 1;
			}
		} else {
			// Move forward

			// Try find a higher one
			for (i=0; i<z.length; i++) {
				if (z[i] > z[ci]) {
					fi = i;
					break;
				}
			}

			if (fi > -1) {
				nl[ci].style.zIndex = z[fi];
				nl[fi].style.zIndex = z[ci];
			} else
				nl[ci].style.zIndex = z[ci] + 1;
		}

		inst.repaint();
	},

	_getParentLayer : function(n) {
		return kampungan.getParentNode(n, function(n) {
			return n.nodeType == 1 && new RegExp('absolute|relative|static', 'gi').test(n.style.position);
		});
	},

	_insertLayer : function() {
		var inst = kampungan.selectedInstance;
		var e = kampungan.getParentElement(inst.getFocusElement());
		var p = kampungan.getAbsPosition(e);
		var d = inst.getDoc();
		var ne = d.createElement('div');
		var h = inst.selection.getSelectedHTML();

		// Move div
		ne.style.position = 'absolute';
		ne.style.left = p.absLeft + 'px';
		ne.style.top = (p.absTop > 20 ? p.absTop : 20) + 'px';
		ne.style.width = '100px';
		ne.style.height = '100px';
		ne.className = 'mceVisualAid';

		if (!h)
			h = kampungan.getLang('lang_layer_content');

		ne.innerHTML = h;

		// Add it
		d.body.appendChild(ne);
	},

	_toggleAbsolute : function() {
		var inst = kampungan.selectedInstance, self = kampungan_LayerPlugin;
		var le = self._getParentLayer(inst.getFocusElement());

		if (le == null)
			le = kampungan.getParentElement(inst.getFocusElement(), 'div,p,img');

		if (le) {
			if (le.style.position.toLowerCase() == "absolute") {
				le.style.position = "";
				le.style.left = "";
				le.style.top = "";
			} else {
				le.style.position = "absolute";

				if (le.style.left == "")
					le.style.left = 20 + 'px';

				if (le.style.top == "")
					le.style.top = 20 + 'px';

				if (le.style.width == "")
					le.style.width = le.width ? (le.width + 'px') : '100px';

				if (le.style.height == "")
					le.style.height = le.height ? (le.height + 'px') : '100px';

				kampungan.handleVisualAid(inst.getBody(), true, inst.visualAid, inst);
			}

			inst.repaint();
			kampungan.triggerNodeChange();
		}
	}
};

kampungan.addPlugin("layer", kampungan_LayerPlugin);
