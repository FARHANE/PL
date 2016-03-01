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
                    <g:link class="page-scroll" controller="page" action="contact">Contact</g:link>
                </li>
                <li>
                    <g:link class="page-scroll" controller="user" action="index"> Connect </g:link>

                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

<header>
    <div class="header-content">
        <div class="header-content-inner">
            <h1>GRUS The easiest way to make a meeting</h1>
            <hr>
            <p>GRUS is a simple, comfortable and free solution for your meetings. With this tool, you will be able to make

            Efficient, Productive and Collaborative meetings.</p>
            <a href="#about" class="btn btn-primary btn-xl page-scroll">Find Out More</a>
        </div>
    </div>
</header>

<section class="bg-primary" id="about">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center">
                <h2 class="section-heading">We've got what you need!</h2>
                <hr class="light">
                <p class="text-faded">GRUS Project is a collaborative tool that helps groups to make decisions.</p>
                <a href="#" class="btn btn-default btn-xl">Get Started!</a>
            </div>
        </div>
    </div>
</section>

<section id="services">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">At Your Service</h2>
                <hr class="primary">
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box">
                    <img src="${createLinkTo(dir:'images',file:'creative.png')}" alt="brainstorm" />
                    <h3>BrainStorm</h3>
                    <p class="text-muted">Generating creative ideas and solutions through intensive and freewheeling group discussion.</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box">
                    <img src="${createLinkTo(dir:'images',file:'vote.png')}" alt="voting" />
                    <h3>Voting</h3>
                    <p class="text-muted">Voting is a method for a group such as a meeting or an electorate to make a decision or express an opinion.</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box">
                    <img src="${createLinkTo(dir:'images',file:'consensus.png')}" alt="consensus" />
                    <h3>Consensus</h3>
                    <p class="text-muted">Consensus is the community resolution when opposing parties set aside their differences and agree on a statement that is agreeable to all, even if only barely.</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box">
                    <img src="${createLinkTo(dir:'images',file:'tools.png')}" alt="tools" />
                    <h3>Other </h3>
                    <p class="text-muted">There is other tools at your service</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="no-padding" id="portfolio">
    <div class="container-fluid">
        <div class="row no-gutter">
            <div class="col-lg-4 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img class="img-responsive" src="${assetPath(src: 'portfolio/1.jpg')}"/>
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                YOU HAVE
                            </div>
                            <div class="project-name">
                                Several meeting at the same time
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img class="img-responsive" src="${assetPath(src: 'portfolio/2.jpg')}"/>
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                YOU HAVE
                            </div>
                            <div class="project-name">
                                Sevaral ideas in your team
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img class="img-responsive" src="${assetPath(src: 'portfolio/3.jpg')}"/>
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                YOU HAVE
                            </div>
                            <div class="project-name">
                                A large team
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img class="img-responsive" src="${assetPath(src: 'portfolio/4.jpg')}"/>
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                YOU WANT
                            </div>
                            <div class="project-name">
                                A constant communication
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img class="img-responsive" src="${assetPath(src: 'portfolio/5.jpg')}"/>
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                YOU WANT
                            </div>
                            <div class="project-name">
                                More flexibility
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a href="#" class="portfolio-box">
                    <img class="img-responsive" src="${assetPath(src: 'portfolio/6.jpg')}"/>
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                YOU WANT
                            </div>
                            <div class="project-name">
                                Better team work
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>

<aside class="bg-dark">
    <div class="container text-center">
        <div class="call-to-action">
            <h2>Join the GRUS community</h2>
            <h3>an open source platform</h3>
        </div>
    </div>
</aside>

<section id="contact">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center">
                <h2 class="section-heading">Let's Get In Touch!</h2>
                <hr class="primary">
                <p>If you need more informations, Give us a call or send us an email and we will get back to you as soon as possible!</p>
            </div>
            <div class="col-lg-4 col-lg-offset-2 text-center">
                <i class="fa fa-phone fa-3x wow bounceIn"></i>
                <p>123-456-6789</p>
            </div>
            <div class="col-lg-4 text-center">
                <i class="fa fa-envelope-o fa-3x wow bounceIn" data-wow-delay=".1s"></i>
                <p><a href="mailto:contact@grus.com">contact@grus.com</a></p>
            </div>
        </div>
    </div>
</section>

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