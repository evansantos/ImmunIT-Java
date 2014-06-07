<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%
    session.removeAttribute("cnes");
    session.removeAttribute("nomeFantasia");
    session.removeAttribute("razaoSocial");
    session.removeAttribute("telefone");
    session.removeAttribute("cep");
    session.removeAttribute("endereco");
    session.removeAttribute("numero");
    session.removeAttribute("bairro");
    session.removeAttribute("cidade");
    session.removeAttribute("estado");

    String ubs = (String) session.getAttribute("pesquisaUBS");
%>

<h1 class="page-header">UBS</h1>

<form method="post" action="pesquisaUbs.do">

    <div class="form-group">
        <div class="col-sm-2" style="padding-left: 0;">
            <label>Buscar UBS</label>
            <input type="text" name="pesquisaUBS" class="form-control">
        </div>
        <div class="col-sm-2" style="padding-top: 25px; padding-left: 0">
            <button type="submit" class="btn btn-default">
                <span class="glyphicon glyphicon-search"></span> Pesquisar
            </button>
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
            <th style="text-align:right;" colspan="2">
                <a href="ubsform.jsp">
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="glyphicon glyphicon-plus"></span> Adicionar
                    </button>
                </a>
            </th>
        </tr>
    </thead>


    <tbody>
        <jsp:useBean id="l_UbsSucces" class="br.immunit.dao.UbsDAO" />
        <c:forEach var="u" items="<%=l_UbsSucces.preencheLista(ubs)%>">
            <tr>
                <td>${u.cnes}</td>
                <td>${u.nomeFantasia}</td>
                <td>${u.razaoSocial}</td>
                <td>${u.endereco}</td>
                <td>
                    <c:if test="${u.ativo == true}"><span class="glyphicon glyphicon-ok"></span></c:if>
                    <c:if test="${u.ativo != true}"><span class="glyphicon glyphicon-remove"></span></c:if>
                    </td>
                    <td style="text-align:right;">
                        <div class="btn-group btn-group-sm">
                            <form method="post" action="editaUbs.do">
                                <button type="submit" class="btn btn-default btn-sm">
                                    <span class="glyphicon glyphicon-pencil"></span> Editar
                                </button>
                                <input type="hidden" name="cnes" class="form-control" value="${u.cnes}">
                        </form>
                    </div>
                </td>
                <td width="89">
                    <div class="btn-group btn-group-sm">
                        <form method="post" action="excluiUbs.do">
                            <button type="submit" class="btn btn-default btn-sm">
                                <span class="glyphicon glyphicon-minus"></span> Excluir
                            </button>
                            <input type="hidden" name="cnes" class="form-control" value="${u.cnes}">
                        </form>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </tbody>

    <tfoot>
        <tr>
            <td colspan="7"></td>
        </tr>
    </tfoot>

</table>

<%@include  file="includes/_footer.jsp" %>