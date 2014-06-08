<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%
    String loginU = (String) session.getAttribute("login");
    String vacina = "*";
    String Admin = "Admin";
%>

<h1 class="page-header">Relatório de controle de vacinas</h1>

<form method="post" action="geraRelatorio.do" target="_blank">
    
    <div class="form-group">    

        <c:if test="<%=loginU.equals(Admin)%>">
            <div class="col-sm-4" style="padding-left: 0;">
                <label>UBS</label>
                <select id="ubs" name="ubs" class="form-control">
                    <option value="Todos">Todos</option>
                    <jsp:useBean id="listaUbs" class="br.immunit.dao.UbsDAO" />
                    <c:forEach var="ubs" items="<%=listaUbs.listaUBS()%>">
                        <option value="${ubs.nomeFantasia}">${ubs.nomeFantasia}</option>
                    </c:forEach>
                </select>
            </div>
        </c:if>
         
        <c:if test="<%=!loginU.equals(Admin)%>">
            <div class="col-sm-4" style="padding-left: 0;">
                <label>UBS</label>
                <jsp:useBean id="listaUser" class="br.immunit.dao.UserDAO" />
                <input type="text" name="ubs" id="ubs" class="form-control" value="<%=listaUser.buscaUbsUser(loginU, 1)%>" readonly="">
            </div>
        </c:if>
                
        <div class="col-sm-3" style="padding-left: 0px;">
            <label for="vacina">Vacina</label>
            <select id="vacina" name="vacina" class="form-control">
                <option value="*">Todos</option>
                <jsp:useBean id="l_VacinaControl" class="br.immunit.dao.VacinaDAO" />
                <c:forEach var="v" items="<%=l_VacinaControl.preencheLista(vacina)%>">
                    <option value="${v.nome}">${v.nome}</option>
                </c:forEach>
            </select>
        </div>     
                
        <div class="col-sm-2" style="padding-left: 0;">
            <label>Lote</label>
            <input type="text" name="lote" id="lote" class="form-control">
        </div>        
        
        <div class="col-sm-2" style="padding-left: 0;">
            <label>Validade</label>
            <input type="text" name="validade" id="data" class="form-control">
        </div>        
                
        <div class="col-sm-2" style="padding-top: 15px; padding-left: 813px;">
            <button type="submit" class="btn btn-default">
                <span class="glyphicon glyphicon-import"></span> Gerar relatório
            </button>
        </div>
                
    </div>  
                
</form>
        
<%@include  file="includes/_footer.jsp" %>