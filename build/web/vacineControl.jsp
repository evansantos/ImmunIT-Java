<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%
    session.removeAttribute("lote");
    session.removeAttribute("data");
    session.removeAttribute("quantidade");
%>

<h1 class="page-header">Controle de vacinas</h1>

<form method="post" action="">
    <div class="form-group">
        <div class="col-sm-2" style="padding-left: 0;">
            <label>Buscar Vacina</label>
            <input type="text" name="pesquisaLote" id="pesquisaLote" class="form-control" style="">
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
            <th>Lote</th>
            <th>Validade</th>
            <th>Quantidade</th>
            <th style="text-align:right;">
                <a href="vacineControlForm.jsp">
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="glyphicon glyphicon-plus"></span> Adicionar
                    </button>
                </a>
            </th>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <td colspan="6"></td>
        </tr>
    </tfoot>
</table>

<%@include  file="includes/_footer.jsp" %>
