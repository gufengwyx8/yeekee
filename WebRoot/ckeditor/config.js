/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function(config) {
	// Define changes to default configuration here. For example:
	config.language = 'zh-cn';
	config.toolbar = 'Full';
	config.toolbar_Full = [
			[ 'Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript',
					'Superscript' ],
			[ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent',
					'Blockquote' ],
			[ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ],
			[ 'Link', 'Unlink', 'Anchor' ],
			[ 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak' ],
			[ 'Font', 'FontSize' ], [ 'TextColor', 'BGColor','Image' ] ];
	config.resize_enabled = false;
	config.contentsCss='ckeditor/contents.css';
	// config.uiColor = '#AADC6E';
};

//CKEDITOR.replace('content', addUploadButton(this));
addUploadButton(document.getElementById("content"));
function addUploadButton(editor){
CKEDITOR.on('dialogDefinition', function( ev ){
    var dialogName = ev.data.name;
    var dialogDefinition = ev.data.definition;
    if ( dialogName == 'image' ){
        var infoTab = dialogDefinition.getContents( 'info' );
        infoTab.add({
            type : 'button',
            id : 'upload_image',
            align : 'center',
            label : '上传',
            onClick : function( evt ){
                var thisDialog = this.getDialog();
                var txtUrlObj = thisDialog.getContentElement('info', 'txtUrl');
                var txtUrlId = txtUrlObj.getInputElement().$.id;
                addUploadImage(txtUrlId);
            }
        }, 'browse'); //place front of the browser button
    }
});
}

function addUploadImage(theURLElementId){
var uploadUrl = "/yeekee/home/uploadImage";    //这是我自己的处理文件/图片上传的页面URL
var imgUrl = window.showModalDialog(uploadUrl);
//在upload结束后通过js代码window.returnValue=...可以将图片url返回给imgUrl变量。
//更多window.showModalDialog的使用方法参考
var urlObj = document.getElementById(theURLElementId);
urlObj.value = imgUrl;
urlObj.fireEvent("onchange"); //触发url文本框的onchange事件，以便预览图片
}
