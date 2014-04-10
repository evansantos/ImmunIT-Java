<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%    
    String cpf = (String) session.getAttribute("pesquisaUser");    
    long u_Cpf = Long.parseLong(cpf);
%>

<jsp:useBean id="lista" class="br.immunit.dao.UserDAO" />
<c:forEach var="u" items="<%=lista.preencheLista(u_Cpf)%>">

<h1 class="page-header">Alterar senha</h1>

<form method="post" action="alterarSenha.do">
    <div class="form-group" style="padding-top: 10px">
        <div class="col-sm-6">
            <label>Usuário</label>
            <input type="text" name="usuario" id="usuario" class="form-control" style="" value="${u.login}">
        </div>
        <div class="col-sm-6">
            <label>Senha atual</label>
            <input type="password" name="senhaatual" id="senhaatual" class="form-control" style="">
        </div>
    </div>
    <div class="clearfix" ></div>
    <div class="form-group" style="padding-top: 10px">
        <div class="col-sm-6">
            <label>Nova senha</label>
            <input type="password" name="novasenha" id="novasenha" class="form-control" style="">
        </div>
        <div class="col-sm-6">
            <label>Repita a senha</label>
            <input type="password" name="novasenhaconfere" id="novasenhaconfere" class="form-control" style="">
        </div>
    </div>
    <div class="clearfix" ></div>
    <div class="form-group" style="padding-top: 10px">
        <div class="col-sm-12">
            <div class="pull-right">
                <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-save"></span> Salvar</button>
            </div>
        </div>
    </div>
</form>
    
</c:forEach>

<%@include  file="includes/_footer.jsp" %>