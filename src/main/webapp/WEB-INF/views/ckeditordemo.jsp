<%-- 
    Document   : ckeditordemo
    Created on : 20 Nov, 2016, 10:00:11 PM
    Author     : neha
--%>

<%@page import="com.mindfire.controller.ConfigurationHelper"%>
<%@page import="com.ckeditor.CKEditorConfig"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     
        <form action="sample_posteddata.jsp" method="get">
			<p>
				<label for="editor1">Editor 1:</label>
				<textarea cols="80" id="editor1" name="editor1" rows="10"></textarea>
			</p>
			<p>
				<input type="submit" value="Submit" />
			</p>
		</form>
     
     
<ckeditor:replace replace="editor1" basePath="/ckeditor/" />
<ckeditor:replace replace="editor1" basePath="ckeditor/"
   config="<%= ConfigurationHelper.createConfig() %>"
   events="<%= ConfigurationHelper.createEventHandlers() %>" />
    </body>
</html>
