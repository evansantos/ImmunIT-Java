<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%
    String nome = (String) session.getAttribute("rg"); 
    
    if(nome != null){
    }else{
        nome = "";
    }
%>

<h1 class="page-header">Adicionar vacina</h1>

<form role="form" method="post" action="cadastrarVacina.do"> 
    <div class="form-group">
        <!--<div class="col-sm-3" style="padding-left: 0px;">
            <label for="codigo">
                Código
            </label>
            <input type="text" name="codigo" id="codigo" class="form-control" readonly="">
        </div>-->
        <div class="col-sm-9" style="padding-right: 0px;">
            <label for="nome">
                Nome
            </label>
            <input type="text" name="nome" id="nome" class="form-control">
            <p><!--Espaço--></p>
            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-save"></span> Salvar</button>
        </div>
    </div>

</form>

<%@include  file="includes/_footer.jsp" %>