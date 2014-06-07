<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<h1 class="page-header">Relatório de controle de vacinas</h1>

<form method="post" action="pesquisaLote.do">
    
    <div class="form-group">
        <div class="col-sm-5" style="padding-left: 0;">
            <label>Nome da UBS</label>
            <select id="ubs" name="ubs" class="form-control">
                <jsp:useBean id="listaU" class="br.immunit.dao.UbsDAO" />
                <c:forEach var="u" items="<%=listaU.listaUBS()%>">
                    <option value="${u.nomeFantasia}">${u.nomeFantasia}</option>
                </c:forEach>
            </select>
        </div>
                
        <div class="col-sm-5" style="padding-left: 0;">
            <label>Lote da vacina</label>

        </div>        
                
        <div class="col-sm-2" style="padding-top: 25px; padding-left: 0">
            <button type="submit" class="btn btn-default">
                <span class="glyphicon glyphicon-search"></span> Pesquisar
            </button>
        </div>
    </div>            
</form>
        
<%@include  file="includes/_footer.jsp" %>