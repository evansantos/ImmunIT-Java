<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<%    
    String loginPerfil = (String) session.getAttribute("login");
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br" xml:lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text-html; charset=ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><bean:message key="welcome.title"/></title>
        
         <!-- Bootstrap -->
         <link href="css/bootstrap.min.css" rel="stylesheet">
         <link href="css/style.css" rel="stylesheet" >

         <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
         <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
         <!--[if lt IE 9]>
           <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
           <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
         <![endif]--> 

        <html:base />
    </head>
    <body>
        
        <% if(loginPerfil != null){%>
            <%@include file="_menu.jsp" %>
            <% if(loginPerfil.equals("Admin")){%>
                <%@include file="_sidebar.jsp" %>
            <%}else{%>
                <%@include file="_sidebarPerfil.jsp" %>
            <%}%>
        <%}else{%>
            <%@include file="../index.jsp" %>
        <%}%>
        
        