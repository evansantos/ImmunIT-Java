<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%    
    String login = (String) session.getAttribute("login"); 
%>

<jsp:useBean id="lista" class="br.immunit.dao.LoginDAO" />
<c:forEach var="l" items="<%=lista.perfilUser(login)%>">

    <div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar"><!-- Administrador -->
            
            <c:if test="${l.funcao.equals('Administrador')}">
                <ul class="nav nav-sidebar">
                    <li><a href="ubs.jsp">UBS</a></li>
                    <li><a href="user.jsp">Usuários</a></li>
                    <li><a href="vacine.jsp">Vacinas</a></li>
                </ul>
            </c:if>
            
            <c:if test="${l.funcao.equals('Gerente')}">
                <ul class="nav nav-sidebar"><!-- gerencia -->
                    <li><a href="vacineControl.jsp">Controle de vacinas</a></li>
                    <li><a href="#" onclick="callReport()">Relatório de vacinas</a></li>
                    <!--<li><a href="">One more nav</a></li>
                    <li><a href="">Another nav item</a></li>
                    <li><a href="">More navigation</a></li>-->
                </ul>
            </c:if>
            
            <c:if test="${l.funcao.equals('Funcionário')}">
                <ul class="nav nav-sidebar"><!-- Funcionário -->
                    <li><a href="patient.jsp">Paciente</a></li>
                    <!--<li><a href="">One more nav</a></li>
                    <li><a href="">Another nav item</a></li>
                    <li><a href="">More navigation</a></li>-->
                </ul>
            </c:if>
            <!--<ul class="nav nav-sidebar">--><!-- usuario/paciente -->
            <!--<li><a href="">Nav item again</a></li>
                <li><a href="">One more nav</a></li>
                <li><a href="">Another nav item</a></li>
            </ul>-->
        </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    
</c:forEach>