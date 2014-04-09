<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<h1 class="page-header">Alterar senha</h1>

<form method="post" action="pesquisaUbs.do">
    <div class="form-group" style="padding-top: 10px">
        <div class="col-sm-6">
            <label>Usuário</label>
            <input type="text" name="usuario" id="usuario" class="form-control" style="">
        </div>
        <div class="col-sm-6">
            <label>Senha atual</label>
            <input type="text" name="senhaatual" id="senhaatual" class="form-control" style="">
        </div>
    </div>
    <div class="clearfix" ></div>
    <div class="form-group" style="padding-top: 10px">
        <div class="col-sm-6">
            <label>Nova senha</label>
            <input type="text" name="novasenha" id="novasenha" class="form-control" style="">
        </div>
        <div class="col-sm-6">
            <label>Repita a senha</label>
            <input type="text" name="novasenhaconfere" id="novasenhaconfere" class="form-control" style="">
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
    


<%@include  file="includes/_footer.jsp" %>