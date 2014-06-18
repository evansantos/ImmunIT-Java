<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br" xml:lang="pt-br">
<head>
    <meta http-equiv="Content-Type" content="text-html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet" media="all">
    <link href="css/style.css" rel="stylesheet" >
        
    <title><bean:message key="welcome.title"/></title>

    <style id="jsbin-css">
        .row label{
            border-bottom: #ccc thin solid;
            width:100%;
        }

        .row .form-control{
            border: 0px;
            box-shadow: inherit !important;
            -webkit-box-shadow: 0px;
            padding-left:0px;
            padding-top:0px;
        }

        .row .well.well-sm label{
            width: auto;
            border:0px;
            font-size:12px;
        }

        .row .well.well-sm .row .col-xs-12 label{
            font-size: 14px;
        }

        .row .well.well-sm span {
            font-size:12px;
        }

        table{
            font-size:12px;
        }

        body{
            padding-top: 0;
            margin-top: -10px;
        }

        @media print {
            .table-bordered td table tbody tr td {
                border: 0px !important
            }

            .media-display {
                display: none;
            }
        }
    </style>
    <html:base />
</head>
<body>

    <%
        String login = (String) session.getAttribute("login");
        String vacina = "";
    %>
    
    <jsp:useBean id="userAdmin" class="br.immunit.dao.LoginDAO" />
    <c:forEach var="ua" items="<%=userAdmin.perfilUser(login)%>">
        <c:if test="${!ua.funcao.equals('Paciente')}">
            <jsp:forward page="main.jsp"></jsp:forward>
        </c:if>
    </c:forEach>

    <div class="container">
        
        <h1 class="page-header">Carteira de vacinação</h1>
        <jsp:useBean id="c_Carterinha" class="br.immunit.dao.PacienteDAO"/>
        <c:forEach var="c" items="<%=c_Carterinha.preencheLista(0, login)%>">
            
            <div class="row">
                <div class="col-xs-8">
                    <label>Nome:</label>
                    <input type="text" class="form-control" value="${c.nome} ${c.sobrenome}"/>  
                </div>
                <div class="col-xs-4">
                    <label>Data de nascimento:</label>
                    <input type="text" class="form-control" value="${c.dataNascimento}"/>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-8">
                    <label>Mãe ou responsavel:</label>
                    <input type="text" class="form-control" value="${c.responsavel}"/> 
                </div>
                <div class="col-xs-4">
                    <label>Telefone:</label>
                    <input type="text" class="form-control" value="${c.telefone}"/>
                </div>
             </div>

             <div class="row">
                <div class="col-xs-12">
                    <label>Endereço:</label>
                    <input type="text" class="form-control" value="${c.endereco}" />
                </div>
             </div>

            <div class="row">
                <div class="col-xs-3">
                    <label>Bairro:</label>
                    <input type="text" class="form-control" value="${c.bairro}"/>
                </div>
                <div class="col-xs-3">
                    <label>Município:</label>
                    <input type="text" class="form-control" value="${c.cidade}"/>
                </div>
                <div class="col-xs-3">
                    <label>CEP:</label>
                    <input type="text" class="form-control" value="${c.cep}"/>
                </div>
                <div class="col-xs-3">
                    <label>GVE:</label>
                    <input type="text" class="form-control" value=""/>
                </div>
            </div>

            <div class="row">                    
                <div class="col-xs-8 pull-left">
                    <div style="height:100px; width: 100%; background-color:#ccc;">
                        <img src="images/Carterinha.png" style="width: 100%; height: 100% ">
                    </div>
                </div>                    
                <div class="col-xs-4 pull-left">
                    <label>Unidade:</label>
                    <input type="text" class="form-control" value=""/>
                </div>                    
                <div class="col-xs-4 pull-left">
                    <label>Codigo:</label>
                    <input type="text" class="form-control" value=""/>
                </div>                    
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <div style="height:10px;"></div>
                </div>
            </div>                
        </c:forEach>
        
        <div class="row">
            <div class="col-xs-12">
                <label>Vacinas</label>
            </div>
        </div>
        
        <jsp:useBean id="a_Aplicacoes" class="br.immunit.dao.AplicacaoDAO"/>
        <div class="row">
                <div class="col-xs-12">
                    <table class="table table-bordered">

                        <thead>
                            <tr>
                                <th class="col-xs-2">BCG (Tuberculose)</th>
                                <th class="col-xs-2">Paralisia Infantil - 1ª Dose</th>
                                <th class="col-xs-2">Penta - 1ª Dose</th>
                                <th class="col-xs-2">Rotavírus - 1ª Dose</th>
                                <th class="col-xs-2">Pneumo 10 - 1ª Dose</th>
                                <th class="col-xs-2">Meningo C - 1ª Dose</th>
                            </tr>
                        </thead> 
                        
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <% vacina = "BCG"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuBCG" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuBCG.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if> 
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Poliomelite Paralisia Infantil - 1 Dose"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <c:set var="preencheuParalisia1" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuParalisia1.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>    
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Penta - 1 Dose"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuPenta1" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuPenta1.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>                                            
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Rotavírus - 1 Dose"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuRotavírus1" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuRotavírus1.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if> 
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Peneumococo Pneumo 10 - 1 Dose"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuPneumo1" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuPneumo1.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Meningo C - 1 Dose"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuMeningo1" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuMeningo1.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                                            
                        <thead>
                            <tr>
                                <th class="col-xs-2">Hepatite B - 1ª Dose</th>
                                <th class="col-xs-2">Paralisia Infantil - 2ª Dose</th>
                                <th class="col-xs-2">Penta - 2ª Dose</th>
                                <th class="col-xs-2">Rotavírus - 2ª Dose</th>
                                <th class="col-xs-2">Pneumo 10 - 2ª Dose</th>
                                <th class="col-xs-2">Meningo C - 2ª Dose</th>
                            </tr>
                        </thead>
                                            
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <% vacina = "Hepatite B - 1 Dose"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuHepatiteB1" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuHepatiteB1.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Poliomelite Paralisia Infantil - 2 Dose"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuParalisia2" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuParalisia2.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Penta - 2 Dose"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuPenta2" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuPenta2.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if> 
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Rotavírus - 2 Dose"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuRotavírus2" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuRotavírus2.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if> 
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Peneumococo Pneumo 10 - 2 Dose"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuPneumo2" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuPneumo2.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Meningo C - 2 Dose"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuMeningo2" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuMeningo2.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                                        
                        <thead>
                            <tr>
                                <th class="col-xs-2">Hepatite B - 2ª Dose</th>
                                <th class="col-xs-2">Paralisia Infantil - 3ª Dose</th>
                                <th class="col-xs-2">Penta - 3ª Dose</th>
                                <th class="col-xs-2">Sarampo/Caxumba/Rubéola</th>
                                <th class="col-xs-2">Pneumo 10 - 3ª Dose</th>
                                <th class="col-xs-2">Meningo C - Reforço</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <% vacina = "Hepatite B - 2 Dose"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuHepatiteB2" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuHepatiteB2.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Poliomelite Paralisia Infantil - 3 Dose"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuParalisia3" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuParalisia3.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Penta - 3 Dose"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuPenta3" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuPenta3.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if> 
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Sarampo/Caxumba/Rubéola"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuSCR" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuSCR.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if> 
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Peneumococo Pneumo 10 - 3 Dose"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuPneumo3" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuPneumo2.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Meningo C - 3 Dose"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuMeningo3" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuMeningo2.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>
                                    </table>
                                </td>
                            </tr>
                        </tbody>

                        <thead>
                            <tr>
                                <th class="col-xs-2">Hepatite B - 3ª Dose</th>
                                <th class="col-xs-2">Paralisia Infantil - 1ª Reforço</th>
                                <th class="col-xs-2">Difteria/Tétano/Coqueluche - 1ª Reforço</th>
                                <th class="col-xs-2">Sarampo/Caxumba/Rubéola + Varicela</th>
                                <th class="col-xs-2">Pneumo 10 - Reforço</th>
                                <th class="col-xs-2">Febre Amarela</th>
                            </tr>
                        </thead>                

                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <% vacina = "Hepatite B - 3 Dose"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuHepatiteB3" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuHepatiteB3.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Paralisia Infantil - 1 Reforço"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuParalisia1Reforco" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuParalisia1Reforco.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Difteria/Tétano/Coqueluche - 1 Reforço"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuDTC1Reforco" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuDTC1Reforco.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Sarampo/Caxumba/Rubéola + Varicela"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuSCRV" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuSCRV.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if> 
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Peneumococo Pneumo 10 - Reforço"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuPneumoReforco" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuPneumoReforco.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if> 
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Febre Amarela"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuFebreAmarela" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuFebreAmarela.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>
                                    </table>
                                </td>                                
                            </tr>
                        </tbody>

                        <thead>
                            <tr>
                                <th class="col-xs-2"></th>
                                <th class="col-xs-2">Paralisia Infantil - 2ª Reforço</th>
                                <th class="col-xs-2">Difteria/Tétano/Coqueluche 2ª Reforço</th>
                                <th class="col-xs-2"></th>
                                <th class="col-xs-2"></th>
                                <th class="col-xs-2"></th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <% vacina = "Hepatite B - 3 Dose"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuHepatiteB3" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuHepatiteB3.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Paralisia Infantil - 2 Reforço"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuParalisia2Reforco" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuParalisia1Reforco.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Difteria/Tétano/Coqueluche - 2 Reforço"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuDTC2Reforco" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuDTC2Reforco.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Sarampo/Caxumba/Rubéola"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuSCR" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuSCR.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if> 
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Peneumococo Pneumo 10 - Reforço"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuPneumoReforco" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuPneumoReforco.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if> 
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <% vacina = "Febre Amarela"; %>
                                        <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                                            <tr><td colspan="2"><b>Data:</b> ${a.dataVacinacao}</td></tr>
                                            <tr><td><b>Lote:</b> ${a.codigoLote}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b> ${a.nomeUsuario}</td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b> ${a.rgUsuario}</td><td style="padding-left: 10px;"></td></tr>  
                                            <c:set var="preencheuFebreAmarela" value="sim"/>
                                        </c:forEach>
                                        <c:if test="${!preencheuFebreAmarela.equals('sim')}">
                                            <tr><td colspan="2"><b>Data:</b> </td></tr>
                                            <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                            <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                        </c:if>
                                    </table>
                                </td>                                
                            </tr>
                        </tbody>

                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <label>Outras vacinas</label>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-2">
                <table class="table table-bordered">
                    
                    <% vacina = "Outros"; %>
                    <c:forEach var="a" items="<%=a_Aplicacoes.preencheCarteirinha(login, vacina)%>">
                        <thead>
                            <tr>
                                <th class="col-xs-2"></th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tr><td colspan="2"><b>Data:</b> </td></tr>
                                        <tr><td><b>Lote:</b></td><td style="padding-left: 10px;"></td></tr>
                                        <tr><td><b>Nome:</b></td><td style="padding-left: 10px;"></td></tr>
                                        <tr><td><b>RG Prof.:</b></td><td style="padding-left: 10px;"></td></tr>
                                    </table>
                                </td>
                            </tr>
                        </tbody> 
                    </c:forEach>
                    
                </table> 
            </div>                    
                    
            <div class="pull-right media-display" style="margin-top:25px;">
                <button class="btn btn-default btn-sm" onclick="this.display = 'none'; window.print()">
                    <span class="glyphicon glyphicon-print"></span> Imprimir
                </button>
                <button class="btn btn-default btn-sm" onclick="this.display = 'none'; window.close()">
                    <span class="glyphicon glyphicon-step-forward"></span> Fechar
                </button>
            </div>                     
        </div> 
                    
    </div>
                    
</body>
</html>
