<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%    
    String login = (String) session.getAttribute("login"); 
%>

<jsp:useBean id="l_sidebarPerfil" class="br.immunit.dao.LoginDAO" />
<c:forEach var="l" items="<%=l_sidebarPerfil.perfilUser(login)%>">

    <div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            
            <c:if test="${l.funcao.equals('Administrador')}">
                <ul class="nav nav-sidebar">
                    <li><a href="ubs.jsp">UBS</a></li>
                    <li><a href="user.jsp">Usuários</a></li>
                    <li><a href="vacine.jsp">Vacinas</a></li>
                </ul>
            </c:if>
            
            <c:if test="${l.funcao.equals('Gerente')}">
                <ul class="nav nav-sidebar">
                    <li><a href="vacineControl.jsp">Controle de vacinas</a></li>
                    <li><a href="vacineReportControl.jsp">Relatório de vacinas</a></li>
                </ul>
            </c:if>
            
            <c:if test="${l.funcao.equals('Funcionário')}">
                <ul class="nav nav-sidebar">
                    <li><a href="patient.jsp">Paciente</a></li>
                    <li><a href="vacineApplication.jsp">Aplicação de vacina</a></li>
                </ul>
            </c:if>
            
            <c:if test="${l.funcao.equals('Paciente')}">
                <ul class="nav nav-sidebar">
                    <li><a href="vacinationCard.jsp">Carterinha de vacinação</a></li>
                </ul>
            </c:if>
        </div>
        
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    
</c:forEach>