<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%    
    String loginNome = (String) session.getAttribute("login");
%>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            
            <a class="navbar-brand" href="../ImmunIT/main.jsp">
                <img src="images/logoheader.png" />
            </a>
        </div>
        
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                
                <li><a style="color: #ffffff"><i>Seja bem-vindo
                            
                <jsp:useBean id="nome" class="br.immunit.dao.UserDAO" />
                <c:if test="${!loginNome.equals('Admin')}">
                    <c:forEach var="n" items="<%=nome.buscaUser(loginNome)%>">
                         ${n.nome} ${n.sobrenome}
                    </c:forEach>
                </c:if>
                
                </i></a></li>
                <li><a href="../ImmunIT/loginPassword.jsp">Senha</a></li>
                <li><a href="../ImmunIT/">Log off</a></li>
            </ul>
        </div>
        
    </div>
</div>
