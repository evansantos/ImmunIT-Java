<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%    
    String vacina = "*";
    String login = "LSantos1"; //String login = (String) session.getAttribute("login");
    String card = (String) session.getAttribute("cartaoSUS");
    long cartaoSUS = Long.parseLong(card.replace(".", ""));
%>

<h1 class="page-header">Aplicação de vacina</h1>

<form role="form" method="post" action="pesquisaCartaoSUS.do">     
    <div class="form-group">        
        <div class="col-sm-2" style="padding-left: 0px;"> <!--width: 20.1%;-->
            <label for="cartaoSUS">Cartão SUS</label>
            <input type="text" name="cartaoSUS" id="cartaoSUS" class="form-control" value="<%=card%>">
        </div>
        <div class="col-sm-1" style="padding-top: 25px; padding-left: 0; padding-right: 0; width: 10%; ">
            <button type="submit" class="btn btn-default">
                <span class="glyphicon glyphicon-search"></span> Pesquisa
            </button>
        </div>
        <div class="col-sm-8">
            <label for="paciente">Nome do Paciente</label>
            <jsp:useBean id="p_Paciente" class="br.immunit.dao.PacienteDAO" />
            <c:forEach var="p" items="<%=p_Paciente.buscaPaciente(cartaoSUS)%>">
                <input type="text" name="paciente" id="paciente" class="form-control" value="${p.nome} ${p.sobrenome}" readonly="">
            </c:forEach>
        </div>        
    </div>    
</form>

<div class="clearfix"></div>

<form role="form" method="post" action="cadastraAplicacao.do">
    <div class="form-group" style="padding-top: 10px;">        
        <div class="col-sm-4" style="padding-left: 0px;">
            <label for="vacina">Vacina</label>
            <select id="vacina" name="vacina" class="form-control">
                <jsp:useBean id="l_VacinaControl" class="br.immunit.dao.VacinaDAO" />
                <c:forEach var="v" items="<%=l_VacinaControl.preencheLista(vacina)%>">
                    <option value="${v.codigo}">${v.nome}</option>
                </c:forEach>
            </select>
        </div>                
        <div class="col-sm-2" style="padding-left: 0px;">
            <label for="lote">Lote</label>
            <select id="lote" name="lote" class="form-control">
                <option></option>                
            </select>
        </div> 
        <div class="col-sm-6" style="padding-right: 20px;">
            <label for="funcionario">Nome do Funcionário</label>
            <jsp:useBean id="u_User" class="br.immunit.dao.UserDAO" />
            <c:forEach var="u" items="<%=u_User.buscaUser(login)%>">
                <input type="text" name="funcionario" id="funcionario" class="form-control" value="${u.nome} ${u.sobrenome}" readonly="">
            </c:forEach>
        </div>  
        <div class="col-sm-2 pull-right">
            <button type="submit" class="btn btn-default pull-right" style="margin-top: 25px; margin-left: 0px;">
                <span class="glyphicon glyphicon-save"></span> Salvar
            </button>
        </div>   
    </div>  
</form>       
            
</form>

<%@include  file="includes/_footer.jsp" %>