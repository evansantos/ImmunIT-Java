<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>
 
<%
    String cnes = (String) session.getAttribute("cnes"); 
    String nomeFantasia = (String) session.getAttribute("nomeFantasia"); 
    String razaoSocial = (String) session.getAttribute("razaoSocial");
    String telefone = (String) session.getAttribute("telefone"); 
    String cep = (String) session.getAttribute("cep"); 
    String endereco = (String) session.getAttribute("endereco"); 
    String numero = (String) session.getAttribute("numero"); 
    String bairro = (String) session.getAttribute("bairro"); 
    String cidade = (String) session.getAttribute("cidade"); 
    String estado = (String) session.getAttribute("estado"); 
    
    if(cep != null){
    }else{
        cnes = "";
        nomeFantasia = "";
        razaoSocial = "";
        telefone = "";
        cep = "";
        endereco = "";
        numero = "";
        bairro = "";
        cidade = "";
        estado = "";        
    }
%>

<h1 class="page-header">Adicionar UBS</h1>

<form method="post" action="enderecoUbs.do">

    <div class="form-group">
        <label for="cnes">CNES</label>
        <input type="text" name="cnes" id="cnes" class="form-control" value="<%=cnes%>">
    </div>

    <div class="form-group">
        <label for="nomefantasia">Nome Fantasia</label>
        <input type="text" name="nomefantasia" id="nomefantasia" class="form-control" value="<%=nomeFantasia%>">
    </div>

    <div class="form-group">
        <label for="razaosocial">Razão Social</label>
        <input type="text" name="razaosocial" id="razaosocial" class="form-control" value="<%=razaoSocial%>">
    </div>

    <div class="form-group" style="padding-bottom: 10px;"> 
        
        <div class="col-sm-2" style="padding-left: 0px;">
            <label for="telefone">Telefone</label>
            <input type="text" name="telefone" id="telefone" class="form-control" value="<%=telefone%>">
        </div> 
    
        <div class="col-sm-2" style="padding-left: 0px;">
            <label for="cep">CEP</label>
            <input type="text" name="cep" id="cep" class="form-control" value="<%=cep%>">
        </div> 
        <div class="col-sm-1" style="padding-top: 25px; padding-left: 0; padding-right: 0; width: 11%; ">
            <button type="submit" class="btn btn-default btn-sm">
                <span class="glyphicon glyphicon-search"></span> Pesquisar
            </button>
        </div> 
            
</form>  

<form method="post" action="cadastrarUbs.do">    
     
    <input type="hidden" name="cnesOculto" id="cnesOculto" value="<%=cnes%>">
    <input type="hidden" name="nomefantasiaOculto" id="nomefantasiaOculto" value="<%=nomeFantasia%>">
    <input type="hidden" name="razaosocialOculto" id="razaosocialOculto" value="<%=razaoSocial%>">
    <input type="hidden" name="telefoneOculto" id="telefoneOculto" value="<%=telefone%>">
    <input type="hidden" name="cepOculto" id="cepOculto" value="<%=cep%>">
     
    
    <div class="col-sm-5" style="padding-left: 0">
            <label for="endereco">Endereço</label>
            <input type="text" name="endereco" id="endereco" class="form-control" value="<%=endereco%>">
        </div>

    <div class="col-sm-2" style="padding-right: 0; padding-left: 0; width: 14%;">
            <label for="numero">Número</label>
            <input type="text" name="numero" id="numero" class="form-control"  value="<%=numero%>" 
                   onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode))) return true; else return false;">
        </div>
    </div>

    <div class="form-group" style="padding-bottom: 10px;">
        <div class="col-sm-4" style="padding-left: 0px;">
            <label for="bairro">Bairro</label>
            <input type="text" name="bairro" id="bairro" class="form-control" value="<%=bairro%>">
        </div>

        <div class="col-sm-4">
            <label for="cidade">Cidade</label>
            <input type="text" name="cidade" id="cidade" class="form-control" value="<%=cidade%>">
        </div>

        <div class="col-sm-2" style="padding-right: 0px;">
            <label for="estado">UF</label>
            <input type="text" name="estado" id="estado" class="form-control" maxlength="2" value="<%=estado%>" 
                   onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode))) return false; else return true;">
        </div>
        
        <div class="col-sm-2" style="padding-right: 0px; padding-top: 38px; padding-left: 35px;">
            <label for="uf">Ativo?</label>
            <input type="checkbox" name="ativo" id="ativo">
        </div>
    </div>
    
    <div class="form-group" style="padding-bottom: 10px;">
        <div class="pull-right">
            <button type="submit" class="btn btn-default">
                <span class="glyphicon glyphicon-save"></span> Salvar
            </button> 
        </div>
    </div>
    
</form>           
            
<%@include  file="includes/_footer.jsp" %>