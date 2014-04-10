<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<h1 class="page-header">Adicionar lote</h1>

<form role="form">
    <div class="form-group">
        <div class="col-sm-12" style="padding-left: 0px; padding-right: 0">
            <label for="vacina">
                Vacina
            </label>
            <select id="vacina" name="vacina" class="form-control">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
            </select>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="form-group">
        <div class="col-sm-5" style="padding-left: 0px;">
            <label for="lote">
                Lote
            </label>
            <input type="text" name="lote" id="lote" class="form-control">
        </div>
        <div class="col-sm-5">
            <label for="validade">
                Validade
            </label>
            <input type="text" name="validade" id="validade" class="form-control">
        </div>
        <div class="col-sm-2" style="padding-right: 0px;">
            <label for="quantidade">
                Quantidade
            </label>
            <input type="text" name="quantidade" id="quantidade" class="form-control">
        </div>
    </div>
        
    
    <div class="clearfix"></div>
    <div class="pull-right">
        <button type="submit" class="btn btn-default">Salvar</button>
    </div>
</form>

<%@include  file="includes/_footer.jsp" %>
