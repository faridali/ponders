CKEDITOR.config.toolbar = [
   '/',
   ['Bold','Italic','Underline','StrikeThrough','-','NumberedList','BulletedList'],
   '/',
] ;

CKEDITOR.on( 'dialogDefinition', function( ev )
   {
      // Take the dialog name and its definition from the event data.
      var dialogName = ev.data.name;
      var dialogDefinition = ev.data.definition;

      // Check if the definition is from the dialog we're
      // interested in (the 'link' dialog).
      if ( dialogName == 'link' )
      {
         // Remove the 'Target' and 'Advanced' tabs from the 'Link' dialog.
         dialogDefinition.removeContents( 'target' );
         dialogDefinition.removeContents( 'advanced' );
         dialogDefinition.removeContents( 'upload' );
         // Get a reference to the 'Link Info' tab.
         var infoTab = dialogDefinition.getContents( 'info' );

         // Remove unnecessary widgets from the 'Link Info' tab.       
         infoTab.remove( 'linkType');
         infoTab.remove( 'protocol');
         infoTab.remove( 'browse');
      }
   });

// CKEDITOR.editorConfig = function( config )
// {
//     config.removePlugins = 'elementspath';
//     config.enterMode = CKEDITOR.ENTER_BR; // inserts <br />
// }

