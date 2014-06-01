<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%    
    String cnes = (String) session.getAttribute("pesquisaUBS");    
    int u_Cnes = Integer.parseInt(cnes);
%>

<jsp:useBean id="l_UbsSucces" class="br.immunit.dao.UbsDAO" />
<c:forEach var="u" items="<%=l_UbsSucces.preencheLista(u_Cnes)%>">

    <h1 class="page-header">UBS</h1>

    <form method="post" action="pesquisaUbs.do">

        <div class="form-group">
            <div class="col-sm-2" style="padding-left: 0;">
                <label>Buscar UBS</label>
                <input type="text" name="pesquisaUBS" id="cnes" class="form-control">
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
                <th style="text-align:right;">
                    <a href="ubsform.jsp">
                        <button type="button" class="btn btn-default btn-sm">
                            <span class="glyphicon glyphicon-plus"></span> Adicionar
                        </button>
                    </a>
                </th>
            </tr>
        </thead>

        <tbody>
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
                    <a href="ubsformEdit.jsp">
                        <div class="btn-group btn-group-sm">
                            <button type="submit" class="btn btn-default">
                                <span class="glyphicon glyphicon-pencil"></span> Editar
                            </button>
                        </div>
                    </a>
                </td>
            </tr>
        </tbody>

        <tfoot>
            <tr>
                <td colspan="6"></td>
            </tr>
        </tfoot>

    </table>

</c:forEach>

<%@include  file="includes/_footer.jsp" %>