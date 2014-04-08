<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%
    session.removeAttribute("cpf");
    session.removeAttribute("rg");
    session.removeAttribute("nome");
    session.removeAttribute("sobrenome");
    session.removeAttribute("sexo");
    session.removeAttribute("datanascimento");
    session.removeAttribute("email");
    session.removeAttribute("cep");
%>

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
            <th>Acesso</th>
            <th style="text-align:right;">
                <a href="userform.jsp">
                    <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-plus"></span> Adicionar</button>
                </a>
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td style="text-align:right;"></td>
        </tr>
        
    </tbody>
    <tfoot>
        <tr>
            <td colspan="14"></td>
        </tr>
    </tfoot>
</table>

<%@include  file="includes/_footer.jsp" %>
