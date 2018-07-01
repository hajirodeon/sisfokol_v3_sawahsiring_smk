/**
 * $RCSfile: editor_plugin_src.js,v $
 * $Revision: 1.10 $
 * $Date: 2006/04/07 15:52:50 $
 *
 * @author Moxiecode
 * @copyright Copyright © 2004-2006, Moxiecode Systems AB, All rights reserved.
 */

var kampungan_ZoomPlugin = {
	getInfo : function() {
		return {
			longname : 'Zoom',
			author : 'Moxiecode Systems',
			authorurl : 'http://kampungan.moxiecode.com',
			infourl : 'http://kampungan.moxiecode.com/kampungan/docs/plugin_zoom.html',
			version : kampungan.majorVersion + "." + kampungan.minorVersion
		};
	},

	/**
	 * Returns the HTML contents of the zoom control.
	 */
	getControlHTML : function(control_name) {
		if (!kampungan.isMSIE || kampungan.isMSIE5_0 || kampungan.isOpera)
			return "";

		switch (control_name) {
			case "zoom":
				return '<select id="{$editor_id}_zoomSelect" name="{$editor_id}_zoomSelect" onfocus="kampungan.addSelectAccessibility(event, this, window);" onchange="kampungan.execInstanceCommand(\'{$editor_id}\',\'mceZoom\',false,this.options[this.selectedIndex].value);" class="mceSelectList">' + 
						'<option value="100%">+ 100%</option>' + 
						'<option value="150%">+ 150%</option>' + 
						'<option value="200%">+ 200%</option>' + 
						'<option value="250%">+ 250%</option>' + 
						'</select>';
		}

		return "";
	},

	/**
	 * Executes the mceZoom command.
	 */
	execCommand : function(editor_id, element, command, user_interface, value) {
		// Handle commands
		switch (command) {
			case "mceZoom":
				kampungan.getInstanceById(editor_id).contentDocument.body.style.zoom = value;
				kampungan.getInstanceById(editor_id).contentDocument.body.style.mozZoom = value;
				return true;
		}

		// Pass to next handler in chain
		return false;
	}
};

kampungan.addPlugin("zoom", kampungan_ZoomPlugin);
