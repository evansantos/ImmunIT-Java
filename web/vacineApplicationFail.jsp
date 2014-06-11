<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%    
    String vacina = "*";
    String login = "LSantos1"; //String login = (String) session.getAttribute("login");
    String card = (String) session.getAttribute("cartaoSUS");
    String cod = (String) session.getAttribute("codVacina");
    String nome = (String) session.getAttribute("nomeVacina");
    String paciente = (String) session.getAttribute("paciente");
    
    long cartaoSUS = 0;
    if(card != null){
        cartaoSUS = Long.parseLong(card.replace(".", ""));
    }else{
        paciente = "";
    }
    
    int codVacina = 0;
    if(cod != null){
        codVacina = Integer.parseInt(cod);
    }   
    
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
</form>

<form role="form" method="post" action="pesquisaLoteVacinas.do"> 
    
    <div class="col-sm-8" style="width: 73.25%;">
            <label for="paciente">Nome do Paciente</label>
                <input type="text" name="paciente" id="paciente" class="form-control" value="<%=paciente%>" readonly="">
        </div>        
    </div>
        
<div class="clearfix"></div>    
    
    <input type="hidden" name="cartaoSUS" id="cartaoSUS" class="form-control" value="<%=card%>">
    
    <div class="form-group" style="padding-top: 10px;">        
        <div class="col-sm-2" style="padding-left: 0px;">
            <label for="vacina">Vacina</label>
            <select id="vacina" name="vacina" class="form-control">
                <option value="${v.codigo};${v.nome}">${v.nome}</option> 
                <jsp:useBean id="l_VacinaControl" class="br.immunit.dao.VacinaDAO" />
                <c:forEach var="v" items="<%=l_VacinaControl.preencheLista(vacina)%>">
                    <option value="${v.codigo};${v.nome}" ${v.codigo == codVacina ? 'selected="selected"' : ''}>${v.nome}</option>                    
                </c:forEach>
            </select>
        </div>
                
        <div class="col-sm-1"  style="padding-top: 25px; padding-left: 0; padding-right: 0; width: 12%;">
           <button type="submit" class="btn btn-default">
               <span class="glyphicon glyphicon-search"></span> Buscar Lote
           </button>
       </div>       
                
        <input type="hidden" name="codVacina" id="codVacina" class="form-control" value="<%=cod%>">
        <input type="hidden" name="nomeVacina" id="nomeVacina" class="form-control" value="<%=nome%>">
        
        <div class="col-sm-2">
            <label for="lote">Lote</label>
            <select id="lote" name="lote" class="form-control">
                <jsp:useBean id="l_Lote" class="br.immunit.dao.ControleVacinaDAO" />
                <c:forEach var="c" items="<%=l_Lote.preencheLote(codVacina)%>">
                    <option value="${c.codigo}">${c.codigo}</option>  
                </c:forEach>    
            </select>
        </div> 
                
</form>
                
<form role="form" method="post" action="cadastraAplicacao.do">
    
    <!--<input type="hidden" name="cartaoSUSOculto" id="cartaoSUSOculto" class="form-control" value="">-->
        
        <div class="col-sm-6" style="padding-right: 0; width: 53.25%;">
            <label for="funcionario">Nome do Funcionário</label>
            <jsp:useBean id="u_User" class="br.immunit.dao.UserDAO" />
            <c:forEach var="u" items="<%=u_User.buscaUser(login)%>">
                <input type="text" name="funcionario" id="funcionario" class="form-control" value="${u.nome} ${u.sobrenome}" readonly="">
            </c:forEach>
        </div>  
          
    </div> 
            <div class="col-sm-2 pull-right">
            <button type="submit" class="btn btn-default pull-right" style="margin-top: 25px; margin-left: 0px;">
                <span class="glyphicon glyphicon-save"></span> Salvar
            </button>
        </div>
</form>
            
<%@include  file="includes/_footer.jsp" %>