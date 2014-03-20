<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<h1 class="page-header">UBS</h1>

<form role="form">
    <div class="form-group">
        <label for="cnes">
            CNES
        </label>
        <input type="text" name="cnes" id="cnes" class="form-control">
    </div>
    <div class="form-group">
        <label for="nomefantasia">
            Nome Fantasia
        </label>
        <input type="text" name="nomefantasia" id="nomefantasia" class="form-control">
    </div>
    <div class="form-group">
        <label for="razaosocial">
            Razão Social
        </label>
        <input type="text" name="razaosocial" id="razaosocial" class="form-control">
    </div>
    <div class="form-group">
        <label for="endereco">
            Endereço
        </label>
        <input type="text" name="endereco" id="endereco" class="form-control">
    </div>
    <div class="pull-right">
        <button type="submit" class="btn btn-default">Salvar</button>
    </div>
</form>

<%@include  file="includes/_footer.jsp" %>