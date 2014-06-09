<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<%

    long cpf = Long.parseLong("34249309894");

%>

<h1 class="page-header">Carteira de vacinação</h1>
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

</style>

<jsp:useBean id="c_Carterinha" class="br.immunit.dao.PacienteDAO"/>
<c:forEach var="c" items="<%=c_Carterinha.preencheLista(cpf)%>">

    <div class="container">
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

    <div class="row">
        <div class="col-xs-12">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="col-xs-2">BCG (Tuberculose)</th>
                        <th class="col-xs-2">Paralisia Infantil</th>
                        <th class="col-xs-2">Penta</th>
                        <th class="col-xs-2">Rotavírus</th>
                        <th class="col-xs-2">Pneumo 10</th>
                        <th class="col-xs-2">Meningo C</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <th class="col-xs-2">Hepatite B</th>
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
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <th class="col-xs-2"></th>
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
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2">Paralisia Infantil - 1ª Reforço</th>
                        <th class="col-xs-2">Difteria/Tétano/Coqueluche</th>
                        <th class="col-xs-2">Sarampo/Caxumba/Rubéola</th>
                        <th class="col-xs-2">Pneumo 10 - Reforço</th>
                        <th class="col-xs-2">Febre Amarela</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2">Paralisia Infantil - 2º Reforço</th>
                        <th class="col-xs-2">Difteria/Tétano/Coqueluche</th>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
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
        <div class="col-xs-12">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                        <th class="col-xs-2"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr><td colspan="2">Data:</td></tr>
                                <tr>
                                    <td>Lote:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                                <tr>
                                    <td>RG Prof.:</td>
                                    <td style="padding-left: 10px;"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    
</div>

<%@include  file="includes/_footer.jsp" %>