<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%    
    String cnes = (String) session.getAttribute("pesquisaUBS");    
    int u_Cnes = Integer.parseInt(cnes);
%>

<jsp:useBean id="l_UbsFormEdit" class="br.immunit.dao.UbsDAO" />
<c:forEach var="u" items="<%=l_UbsFormEdit.preencheLista(u_Cnes)%>">                  

    <h1 class="page-header">Editar UBS</h1>

    <form method="post" action="editaUbs.do">

        <div class="form-group">
            <label for="cnes">CNES</label>
            <input type="text" name="cnes" class="form-control" value="${u.cnes}" readonly="">
        </div>

        <div class="form-group">
            <label for="nomefantasia">Nome Fantasia</label>
            <input type="text" name="nomefantasia" id="nomefantasia" class="form-control" value="${u.nomeFantasia}">
        </div>

        <div class="form-group">
            <label for="razaosocial">Razão Social</label>
            <input type="text" name="razaosocial" id="razaosocial" class="form-control" value="${u.razaoSocial}" >
        </div>

        <div class="form-group" style="padding-bottom: 10px;"> 

            <div class="col-sm-2" style="padding-left: 0px;">
                <label for="telefone">Telefone</label>
                <input type="text" name="telefone" id="telefone" class="form-control" value="${u.telefone}">
            </div>
            
            <div class="col-sm-2" style="padding-left: 0px;">
                <label for="cep">CEP</label>
                <input type="text" name="cep" id="cep" class="form-control" value="${u.cep}" readonly="">
            </div> 
  
            <div class="col-sm-6" >
                <label for="endereco">Endereço</label>
                <input type="text" name="endereco" id="endereco" class="form-control" value="${u.endereco}" readonly="">
            </div>

            <div class="col-sm-2" style="padding-right: 0">
                <label for="numero">Número</label>
                <input type="text" name="numero" id="numero" class="form-control" value="${u.numero}" readonly="">
            </div>
        </div>

        <div class="form-group" style="padding-bottom: 10px;">
            <div class="col-sm-4" style="padding-left: 0px;">
                <label for="bairro">Bairro</label>
                <input type="text" name="bairro" id="bairro" class="form-control" value="${u.bairro}" readonly="">
            </div>

            <div class="col-sm-4">
                <label for="cidade">Cidade</label>
                <input type="text" name="cidade" id="cidade" class="form-control" value="${u.cidade}" readonly=""> 
            </div>

            <div class="col-sm-2" style="padding-right: 0px;">
                <label for="estado">UF</label>
                <input type="text" name="estado" id="estado" class="form-control" value="${u.estado}" readonly="">
            </div>

            <div class="col-sm-2" style="padding-right: 0px; padding-top: 38px; padding-left: 35px;">
                <label for="ativo">Ativo?</label>
                <c:if test="${u.ativo == true}"><input type="checkbox" name="ativo" id="ativo" checked=""></c:if>
                <c:if test="${u.ativo != true}"><input type="checkbox" name="ativo" id="ativo" ></c:if>
            </div>
        </div>

        <div class="pull-right">
            <button type="submit" class="btn btn-default">
                <span class="glyphicon glyphicon-save"></span> Alterar
            </button>
        </div>
            
    </form>
                    
</c:forEach>
    
<%@include  file="includes/_footer.jsp" %>