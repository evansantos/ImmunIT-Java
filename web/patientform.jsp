<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%
    String cartaoSUS = (String) session.getAttribute("cartaoSUS");
    String cpf = (String) session.getAttribute("cpf");
    String rg = (String) session.getAttribute("rg");
    String nome = (String) session.getAttribute("nome");
    String sobrenome = (String) session.getAttribute("sobrenome");
    String sexo = (String) session.getAttribute("sexo");
    String datanascimento = (String) session.getAttribute("datanascimento");
    String email = (String) session.getAttribute("email");
    String responsavel = (String) session.getAttribute("responsavel");
    String cep = (String) session.getAttribute("cep");

    if (cep != null) {
    } else {
        cartaoSUS = "";
        cpf = "";
        rg = "";
        nome = "";
        sobrenome = "";
        sexo = "";
        datanascimento = "";
        email = "";
        responsavel = "";
        cep = "";
    }
%>

<h1 class="page-header">Adicionar paciente</h1>

<form method="post" action="enderecoPaciente.do">

    <div class="form-group">

        <div class="col-sm-4" style="padding-left: 0px">
            <label for="cartaoSUS">Cartão SUS</label>
            <input type="text" name="cartaoSUS" id="cartaoSUS" class="form-control" value="<%=cartaoSUS%>">
        </div>

        <div class="col-sm-4" style="padding-left: 0px;">
            <label for="cpf">CPF</label>
            <input type="text" name="cpf" id="cpf" class="form-control" value="<%=cpf%>">
        </div>

        <div class="col-sm-4" style="padding-right: 0px;">
            <label for="rg">RG </label>
            <input type="text" name="rg" id="rg" class="form-control" value="<%=rg%>">
        </div>

    </div>

    <div class="clearfix"></div>

    <div class="form-group" style="padding-top: 10px;">

        <div class="col-sm-6" style="padding-left: 0px;">
            <label for="nome">Nome</label>
            <input type="text" name="nome" id="nome" class="form-control" value="<%=nome%>">
        </div>
        <div class="col-sm-6" style="padding-right: 0px;">
            <label for="sobrenome">Sobrenome</label>
            <input type="text" name="sobrenome" id="sobrenome" class="form-control" value="<%=sobrenome%>">
        </div>

    </div>

    <div class="clearfix"></div>

    <div class="form-group" style="padding-top: 10px;">

        <div class="col-sm-3" style="padding-left: 0px;">
            <label>Sexo </label>
            <div class="clearfix"></div>

            <%
                if (sexo.equals("F")) {
            %>
            <div class="radio-inline">
                <label><input type="radio" name="sexo" id="sexo1" value="F" checked>Feminino</label>
            </div>
            <div class="radio-inline">
                <label><input type="radio" name="sexo" id="sexo2" value="M">Masculino</label>
            </div>
            <%
            } else {
            %>
            <div class="radio-inline">
                <label><input type="radio" name="sexo" id="sexo1" value="F">Feminino</label>
            </div>
            <div class="radio-inline">
                <label><input type="radio" name="sexo" id="sexo2" value="M" checked>Masculino</label>
            </div>
            <%
                }
            %>

        </div>  
        <div class="col-sm-3">
            <label for="datanascimento">Data de Nascimento</label>
            <input type="text" name="datanascimento" id="datanascimento" class="form-control" value="<%=datanascimento%>">
        </div>
        <div class="col-sm-3" style="padding-right: 0px;"> 
            <label for="email">E-mail</label>
            <input type="text" name="email" id="email" class="form-control" value="<%=email%>">
        </div>
        <div class="col-sm-3" style="padding-right: 0px;"> 
            <label for="responsavel">Responsável</label>
            <input type="text" name="responsavel" id="responsavel" class="form-control" value="<%=responsavel%>">
        </div>
    </div>

    <div class="clearfix"></div>

    <div class="form-group"  style="padding-top: 10px;">

        <div class="col-sm-2" style="padding-left: 0px;">
            <label for="cep">CEP</label>
            <input type="text" name="cep" id="cep" class="form-control" value="<%=cep%>">
        </div>
        <div class="col-sm-1" style="padding-top: 25px; padding-left: 0; padding-right: 0; width: 11%; ">
            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span> Pesquisa</button>
        </div>

</form>

<form method="post" action="cadastrarPaciente.do">   

    <input type="text" name="cartaoSUS" id="cartaoSUS" value="<%=cartaoSUS%>" hidden="">
    <input type="text" name="cpf" id="cpf" value="<%=cpf%>" hidden="">
    <input type="text" name="rg" id="rg" value="<%=rg%>" hidden="">
    <input type="text" name="nome" id="nome" value="<%=nome%>" hidden="">
    <input type="text" name="sobrenome" id="sobrenome" value="<%=sobrenome%>" hidden="">
    <input type="text" name="sexo" id="sexo" value="<%=sexo%>" hidden="">
    <input type="text" name="datanascimento" id="datanascimento" value="<%=datanascimento%>" hidden="">
    <input type="text" name="email" id="email" value="<%=email%>" hidden="">
    <input type="text" name="responsavel" id="responsavel" value="<%=responsavel%>" hidden="">
    <input type="text" name="cep" id="cep" value="<%=cep%>" hidden="">

    <div class="col-sm-5">
        <label for="endereco">Endereço</label>
        <input type="text" name="endereco" id="endereco" class="form-control">
    </div>

    <div class="col-sm-2">
        <label for="numero">Número</label>
        <input type="text" name="numero" id="numero" class="form-control">
    </div>

    <div class="col-sm-2" style="padding-right: 0; padding-left: 0; width: 14%;">
        <label for="complemento">Complemento</label>
        <input type="text" name="complemento" id="complemento" class="form-control">
    </div>

</div>
  <div class="clearfix"></div>
<div class="form-group" style="padding-bottom: 10px;">

    <div class="col-sm-4" style="padding-left: 0px;">
        <label for="bairro">Bairro</label>
        <input type="text" name="bairro" id="bairro" class="form-control">
    </div>

    <div class="col-sm-4">
        <label for="cidade">Cidade</label>
        <input type="text" name="cidade" id="cidade" class="form-control">
    </div>

    <div class="col-sm-2" style="padding-right: 0px;">
        <label for="estado">UF</label>
        <input type="text" name="estado" id="estado" class="form-control">
    </div>

    <div class="col-sm-2"  style="padding-right: 0px;">
        <label for="telefone">Telefone</label>
        <input type="text"  id="telefone" name="telefone" class="form-control">
    </div>

</div>

<input type="text" name="enderecoExiste" id="enderecoExiste" value="0" hidden="">    

<div class="form-group" style="padding-bottom: 10px;">
    <div class="pull-right">
        <p><!--Espaço--></p>
        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-save"></span> Salvar</button> 
    </div>
</div>

</form>

<%@include  file="includes/_footer.jsp" %>