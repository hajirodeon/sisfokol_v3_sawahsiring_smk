function init() {
	kampunganPopup.resizeToInnerSize();
}

function insertEmotion(file_name, title) {
	title = kampungan.getLang(title);

	if (title == null)
		title = "";

	// XML encode
	title = title.replace(/&/g, '&amp;');
	title = title.replace(/\"/g, '&quot;');
	title = title.replace(/</g, '&lt;');
	title = title.replace(/>/g, '&gt;');

	var html = '<img src="' + kampungan.baseURL + "/plugins/emotions/images/" + file_name + '" mce_src="' + kampungan.baseURL + "/plugins/emotions/images/" + file_name + '" border="0" alt="' + title + '" title="' + title + '" />';

	kampungan.execCommand('mceInsertContent', false, html);
	kampunganPopup.close();
}
