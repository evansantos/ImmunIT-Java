<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%    
    String cpf = (String) session.getAttribute("pesquisaUser");    
    long u_Cpf = Long.parseLong(cpf);
%>

<jsp:useBean id="lista" class="br.immunit.dao.UserDAO" />
<c:forEach var="u" items="<%=lista.preencheLista(u_Cpf)%>">
    
<h1 class="page-header">Usuário</h1>

<form method="post" action="pesquisaUser.do">
    <div class="form-group">
        <div class="col-sm-3" style="padding-left: 0;">
            <label>Buscar Usuário</label>
            <input type="text" name="pesquisaUser" id="pesquisaUser" class="form-control">
        </div>
        <div class="col-sm-2" style="padding-top: 25px; padding-left: 0">
            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span> Pesquisar</button>
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
            <th style="text-align:right;">
                <a href="userform.jsp">
                    <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-plus"></span> Adicionar</button>
                </a>
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>${u.cpf}</td>
            <td>${u.nome}</td>
            <td>${u.sobrenome}</td>
            <td>${u.ramal}</td>
            <td>${u.funcao}</td>
            <td>${u.ubs}</td>
            <td style="text-align:right;">
                <div class="btn-group btn-group-sm">
                    <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-lock"></span> Senha</button>
                    <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-pencil"></span><a href="userformEdit.jsp"> Editar</a></button>
                    <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-minus"></span> Excluir</button>
                </div>
            </td>
        </tr>
        
    </tbody>
    <tfoot>
        <tr>
            <td colspan="14"></td>
        </tr>
    </tfoot>
</table>

</c:forEach>

<%@include  file="includes/_footer.jsp" %>