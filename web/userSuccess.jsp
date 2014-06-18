<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@include file="includes/_header.jsp" %>

<%  
    session.removeAttribute("cpf");
    session.removeAttribute("rg");
    session.removeAttribute("nome");
    session.removeAttribute("sobrenome");
    session.removeAttribute("sexo");
    session.removeAttribute("datanascimento");
    session.removeAttribute("email");
    session.removeAttribute("cep");

    String nome = (String) session.getAttribute("pesquisaUser");
    String login = (String) session.getAttribute("login");
%>

<jsp:useBean id="userAdmin" class="br.immunit.dao.LoginDAO" />
<c:if test="${!login.equals('Admin')}" >
    <c:forEach var="ua" items="<%=userAdmin.perfilUser(login)%>">
        <c:if test="${!ua.funcao.equals('Administrador')}">
            <jsp:forward page="main.jsp"></jsp:forward>
        </c:if>
    </c:forEach>
</c:if>

<h1 class="page-header">Usuário</h1>

<form method="post" action="pesquisaUser.do">
    <div class="form-group">
        <div class="col-sm-3" style="padding-left: 0;">
            <label>Buscar Usuário</label>
            <input type="text" name="pesquisaUser" id="pesquisaUser" class="form-control">
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
            <th>CPF</th>
            <th>Nome</th>
            <th>Sobrenome</th>
            <th>Ramal</th>
            <th>Função</th>
            <th>UBS</th>
            <th style="text-align:right;" colspan="2">
                <a href="userform.jsp">
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="glyphicon glyphicon-plus"></span> Adicionar
                    </button>
                </a>
            </th>
        </tr>
    </thead>

    <tbody>
        <jsp:useBean id="l_UserSuccess" class="br.immunit.dao.UserDAO" />
        <c:forEach var="u" items="<%=l_UserSuccess.preencheListaNome(nome)%>">        
            <tr>
                <td>${u.cpf}</td>
                <td>${u.nome}</td>
                <td>${u.sobrenome}</td>
                <td>${u.ramal}</td>
                <td>${u.funcao}</td>
                <td>${u.ubs}</td>
                <td width="84">
                    <div class="btn-group btn-group-sm">
                        <form method="post" action="editaUser.do">
                            <button type="submit" class="btn btn-default btn-sm">
                                <span class="glyphicon glyphicon-pencil"></span> Editar
                            </button>
                            <input type="hidden" name="cpf" class="form-control" value="${u.cpf}">
                        </form>
                    </div>
                </td>
                <td width="89">
                    <div class="btn-group btn-group-sm">
                        <form method="post" action="excluiUser.do">
                            <button type="submit" class="btn btn-default btn-sm">
                                <span class="glyphicon glyphicon-minus"></span> Excluir
                            </button>
                            <input type="hidden" name="cpf" class="form-control" value="${u.cpf}">
                        </form>
                    </div>
                </td>
            </tr>
        </c:forEach>        
    </tbody>
    
    <tfoot>
        <tr>
            <td colspan="8"></td>
        </tr>
    </tfoot>
</table>
    
<%@include  file="includes/_footer.jsp" %>