<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@include file="includes/_header.jsp" %>

<%    
    String codigo = (String) session.getAttribute("codigo");    
    int v_Codigo = Integer.parseInt(codigo);
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

<jsp:useBean id="l_vacina" class="br.immunit.dao.VacinaDAO" />
<c:forEach var="v" items="<%=l_vacina.preencheListaNome(v_Codigo)%>"> 

<h1 class="page-header">Adicionar vacina</h1>

<form role="form" method="post" action="editaCadastroVacina.do"> 
    <div class="form-group">
        <div class="col-sm-1" style="padding-left: 0px;">
            <label for="codigo">
                Código
            </label>
            <input type="text" name="codigo" id="codigo" class="form-control" value="${v.codigo}" readonly="">
        </div>
        <div class="col-sm-9" style="padding-right: 0px;">
            <label for="nome">
                Nome
            </label>
            <input type="text" name="nome" id="nome" class="form-control" value="${v.nome}">
            <p><!--Espaço--></p>
            <button type="submit" class="btn btn-default">
                <span class="glyphicon glyphicon-save"></span> Alterar
            </button>
        </div>
    </div>
</form>

</c:forEach>            
            
<%@include  file="includes/_footer.jsp" %>