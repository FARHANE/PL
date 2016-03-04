<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GRUS Login &amp; Register Forms</title>

    <!-- CSS -->

    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheets',file:'bootstrap.min.css')}" />
    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheets',file:'font-awesome.min.css')}" />
    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheets',file:'form-elements.css')}" />
    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheets',file:'style.css')}" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="assets/images/ico/easymeeting-ico.png">

</head>

<body>

<!-- Top content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">

            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>GRUS</strong> Login &amp; Register Forms</h1>
                    <div class="description">

                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-5">

                    <div class="form-box">
                        <div class="form-top">
                            <div class="form-top-left">
                                <h3>Login to GRUS</h3>
                                <p>Enter username and password to log on:</p>
                            </div>
                            <div class="form-top-right">
                                <i class="fa fa-key"></i>
                            </div>
                        </div>
                        <div class="form-bottom">
                            <g:if test='${flash.message}'>
                                <div class="alert alert-danger"><strong>Ooops!</strong> ${flash.message}</div>

                            </g:if>
                            <g:form name="loginForm" url="[controller:'login',action:'authenticate']">
                                <div class="form-group">
                                    <label class="sr-only" for="username">Username</label>
                                    <g:textField id="username" name="username" class="form-control" placeholder="Username" required="true" />
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="password">Password</label>
                                    <g:passwordField id="password" name="password" class="form-control" placeholder="Password" required="true" />
                                </div>
                                <g:actionSubmit name="signin" class="btn sign" type="submit" value="Sign in" controller="user" action="login"/>
                            </g:form>
                        </div>
                    </div>

                    

                </div>

                <div class="col-sm-1 middle-border"></div>
                <div class="col-sm-1"></div>

                <div class="col-sm-5">

                    <div class="form-box">
                        <div class="form-top">
                            <div class="form-top-left">
                                <h3>Sign up now</h3>
                                <p>Fill in the form below to get instant access:</p>
                            </div>
                            <div class="form-top-right">
                                <i class="fa fa-pencil"></i>
                            </div>
                        </div>
                        <div class="form-bottom">
                            <g:form name="signUp" url="[controller:'user',action:'signUp']">
                                <div class="form-group">
                                    <label class="sr-only" for="username">Username</label>
                                    <g:textField  name="username" class="form-control" placeholder="Username * " required="true" />
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="password">Password *</label>
                                    <g:passwordField  name="password" class="form-control" type="password" placeholder="Password * " required="true" />
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="passwordConfirmation">Password</label>
                                    <g:passwordField name="passwordConfirmation" type="password" class="form-control" placeholder="Password confirmation * " required="true" />
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="lastName">Last name</label>
                                    <g:textField id="lastName" name="lastName" class="form-control" placeholder="Last name" />
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="firstName">First name</label>
                                    <g:textField id="firstName" name="firstName" class="form-control" placeholder="First name"  />
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="email">Email</label>
                                    <g:textField id="email" name="email" class="form-control" placeholder="Email"  />
                                </div>
                                
                                <g:actionSubmit name="signup" class="btn sign" type="submit" value="Sign up" controller="user" action="signUp"/>
                            </g:form>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>

</div>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">

            <div class="col-sm-8 col-sm-offset-2">
                <div class="footer-border"></div>

            </div>

        </div>
    </div>
</footer>

<!-- Javascript -->

<script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery-2.2.0.min.js')}"></script>
<script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'bootstrap.js')}"></script>
<script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'newAccount.js')}"></script>



</body>

</html>
