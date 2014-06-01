<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<h1 class="page-header">Vacinas</h1>

<form method="post" action="pesquisaUser.do">
    <div class="form-group">
        <div class="col-sm-3" style="padding-left: 0;">
            <label>Buscar Vacinas</label>
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
            <th>Código</th>
            <th>Nome</th>
            <th style="text-align:right;">
                <a href="vacineform.jsp">
                    <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-plus"></span> Adicionar</button>
                </a>
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td></td>
            <td></td>
            <td style="text-align:right;">
                <div class="btn-group btn-group-sm">
                    <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
                </div>
            </td>
        </tr>
        
    </tbody>
    <tfoot>
        <tr>
            <td colspan="6"></td>
        </tr>
    </tfoot>
</table>

<%@include  file="includes/_footer.jsp" %>
