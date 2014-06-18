<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@include file="includes/_header.jsp" %>

<%      
    session.removeAttribute("cartaoSUS");
    session.removeAttribute("cpf");
    session.removeAttribute("rg");
    session.removeAttribute("nome");
    session.removeAttribute("sobrenome");
    session.removeAttribute("sexo");
    session.removeAttribute("datanascimento");
    session.removeAttribute("email");
    session.removeAttribute("responsavel");
    session.removeAttribute("cep");

    String nome = (String) session.getAttribute("pesquisaPaciente");    
    String login = (String) session.getAttribute("login");
%>

<jsp:useBean id="userAdmin" class="br.immunit.dao.LoginDAO" />
<c:if test="${!login.equals('Admin')}" >
    <c:forEach var="ua" items="<%=userAdmin.perfilUser(login)%>">
        <c:if test="${!ua.funcao.equals('Funcionário')}">
            <jsp:forward page="main.jsp"></jsp:forward>
        </c:if>
    </c:forEach>
</c:if>

<h1 class="page-header">Paciente</h1>

<form method="post" action="pesquisaPaciente.do">
    <div class="form-group">
        <div class="col-sm-2" style="padding-left: 0;">
            <label>Buscar Paciente</label>
            <input type="text" name="pesquisaPaciente" id="pesquisaPaciente" class="form-control">
        </div>
        <div class="col-sm-2" style="padding-top: 25px; padding-left: 0">
            <button type="submit" class="btn btn-default">
                <span class="glyphicon glyphicon-search"></span> Pesquisar
            </button>
        </div>
    </div>
</form>
    
<table class="table table-striped">
    <thead>
        <tr>
            <th>Cartão SUS</th>
            <th>Nome</th>
            <th>Sobrenome</th>
            <th>Data de nascimento</th>
            <th>Responsável</th>
            <th>Telefone</th>
            <th style="text-align:right;">
                <a href="patientform.jsp">
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="glyphicon glyphicon-plus"></span> Adicionar
                    </button>
                </a>
            </th>
        </tr>
    </thead>
    <tbody>
        <jsp:useBean id="l_PatientSuccess" class="br.immunit.dao.PacienteDAO" />
        <c:forEach var="p" items="<%=l_PatientSuccess.preencheListaNome(nome)%>">
            <tr>
                <td>${p.cartaoSUS}</td>
                <td>${p.nome}</td>
                <td>${p.sobrenome}</td>
                <td>${p.dataNascimento}</td>
                <td>${p.responsavel}</td>
                <td>${p.telefone}</td>
                
                <td style="text-align:right;">
                    <div class="btn-group btn-group-sm">
                        <form method="post" action="editaPaciente.do">
                            <button type="submit" class="btn btn-default btn-sm">
                                <span class="glyphicon glyphicon-pencil"></span> Editar
                            </button>
                            <input type="hidden" name="cpf" class="form-control" value="${p.cpf}">
                        </form>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="8"></td>
        </tr>
    </tfoot>
</table>

<%@include  file="includes/_footer.jsp" %>
