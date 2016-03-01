<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>GRUS</title>

    <!-- Bootstrap Core CSS -->
    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheets',file:'bootstrap.css')}" />

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheets',file:'font-awesome.min.css')}" />
    <!-- Plugin CSS -->
    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheets',file:'animate.min.css')}" />
    <!-- Custom CSS -->
    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheets',file:'creative.css')}" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="${assetPath(src: 'ico/easymeeting-ico.png')}">

</head>

<body id="page-top">

<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <g:link class="navbar-brand page-scroll" controller="page" action="index">GRUS</g:link>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a class="page-scroll" >About</a>
                </li>
                <li>
                    <a class="page-scroll" >Documentation</a>
                </li>
                <li>
                    <a class="page-scroll" >Contact</a>
                </li>
                <li>
                    <g:link class="page-scroll" controller="user" action="connect">Connect</g:link>

                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

<header>
    <div class="container" >
        <div class="row" style="margin-top: 100px;">
            <div class="col-md-12" >
                <div class="well" style="background-color: rgba(50, 50, 50, 0.5);">
                    <form class="form-horizontal" method="post">
                        <fieldset>
                            <legend class="text-center header">Contact us</legend>

                            <div class="form-group">
                                <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                                <div class="col-md-8">
                                    <input id="fname" name="name" type="text" placeholder="First Name" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                                <div class="col-md-8">
                                    <input id="lname" name="name" type="text" placeholder="Last Name" class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-envelope-o bigicon"></i></span>
                                <div class="col-md-8">
                                    <input id="email" name="email" type="text" placeholder="Email Address" class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-phone-square bigicon"></i></span>
                                <div class="col-md-8">
                                    <input id="phone" name="phone" type="text" placeholder="Phone" class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-pencil-square-o bigicon"></i></span>
                                <div class="col-md-8">
                                    <textarea class="form-control" id="message" name="message" placeholder="Enter your massage for us here. We will get back to you within 2 business days." rows="7"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12 text-center">
                                    <button type="submit" class="btn btn-primary btn-lg">Submit</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <style>
    .header {
        color: #36A0FF;
        font-size: 27px;
        padding: 10px;
    }

    .bigicon {
        font-size: 35px;
        color: #36A0FF;
    }
    </style>

</header>




<!-- jQuery -->
<script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery-2.2.0.min.js')}"></script>

<!-- Bootstrap Core JavaScript -->
<script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'bootstrap.js')}"></script>

<!-- Plugin JavaScript -->
<script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.easing.min.js')}"></script>
<script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.fittext.js')}"></script>
<script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'wow.min.js')}"></script>

<!-- Custom Theme JavaScript -->
<script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'creative.js')}"></script>

</body>

</html>