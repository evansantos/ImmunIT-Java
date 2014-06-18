<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@include file="includes/_header.jsp" %>

<%
    session.removeAttribute("nome");
    
    String vacina = (String) session.getAttribute("pesquisaVacina");  
    String login = (String) session.getAttribute("login");
%>

<c:if test="${!login.equals('Admin')}" >
<jsp:useBean id="userAdmin" class="br.immunit.dao.LoginDAO" />
<c:forEach var="ua" items="<%=userAdmin.perfilUser(login)%>">
    <c:if test="${!ua.funcao.equals('Administrador')}">
        <jsp:forward page="main.jsp"></jsp:forward>
    </c:if>
</c:forEach>
</c:if>

<h1 class="page-header">Vacinas</h1>

<form method="post" action="pesquisaVacina.do">
    <div class="form-group">
        <div class="col-sm-3" style="padding-left: 0;">
            <label>Buscar Vacinas</label>
            <input type="text" name="pesquisaVacina" id="pesquisaVacina" class="form-control">
        </div>
        <div class="col-sm-2" style="padding-top: 25px; padding-left: 0">
            <button type="submit" class="btn btn-default">
                <span class="glyphicon glyphicon-search"></span> Pesquisar
            </button>
        </div>
    </div>
</form>

<table class="table table-striped table-condensed">
    <thead>
        <tr>
            <th>Código</th>
            <th>Nome</th>
            <th style="text-align:right;">
                <a href="vacineform.jsp">
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="glyphicon glyphicon-plus"></span> Adicionar
                    </button>
                </a>
            </th>
        </tr>
    </thead>
    <tbody>
         <jsp:useBean id="l_vacina" class="br.immunit.dao.VacinaDAO" />
         <c:forEach var="v" items="<%=l_vacina.preencheLista(vacina)%>">
            <tr>
                <td>${v.codigo}</td>
                <td>${v.nome}</td>
                <td style="text-align:right;">
                    <div class="btn-group btn-group-sm">
                        <form method="post" action="editaVacina.do">
                            <button type="submit" class="btn btn-default">
                                <span class="glyphicon glyphicon-pencil"></span> Editar
                            </button>
                            <input type="hidden" name="codigo" class="form-control" value="${v.codigo}">
                        </form>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="6"></td>
        </tr>
    </tfoot>
</table>

<%@include  file="includes/_footer.jsp" %>
