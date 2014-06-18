<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%
    String login = (String) session.getAttribute("login");
%>

<c:if test="${!login.equals('Admin')}" >
<jsp:useBean id="userAdmin" class="br.immunit.dao.LoginDAO" />
<c:forEach var="ua" items="<%=userAdmin.perfilUser(login)%>">
    <c:if test="${!ua.funcao.equals('Administrador')}">
        <jsp:forward page="main.jsp"></jsp:forward>
    </c:if>
</c:forEach>
</c:if>

<h1 class="page-header">Adicionar vacina</h1>

<form role="form" method="post" action="cadastrarVacina.do"> 
    <div class="form-group">
        <div class="col-sm-9" style="padding-right: 0px;">
            <label for="nome">
                Nome
            </label>
            <input type="text" name="nome" id="nome" class="form-control">
            <p><!--Espaço--></p>
            <button type="submit" class="btn btn-default">
                <span class="glyphicon glyphicon-save"></span> Salvar
            </button>
        </div>
    </div>

</form>

<%@include  file="includes/_footer.jsp" %>