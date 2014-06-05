<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%
    String vacina = "*";
%>

<h1 class="page-header">Adicionar lote</h1>

<form role="form" method="post" action="cadastrarLote.do">
    <div class="form-group">
        <div class="col-sm-12" style="padding-left: 0px; padding-right: 0">
            <label for="vacina">
                Vacina
            </label>
            <select id="vacina" name="vacina" class="form-control">
                <jsp:useBean id="l_VacinaControl" class="br.immunit.dao.VacinaDAO" />
                <c:forEach var="v" items="<%=l_VacinaControl.preencheLista(vacina)%>">
                    <option value="${v.codigo}">${v.codigo} - ${v.nome}</option>
                </c:forEach>
            </select>
        </div>
    </div>
                
    <div class="clearfix"></div>
    
    <div class="form-group">
        <div class="col-sm-5" style="padding-left: 0px;">
            <label for="lote">Lote</label>
            <input type="text" name="lote" id="lote" class="form-control">
        </div>
        <div class="col-sm-5">
            <label for="validade">Validade</label>
            <input type="text" name="validade" id="data" class="form-control">
        </div>
        <div class="col-sm-2" style="padding-right: 0px;">
            <label for="quantidade">Quantidade</label>
            <input type="text" name="quantidade" id="quantidade" class="form-control">
        </div>
    </div>
        
    <div class="clearfix"></div>
    
    <div class="pull-right">
        <p><!--Espaço--></p>
        <button type="submit" class="btn btn-default">
            <span class="glyphicon glyphicon-save"></span> Salvar
        </button>
    </div>
</form>

<%@include  file="includes/_footer.jsp" %>
