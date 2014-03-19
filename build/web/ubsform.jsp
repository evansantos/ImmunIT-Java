<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<h1 class="page-header">UBS</h1>

<form role="form">
    <div class="form-group">
        <label for="descricao">
            Nome
        </label>
        <input type="text" name="descricao" id="descricao" class="form-control">
    </div>
    <div class="form-group">
        <label for="endereco">
            Endereço
        </label>
        <input type="text" name="endereco" id="endereco" class="form-control">
    </div>
    <div class="form-group">
        <label for="responsavel">
            Responsável
        </label>
        <input type="text" name="responsavel" id="responsavel" class="form-control">
    </div>
    <div class="pull-right">
        <button type="submit" class="btn btn-default">Salvar</button>
    </div>
</form>

<%@include  file="includes/_footer.jsp" %>