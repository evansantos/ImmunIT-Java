<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%
    session.removeAttribute("cnes");
    session.removeAttribute("nomeFantasia");
    session.removeAttribute("razaoSocial");
    session.removeAttribute("telefone");
    session.removeAttribute("cep");
%>

<h1 class="page-header">UBS</h1>

<form method="post" action="pesquisaUbs.do">
    <div class="form-group">
        <div class="col-sm-2" style="padding-left: 0;">
            <label>Buscar UBS</label>
            <input type="text" name="pesquisaUBS" id="pesquisaUBS" class="form-control" style="">
        </div>
        <div class="col-sm-2" style="padding-top: 25px; padding-left: 0">
            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span> Pesquisar</button>
        </div>
    </div>
</form>
    
<table class="table table-striped">
    <thead>
        <tr>
            <th>CNES</th>
            <th>Nome Fantasia</th>
            <th>Razão Social</th>
            <th>Endereço</th>
            <th>Status</th>
            <th style="text-align:right;">
                <a href="ubsform.jsp">
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
            <td style="text-align:right;"></td>
        </tr>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="6"></td>
        </tr>
    </tfoot>
</table>

<%@include  file="includes/_footer.jsp" %>