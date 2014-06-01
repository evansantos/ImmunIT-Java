<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%    
    String cpf = (String) session.getAttribute("pesquisaPaciente");    
    long p_Cpf = Long.parseLong(cpf);
%>

<jsp:useBean id="l_PatientSuccess" class="br.immunit.dao.PacienteDAO" />
<c:forEach var="p" items="<%=l_PatientSuccess.preencheLista(p_Cpf)%>">

    <h1 class="page-header">Paciente</h1>

    <form method="post" action="pesquisaPaciente.do">
        <div class="form-group">
            <div class="col-sm-2" style="padding-left: 0;">
                <label>Buscar Paciente</label>
                <input type="text" name="pesquisaPaciente" id="pesquisaPaciente" class="form-control">
            </div>
            <div class="col-sm-2" style="padding-top: 25px; padding-left: 0">
                <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span> Pesquisar</button>
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
                        <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-plus"></span> Adicionar</button>
                    </a>
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>${p.cartaoSUS}</td>
                <td>${p.nome}</td>
                <td>${p.sobrenome}</td>
                <td>${p.dataNascimento}</td>
                <td>${p.responsavel}</td>
                <td>${p.telefone}</td>
                <td style="text-align:right;">
                    <div class="btn-group btn-group-sm">
                        <a href="patientformEdit.jsp">
                            <button type="submit" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
                        </a>
                    </div>
                </td>
            </tr>

        </tbody>
        <tfoot>
            <tr>
                <td colspan="8"></td>
            </tr>
        </tfoot>
    </table>

</c:forEach>

<%@include  file="includes/_footer.jsp" %>
