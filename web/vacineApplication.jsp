<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%
    String nome = (String) session.getAttribute("rg"); 
    
    if(nome != null){
    }else{
        nome = "";
    }
%>

<h1 class="page-header">Adicionar vacina</h1>

<form role="form" method="post" action="#"> 
    <div class="form-group">
       <div class="col-sm-5" style="padding-left: 0px;">
            <label for="paciente">
                Nome do paciente
            </label>
            <input type="text" name="paciente" id="paciente" class="form-control" readonly="">
        </div>
        <div class="col-sm-1" style="padding-top: 25px; padding-left: 0; padding-right: 0; width: 11%; ">
            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span> Pesquisa</button>
        </div>
        </div>
        <div class="col-sm-6" style="padding-right: 0px;">
            <label for="vacina">
               Vacina
            </label>
             <select id="vacina" name="vacina" class="form-control">
              <jsp:useBean id="listaU" class="br.immunit.dao.UbsDAO" />
                <c:forEach var="u" items="<%=listaU.listaUBS()%>">
                    <option>${u.nomeFantasia}</option>
                </c:forEach>
            </select>
            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-save"></span> Salvar</button>
        </div>
    </div>

</form>

<%@include  file="includes/_footer.jsp" %>