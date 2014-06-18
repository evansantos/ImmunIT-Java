<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br" xml:lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text-html; charset=ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><bean:message key="welcome.title"/></title>

        <link href="css/bootstrap.min.css" rel="stylesheet" media="all">
        <link href="css/style.css" rel="stylesheet" >
         
        <html:base />
    </head>
    <body>
        
        <%    
            String ubs = (String) session.getAttribute("ubs");
            String vacina = (String) session.getAttribute("vacina");
            String lote = (String) session.getAttribute("lote");
            String validade = (String) session.getAttribute("validade");
            String login = (String) session.getAttribute("login");
        %>
        
        <c:if test="${!login.equals('Admin')}" >
        <jsp:useBean id="userAdmin" class="br.immunit.dao.LoginDAO" />
        <c:forEach var="ua" items="<%=userAdmin.perfilUser(login)%>">
            <c:if test="${!ua.funcao.equals('Gerente')}">
                <jsp:forward page="main.jsp"></jsp:forward>
            </c:if>
        </c:forEach>
        </c:if>
        
        <div class="container">
            <table border="0">
                <tr>
                    <td width='700' rowspan="2">
                        <span style="font-size:28px;">
                            <strong>Relatório de controle de vacinas</strong>
                        </span>
                    </td>
                    <td width='500'>
                        <span style="font-size:14px;">
                            
                        </span>
                    </td>
                </tr>
                <tr>
                    <td><span style="font-size:12px;"></span></td>
                </tr>
                <tr>
                    <td colspan='2'><hr /></td>    
                </tr>
            </table>
            
            <table>
                <tr>
                    <td width='50'>UBS:</td>
                    <td width='750'><strong><%=ubs%></strong></td>
                </tr>
                <tr><td><br></td></tr>
            </table>

            <table class="table table-responsive table-striped" border="0">
                <thead>
                    <tr>
                        <th>Vacina</th>
                        <th>Lote</th>
                        <th>Quantidade</th>
                        <th>Validade</th>
                    </tr>
                </thead>
                <tbody>
                    <jsp:useBean id="r_RelatorioControl" class="br.immunit.dao.ControleVacinaDAO"/>
                    <c:forEach var="r" items="<%=r_RelatorioControl.preencheRelatorio(ubs, vacina, lote, validade, login)%>"> 
                        <tr>
                            <td>${r.nomeVacina}</td>
                            <td>${r.codigo}</td>
                            <td>${r.quantidade}</td>
                            <td>${r.validade}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
           
            <div class="pull-right">
                <button class="btn btn-default btn-sm" onclick="this.display='none'; window.print()">
                    <span class="glyphicon glyphicon-print"></span> Imprimir
                </button>
                <button class="btn btn-default btn-sm" onclick="this.display='none'; window.close()">
                    <span class="glyphicon glyphicon-step-forward"></span> Fechar
                </button>
            </div>
        </div>
        
       
    </body>
</html>
