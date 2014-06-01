<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

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
        <div class="container">
            <div class="row">
                <div class="col-sm-10">
                    <span style="font-size:28px;"><strong>Relatório de controle de vacinas</strong></span>
                </div>
                <div class="col-sm-2">
                    <span style="font-size:14px;"><strong>Data</strong></span>  <br/>
                    <span style="font-size:12px;">19/06/2014</span>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <hr />
                </div>
            </div>

            <div class="row"> <!-- criar laço das ubs aqui (caso tenha uma busca por dados de todas ubs) -->
                <div class="col-sm-1">UBS:</div>
                <div class="col-sm-11">
                    <strong>Unidade Morumbi</strong>
                </div>
            </div>
            <div style="height:15px; clear:both;"></div>
            <div class="row">
                <div class="col-sm-3">
                    <strong>Vacina</strong>
                </div>
                <div class="col-sm-3">
                    <strong>Lote</strong>
                </div>
                <div class="col-sm-3">
                    <strong>Validade</strong>
                </div>
                <div class="col-sm-3">
                    <strong>Quantidade</strong>
                </div>
                <div style="padding-top:5px"><hr/></div>
            </div>
            <div class="row"> <!-- criar laço das vacinas aqui -->
                <div class="col-sm-3">
                    BCG
                </div>
                <div class="col-sm-3">
                    AAAA-10
                </div>
                <div class="col-sm-3">
                    30/02/2014
                </div>
                <div class="col-sm-3">
                    999999
                </div>
            </div><!-- termina laço das vacinas aqui e termina o das ubs também aqui -->
        </div>
    </body>
</html>
