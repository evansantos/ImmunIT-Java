<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<h1 class="page-header">UBS</h1>

<table class="table table-striped table-condensed">
    <thead>
        <tr>
            <th>Código</th>
            <th>Nome</th>
            <th>Lote</th>
            <th>Validade</th>
            <th>Quantidade</th>
            <th style="text-align:right;">
                <a href="vacineform.jsp">
                    <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-plus"></span> Adicionar</button>
                </a>
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>A101 </td>
            <td>Paracetamol</td>
            <td>984032-SV</td>
            <td>30/02/2050</td>
            <td>500</td>
            <td style="text-align:right;">
                <div class="btn-group btn-group-sm">
                    <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
  <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-minus"></span> Excluir</button>
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
