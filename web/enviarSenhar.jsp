<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><bean:message key="welcome.title"/></title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <html:base/>        
    
        <script type="text/javascript">
            function validar_campo(obj){
                var valor = obj.value;
                //ACEITAR APENAS N�MEROS
                valor=valor.replace(/\D/g,"");
                //CONTROLE DOS DADOS
                valor=valor.replace(/(\d{3})(\d)/,"$1.$2");
                valor=valor.replace(/(\d{3})(\d)/,"$1.$2");
                valor=valor.replace(/(\d{3})(\d{1,2})$/,"$1-$2");
                obj.value = valor;
            }

        </script>

    </head>
    <body style="padding-top: 60px;">
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-12" style="margin-top:10px; text-align: center;">
                            <img src="images/logo.png" />
                        </div>
                </div>                
                <form class="form-signin" role="form" METHOD=POST ACTION="enviaSenha.do">
                    <br><br><br>
                    <div class="row">
                        <div class="col-sm-5 col-md-5 col-lg-5" style="margin-top:10px; text-align: right;">
                            <h4 style="color: #428bca"><b>*Digite seu CPF para o envio da senha:</b></h4>
                        </div>
                        <div class="col-sm-3 col-md-3 col-lg-3" style="margin-top:10px;">
                            <input name="cpf" id="cpf" type="Text" class="form-control"  placeholder="CPF" required="" autofocus="" maxlength="14"
                                   onKeyPress="validar_campo(this);">
                        </div>
                        <div class="col-sm-2 col-md-2 col-lg-2" style="margin-top:10px">
                            <input class="btn  btn-primary btn-block" type="submit" value="Enviar Senha">
                        </div>
                    </div>
                </form>
                <div class="row">
                    <div class="col-sm-2 col-md-2 col-lg-2" style="margin-top:10px; margin-left: 900px ">
                        <a href="index.jsp"><input class="btn btn-primary btn-block" type="submit" value="Voltar">
                    </div>
                </div>
            </div>
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>       
    </body>
    
</html:html>
