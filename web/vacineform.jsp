<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<h1 class="page-header">UBS</h1>

<form role="form">
    <div class="form-group">
        <div class="col-sm-3" style="padding-left: 0px;">
            <label for="codigo">
                Código
            </label>
            <input type="text" name="codigo" id="codigo" class="form-control">
        </div>
        <div class="col-sm-9" style="padding-right: 0px;">
            <label for="nome">
                Nome
            </label>
            <input type="text" name="nome" id="nome" class="form-control">
        </div>
    </div>
    
        
    
    <div class="clearfix"></div>
    <div class="pull-right">
        <button type="submit" class="btn btn-default">Salvar</button>
    </div>
</form>

<%@include  file="includes/_footer.jsp" %>