<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%    
    String cpf = (String) session.getAttribute("cpf");
    String cep = (String) session.getAttribute("cep");
    long u_Cpf = Long.parseLong(cpf);
%>

<jsp:useBean id="l_UserFormEditFail" class="br.immunit.dao.UserDAO" />
<c:forEach var="u" items="<%=l_UserFormEditFail.preencheLista(u_Cpf)%>">

    <h1 class="page-header">Editar Usuário</h1>

    <form role="form" method="post" action="enderecoUserEdit.do">

        <div class="form-group">

            <div class="col-sm-6" style="padding-left: 0px;">
                <label for="cpf">CPF</label>
                <input type="text" name="cpf" id="cpf" class="form-control" value="${u.cpf}" readonly="">
            </div>
            <div class="col-sm-6" style="padding-right: 0px;">
                <label for="rg">RG </label>
                <input type="text" name="rg" id="rg" class="form-control" value="${u.rg}" readonly="">
            </div>

        </div>

        <div class="clearfix"></div>

        <div class="form-group" style="padding-top: 10px;">

            <div class="col-sm-6" style="padding-left: 0px;">
                <label for="nome">Nome</label>
                <input type="text" name="nome" id="nome" class="form-control" value="${u.nome}" readonly="">
            </div>
            <div class="col-sm-6" style="padding-right: 0px;">
                <label for="sobrenome">Sobrenome</label>
                <input type="text" name="sobrenome" id="sobrenome" class="form-control" value="${u.sobrenome}" readonly="">
            </div>

        </div>

        <div class="clearfix"></div>

        <div class="form-group" style="padding-top: 10px;">

            <div class="col-sm-3" style="padding-left: 0px;">
                <label>Sexo </label>
                <div class="clearfix"></div>

                <c:if test="${u.sexo.equals('F')}">
                    <div class="radio-inline" readonly="">
                        <label><input type="radio" name="sexo" id="sexo1" value="F" disabled="" checked>Feminino</label>
                    </div>
                    <div class="radio-inline" readonly=""> 
                        <label><input type="radio" name="sexo" id="sexo2" value="M" disabled="">Masculino</label>
                    </div>
                </c:if>
                <c:if test="${u.sexo.equals('M')}">
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
                <input type="text" name="datanascimento" id="datanascimento" class="form-control" value="${u.dataNascimento}" readonly="">
            </div>
            <div class="col-sm-6" style="padding-right: 0px;"> 
                <label for="email">E-mail</label>
                <input type="text" name="email" id="email" class="form-control" value="${u.email}">
            </div>
        </div>

        <div class="clearfix"></div>
        
        <div class="form-group" style="padding-top: 10px;">

            <div class="col-sm-2" style="padding-left: 0px;">
                <label for="cep">CEP</label>
                <input type="text" name="cep" id="cep" class="form-control" value="<%=cep%>">
            </div>
            <div class="col-sm-1" style="padding-top: 25px; padding-left: 0; padding-right: 0; width: 11%; ">
                <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span> Pesquisa</button>
            </div>
                    
    </form>     
                
    <form role="form" method="post" action="UserEditaCadastroControl.do">                

        <input type="hidden" name="cpf" id="cpf" class="form-control" value="${u.cpf}">
        <input type="hidden" name="emailOculto" id="emailOculto" class="form-control" value="${u.email}">
        <input type="hidden" name="cep" id="cep" class="form-control" value="<%=cep%>">
        
        
            <div class="col-sm-5">
                <label for="endereco">Endereço</label>
                <input type="text" name="endereco" id="endereco" class="form-control">
            </div>
            <div class="col-sm-2">
                <label for="numero">Número</label>
                <input type="text" name="numero" id="numero" class="form-control" value="">
            </div>
            <div class="col-sm-2" style="padding-right: 0; padding-left: 0; width: 14%;">
                <label for="complemento">Complemento</label>
                <input type="text" name="complemento" id="complemento" class="form-control" value="">
            </div>
        </div>

        <div class="clearfix"></div>
        <div class="form-group"  style="padding-top: 10px">

            <div class="col-sm-5" style="padding-left: 0px;">
                <label for="bairro">Bairro</label>
                <input type="text" name="bairro" id="bairro" class="form-control">
            </div>
            <div class="col-sm-5">
                <label for="cidade">Cidade</label>
                <input type="text" name="cidade" id="cidade" class="form-control">
            </div>            
            <div class="col-sm-2" style="padding-right: 0px;">
                <label for="estado">UF</label>
                <input type="text" name="estado" id="estado" class="form-control">
            </div>

        </div>

        <div class="clearfix"></div>

        <div class="form-group" style="padding-top: 10px">

            <div class="col-sm-3" style="padding-left: 0;">
                <label for="telefone">Telefone</label>
                <input type="text" name="telefone" id="telefone" class="form-control" value="${u.telefone}"/>
            </div>
            <div class="col-sm-2">
                <label for="ramal">ramal</label>
                <input type="text" name="ramal" id="ramal" class="form-control" value="${u.ramal}"/>
            </div>
            <div class="col-sm-4" style="padding-right: 0px;">
                <label for="funcao">Função</label>
                <select id="funcao" name="funcao" class="form-control">
                    <jsp:useBean id="listaF" class="br.immunit.dao.FuncaoDAO" />
                    <c:forEach var="f" items="<%=listaF.preencheLista()%>">
                        <option>${f.funcao}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-sm-3" style="padding-right: 0px;">
                <label for="ubs">UBS</label>
                <select id="ubs" name="ubs" class="form-control">
                    <jsp:useBean id="listaU" class="br.immunit.dao.UbsDAO" />
                    <c:forEach var="u" items="<%=listaU.listaUBS()%>">
                        <option>${u.nomeFantasia}</option>
                    </c:forEach>
                </select>
            </div>
                    
        </div>

        <div class="clearfix"></div>

        <input type="text" name="enderecoExiste" id="enderecoExiste" value="0" hidden="">
        
        <div class="form-group" style="padding-top: 10px">
            <div class="pull-right">
                    <button type="submit" class="btn btn-default">
                        <span class="glyphicon glyphicon-save"></span> Alterar
                    </button>
            </div>
        </div>

    </form>
        
</c:forEach>
        
<%@include  file="includes/_footer.jsp" %>