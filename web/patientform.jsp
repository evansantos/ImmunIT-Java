<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<h1 class="page-header">Adicionar paciente</h1>

<form role="form">
    <div class="form-group">
        <div class="col-sm-6" style="padding-left: 0px">
            <label for="cartaosus">
                Cartão SUS
            </label>
            <input type="text" name="cartaosus" id="cartaosus" class="form-control">
        </div>
        <div class="col-sm-6" style="padding-right: 0px">
            <label for="cpf">
                CPF
            </label>
            <input type="text" name="cpf" id="cpf" class="form-control">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-3" style="padding-left: 0px">
            <label for="nome">
                Nome
            </label>
            <input type="text" name="nome" id="nome" class="form-control">
        </div>
        <div class="col-sm-3">
            <label for="sobrenome">
                Sobrenome
            </label>
            <input type="text" name="sobrenome" id="sobrenome" class="form-control">
        </div>
        <div class="col-sm-2">
            <label for="datanascimento">
                Data Nascimento
            </label>
            <input type="text" name="datanascimento" id="datanascimento" class="form-control">
        </div>
        <div class="col-sm-4" style="padding-right: 0">
            <label for="responsavel">
                Responsavel
            </label>
            <input type="text" name="responsavel" id="responsavel" class="form-control">
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="form-group" style="padding-bottom: 10px;">
        <div class="col-sm-2" style="padding-left: 0px;">
            <label for="cep">
                CEP
            </label>
            <input type="text" name="cep" id="cep" class="form-control">
        </div>
        <div class="col-sm-6">
            <label for="endereco">
                Endereço
            </label>
            <input type="text" name="endereco" id="endereco" class="form-control">
        </div>
        <div class="col-sm-2">
            <label for="numero">
                Número
            </label>
            <input type="text" name="numero" id="numero" class="form-control">
        </div>
        <div class="col-sm-2" style="padding-right: 0px;">
            <label for="complemento">
                Complemento
            </label>
            <input type="text" name="complemento" id="complemento" class="form-control">
        </div>
    </div>
    <div class="form-group" style="padding-bottom: 10px;">
        <div class="col-sm-4" style="padding-left: 0px;">
            <label for="bairro">
                Bairro
            </label>
            <input type="text" name="bairro" id="bairro" class="form-control">
        </div>
        <div class="col-sm-4">
            <label for="cidade">
                Cidade
            </label>
            <input type="text" name="cidade" id="cidade" class="form-control">
        </div>
        <div class="col-sm-2">
            <label for="uf">
                Uf
            </label>
            <select id="uf" name="uf" class="form-control">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
            </select>
        </div>
        <div class="col-sm-2"  style="padding-right: 0px;">
            <label for="telefone">
                Telefone
            </label>
            <input type="text"  id="telefone" name="telefone" class="form-control">
        </div>
    </div>
    
    <div class="pull-right">
        <button type="submit" class="btn btn-default">Salvar</button>
    </div>
</form>

<%@include  file="includes/_footer.jsp" %>