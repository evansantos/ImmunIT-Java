<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <meta charset="utf-8">
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
    </head>
    <body style="padding-top: 60px;">
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-12" style="margin-top:10px; text-align: center;">
                            <img src="images/logo.png" />
                        </div>
                </div>
                <form class="form-signin" role="form">
                    <h2 class="form-signin-heading">Login:</h2>
                    <div class="row">
                        <div class="col-sm-6 col-md-6 col-lg-6" style="margin-top:10px">
                            <input type="email" class="form-control " placeholder="Email address" required="" autofocus="">
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-6" style="margin-top:10px">
                            <input type="password" class="form-control" placeholder="Password" required="">
                        </div>
                        <div class="col-sm-12 col-md-12 col-lg-12" style="margin-top:10px">
                            <button class="btn btn-lg btn-primary btn-block" type="submit">login</button>  
                        </div>
                    </div>
                </form>

            </div>
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html:html>
