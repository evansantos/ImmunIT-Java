<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%    
    String cpf = (String) session.getAttribute("cpf");
    String cep = (String) session.getAttribute("cep");
    long p_Cpf = Long.parseLong(cpf);
%>

<jsp:useBean id="l_PatientFormEdit" class="br.immunit.dao.PacienteDAO" />
<c:forEach var="p" items="<%=l_PatientFormEdit.preencheLista(p_Cpf,"")%>">

    <h1 class="page-header">Edita paciente</h1>

    <form method="post" action="enderecoPacienteEdit.do">

        <div class="form-group">

            <div class="col-sm-4" style="padding-left: 0px">
                <label for="cartaoSUS">Cartão SUS</label>
                <input type="text" name="cartaoSUS" id="cartaoSUS" class="form-control"  value="${p.cartaoSUS}" readonly="">
            </div>

            <div class="col-sm-4" style="padding-left: 0px;">
                <label for="cpf">CPF</label>
                <input type="text" name="cpf" id="cpf" class="form-control" value="${p.cpf}" readonly="">
            </div>

            <div class="col-sm-4" style="padding-right: 0px;">
                <label for="rg">RG </label>
                <input type="text" name="rg" id="rg" class="form-control" value="${p.rg}" readonly="">
            </div>

        </div>

        <div class="clearfix"></div>

        <div class="form-group" style="padding-top: 10px;">

            <div class="col-sm-6" style="padding-left: 0px;">
                <label for="nome">Nome</label>
                <input type="text" name="nome" id="nome" class="form-control" value="${p.nome}" readonly="">
            </div>
            <div class="col-sm-6" style="padding-right: 0px;">
                <label for="sobrenome">Sobrenome</label>
                <input type="text" name="sobrenome" id="sobrenome" class="form-control" value="${p.sobrenome}" readonly="">
            </div>

        </div>

        <div class="clearfix"></div>

        <div class="form-group" style="padding-top: 10px;">

            <div class="col-sm-3" style="padding-left: 0px;">
                <label>Sexo </label>
                <div class="clearfix"></div>

                <c:if test="${p.sexo.equals('F')}">
                    <div class="radio-inline" readonly="">
                        <label><input type="radio" name="sexo" id="sexo1" value="F" disabled="" checked>Feminino</label>
                    </div>
                    <div class="radio-inline" readonly=""> 
                        <label><input type="radio" name="sexo" id="sexo2" value="M" disabled="">Masculino</label>
                    </div>
                </c:if>
                <c:if test="${p.sexo.equals('M')}">
                    <div class="radio-inline" readonly="">
                        <label><input type="radio" name="sexo" id="sexo1" value="F" disabled="">Feminino</label>
                    </div>
                    <div class="radio-inline" readonly="">
                        <label><input type="radio" name="sexo" id="sexo2" value="M" disabled="" checked>Masculino</label>
                    </div>
                </c:if>
            </div>  
            
            <div class="col-sm-3">
                <label for="datanascimento">Data de Nascimento</label>
                <input type="text" name="datanascimento" id="datanascimento" class="form-control" value="${p.dataNascimento}" readonly="">
            </div>
            <div class="col-sm-3" style="padding-right: 0px;"> 
                <label for="email">E-mail</label>
                <input type="text" name="email" id="email" class="form-control" value="${p.email}">
            </div>
            <div class="col-sm-3" style="padding-right: 0px;"> 
                <label for="responsavel">Responsável</label>
                <input type="text" name="responsavel" id="responsavel" class="form-control" value="${p.responsavel}">
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="form-group"  style="padding-top: 10px;">

            <div class="col-sm-2" style="padding-left: 0px;">
                <label for="cep">CEP</label>
                <input type="text" name="cep" id="cep" class="form-control" value="<%=cep%>">
            </div>
            <div class="col-sm-1" style="padding-top: 25px; padding-left: 0; padding-right: 0; width: 11%; ">
                <button type="submit" class="btn btn-default">
                    <span class="glyphicon glyphicon-search"></span> Pesquisa
                </button>
            </div>

    </form>

    <form method="post" action="editaCadastraPaciente.do">   

            <input type="hidden" name="cartaoSUS" id="cartaoSUS" value="${p.cartaoSUS}">
            <input type="hidden" name="cpf" id="cpf" value="${p.cpf}">
            <input type="hidden" name="rg" id="rg" value="${p.rg}">
            <input type="hidden" name="nome" id="nome" value="${p.nome}">
            <input type="hidden" name="sobrenome" id="sobrenome" value="${p.sobrenome}">
            <input type="hidden" name="sexo" id="sexo" value="${p.sexo}">
            <input type="hidden" name="datanascimento" id="datanascimento" value="${p.dataNascimento}">
            <input type="hidden" name="emailOculto" id="emailOculto" value="${p.email}">
            <input type="hidden" name="responsavelOculto" id="responsavelOculto" value="${p.responsavel}">
            <input type="hidden" name="cep" id="cep" value="<%=cep%>">
            
            <jsp:useBean id="listaEndereco" class="br.immunit.dao.EnderecoDAO" />
            <c:forEach var="e" items="<%=listaEndereco.preencheLista(cep)%>">

                <div class="col-sm-5">
                    <label for="endereco">Endereço</label>
                    <input type="text" name="endereco" id="endereco" class="form-control" value="${e.endereco}">
                </div>
                <div class="col-sm-2">
                    <label for="numero">Número</label>
                    <input type="text" name="numero" id="numero" class="form-control" value="${p.numero}">
                </div>
                <div class="col-sm-2" style="padding-right: 0; padding-left: 0; width: 14%;">
                    <label for="complemento">Complemento</label>
                    <input type="text" name="complemento" id="complemento" class="form-control" value="${p.complemento}">
                </div>

            </div>

            <div class="form-group" style="padding-bottom: 10px;">

                <div class="col-sm-4" style="padding-left: 0px;">
                    <label for="bairro">Bairro</label>
                    <input type="text" name="bairro" id="bairro" class="form-control" value="${e.bairro}">
                </div>
                <div class="col-sm-4">
                    <label for="cidade">Cidade</label>
                    <input type="text" name="cidade" id="cidade" class="form-control" value="${e.cidade}">
                </div>
                <div class="col-sm-2" style="padding-right: 0px;">
                    <label for="estado">UF</label>
                    <input type="text" name="estado" id="estado" class="form-control" value="${e.estado}">
                </div>
                <div class="col-sm-2"  style="padding-right: 0px;">
                    <label for="telefone">Telefone</label>
                    <input type="text"  id="telefone" name="telefone" class="form-control" value="${p.telefone}">
                </div>

            </div>
                
        </c:forEach>

        <input type="text" name="enderecoExiste" id="enderecoExiste" value="1" hidden="">

        <div class="form-group" style="padding-top: 10px">
            <div class="pull-right">
                <p><!--Espaço--></p>
                <button type="submit" class="btn btn-default">
                    <span class="glyphicon glyphicon-save"></span> Alterar
                </button>
            </div>
        </div>

    </form>

</c:forEach>  
    
<%@include  file="includes/_footer.jsp" %>