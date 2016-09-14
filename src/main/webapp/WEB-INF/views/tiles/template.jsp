<%-- 
    Document   : template
    Created on : Sep 14, 2016, 10:20:42 AM
    Author     : Hp
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <tiles:insertAttribute name="title" ignore="true"></tiles:insertattribute>
        </title>
    </head>
    <body>
        <div>
            <tiles:insertAttribute name="header" ignore="true"></tiles:insertattribute>
        </div>
         <div>
            <tiles:insertAttribute name="sideMenu" ignore="true"></tiles:insertattribute>
        </div>
         <div>
            <tiles:insertAttribute name="body" ignore="true"></tiles:insertattribute>
        </div>
         <div>
            <tiles:insertAttribute name="footer" ignore="true"></tiles:insertattribute>
        </div>
    </body>
</html>
