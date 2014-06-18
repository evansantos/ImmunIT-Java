<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%    
    String loginMenu = (String) session.getAttribute("login");
%>

<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br" xml:lang="pt-br">
    
<head>
    <meta http-equiv="Content-Type" content="text-html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" >

    <title><bean:message key="welcome.title"/></title>
    <html:base />
</head>

<body>
    
    <% if(loginMenu != null){%>

        <%@include file="_menu.jsp" %>

        <% if(loginMenu.equals("Admin")){%>
            <%@include file="_sidebar.jsp" %>
        <%}else{%>
            <%@include file="_sidebarPerfil.jsp" %>
        <%}%>

    <%}else{%>
        <%@include file="../index.jsp" %>
    <%}%> 