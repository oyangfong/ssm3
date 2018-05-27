/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.shiftEnterMode = CKEDITOR.ENTER_P; 
	/*config.enterMode = CKEDITOR.ENTER_BR;*/
	
};

CKEDITOR.on('instanceReady', function (ev) {

    var writer = ev.editor.dataProcessor.writer;        

    writer.indentationChars = '  '; 

    var dtd = CKEDITOR.dtd; 

    for (var e in CKEDITOR.tools.extend({}, dtd.$block, dtd.$listItem, dtd.$tableContent)) {

        ev.editor.dataProcessor.writer.setRules(e, {    

        indent: false,

        breakBeforeOpen: false,     

        breakAfterOpen: false,  

        breakBeforeClose: false,

        breakAfterClose: false

        });

    } 

    for (var e in CKEDITOR.tools.extend({}, dtd.$list, dtd.$listItem, dtd.$tableContent)) {

        ev.editor.dataProcessor.writer.setRules(e, {

        indent: true,

        });

    }

});