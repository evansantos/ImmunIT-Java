<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/_header.jsp" %> <%-- Incluir sempre header --%>

<h1 class="page-header">UBS</h1>

<table class="table table-striped table-condensed">
    <thead>
        <tr>
            <th>CPF</th>
            <th>Nome</th>
            <th>Sobrenome</th>
            <th>Sexo</th>
            <th>Data de Nascimento</th>
            <th>RG</th>
            <th>Email</th>
            <th>Endereço</th>
            <th>Telefone</th>
            <th>Ramal</th>
            <th>Função</th>
            <th>UBS</th>
            <th>Acesso</th>
            <th style="text-align:right;">
                <a href="userform.jsp">
                    <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-plus"></span> Adicionar</button>
                </a>
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>342.347.091-29</td>
            <td>João Maria </td>
            <td>Ferreira</td>
            <td>Masculino</td>
            <td>24/11/1960</td>
            <td>23.743.293-3 SSP</td>
            <td>jomar.ferreira@uol.com.br</td>
            <td>Rua Carneirinhos, 65</td>
            <td>(12)3124-41238</td>
            <td>R 321</td>
            <td>Enfeirmeiro</td>
            <td>Satelite</td>
            <td><span class="glyphicon glyphicon-ok"></span></td>
            <td style="text-align:right;">
                <div class="btn-group btn-group-sm">
                    <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-lock"></span> Alterar Senha</button>
                    <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
  <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-minus"></span> Excluir</button>
</div>
            </td>
        </tr>
        
    </tbody>
    <tfoot>
        <tr>
            <td colspan="14"></td>
        </tr>
    </tfoot>
</table>

<%@include  file="includes/_footer.jsp" %>
