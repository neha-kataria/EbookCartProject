<%-- 
    Document   : editorDemoPage
    Created on : 21 Nov, 2016, 12:45:49 PM
    Author     : neha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="resources/ckeditor/ckeditor.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
         <form>
            <textarea name="editor1" id="editor1" rows="10" cols="80">
                This is my textarea to be replaced with CKEditor.
            </textarea>
            <script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'editor1' );
            </script>
        </form>
    </body>
</html>
