<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<h1 class="page-header">UBS</h1>

<form role="form">
    <div class="form-group">
        <label for="nome">
            Nome
        </label>
        <input type="text" name="nome" id="nome" class="form-control">
    </div>
    <div class="form-group">
        <label for="login">
            Login
        </label>
        <input type="text" name="login" id="login" class="form-control">
    </div>
    <div class="form-group">
        <label for="cpf">
            CPF
        </label>
        <input type="text" name="cpf" id="cpf" class="form-control">
    </div>
    <div class="form-group">
        <label for="endereco">
            Endereço
        </label>
        <input type="text" name="endereco" id="endereco" class="form-control">
    </div>
    <div class="form-group">
        <label for="bairro">
            Bairro
        </label>
        <input type="text" name="bairro" id="bairro" class="form-control">
    </div>
    <div class="form-group">
        <label for="cep">
            CEP
        </label>
        <input type="text" name="cep" id="cep" class="form-control">
    </div>
    <div class="form-group">
        <label for="telefone">
            Telefone
        </label>
        <input type="text" name="telefone" id="telefone" class="form-control">
    </div>
    <div class="pull-right">
        <button type="submit" class="btn btn-default">Salvar</button>
    </div>
</form>

<%@include  file="includes/_footer.jsp" %>