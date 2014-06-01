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
         <link href="css/bootstrap.min.css" rel="stylesheet" media="all">
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
            <table border="0">
                <tr>
                    <td width='700' rowspan="2"><span style="font-size:28px;"><strong>Relatório de controle de vacinas</strong></span></td>
                    <td width='100'><span style="font-size:14px;"><strong>Data</strong></span></td>
                </tr>
                <tr>
                    <td>
                        <span style="font-size:12px;">19/06/2014</span>
                    </td>
                </tr>
                <tr>
                    <td colspan='2'>
                        <hr />
                    </td>    
                </tr>
            </table>
            <table><!-- criar laço das ubs aqui (caso tenha uma busca por dados de todas ubs) -->
                <tr>
                    <td width='50'>
                        UBS:
                    </td>
                    <td width='750'>
                        <strong>Unidade Morumbi</strong>
                    </td>
                </tr>
            </table>
           
            <table class="table table-responsive table-striped" border="0">
                <thead>
                    <tr>
                        <th>
                            Vacina
                        </th>
                        <th>
                            Lote
                        </th>
                        <th>
                            Quantidade
                        </th>
                        <th>
                            Validade
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr> <!-- criar laço das vacinas aqui -->
                        <td>
                            BCG
                        </td>
                        <td>
                            AA-10
                        </td>
                        <td>
                            100
                        </td>
                        <td>
                            19/07/2014
                        </td>
                    </tr><!-- termina laço das vacinas aqui --> 
                    <tr> <!-- criar laço das vacinas aqui -->
                        <td>
                            Poliomelite
                        </td>
                        <td>
                            AA-15
                        </td>
                        <td>
                            50
                        </td>
                        <td>
                            31s/07/2014
                        </td>
                    </tr><!-- termina laço das vacinas aqui --> 
                </tbody>
            </table>
            <!--termina o das ubs também aqui -->
           
        </div>
    </body>
</html>
