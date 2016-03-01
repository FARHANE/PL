<!DOCTYPE html>
<html lang="en">
<head>
    <title><g:layoutTitle default="Grails"/></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="assets/images/icons/favicon.ico">
    <link rel="apple-touch-icon" href="assets/images/icons/favicon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="assets/images/icons/favicon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="assets/images/icons/favicon-114x114.png">
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
    
    
    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheetse',file:'jquery-custom.min.css')}" />
    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheetse',file:'font-awesome.min.css')}" />
    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheets',file:'bootstrap.min.css')}" />
    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheets',file:'animate.css')}" />
    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheets',file:'all.css')}" />
    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheets',file:'main.css')}" />
    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheets',file:'style-responsive.css.css')}" />
    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheets',file:'zabuto_calendar.min.css')}" />
    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheets',file:'pace.css')}" />
    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheets',file:'jquery.news-ticker.css')}" />
    
    <g:layoutHead/>
</head>
<body>
    <div>
        
        <!--BEGIN BACK TO TOP-->
        <a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
        <!--END BACK TO TOP-->
        <!--BEGIN TOPBAR-->
        <div id="header-topbar-option-demo" class="page-header-topbar">
            <nav id="topbar" role="navigation" style="margin-bottom: 0;" data-step="3" class="navbar navbar-default navbar-static-top">
            <div class="navbar-header">
                <button type="button" data-toggle="collapse" data-target=".sidebar-collapse" class="navbar-toggle"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                <a id="logo" href="index.html" class="navbar-brand"><span class="fa fa-rocket"></span><span class="logo-text">GRUS</span><span style="display: none" class="logo-text-icon">µ</span></a></div>
            <div class="topbar-main"><a id="menu-toggle" href="#" class="hidden-xs"><i class="fa fa-bars"></i></a>
                
                <form id="topbar-search" action="" method="" class="hidden-sm hidden-xs">
                    <div class="input-icon right text-white"><a href="#"><i class="fa fa-search"></i></a><input type="text" placeholder="Search here..." class="form-control text-white"/></div>
                </form>
                
                <ul class="nav navbar navbar-top-links navbar-right mbn">
                    <li class="dropdown"><a data-hover="dropdown" href="#" class="dropdown-toggle"><i class="fa fa-bell fa-fw"></i><span class="badge badge-green">3</span></a>
                        
                    </li>
                    <li class="dropdown"><a data-hover="dropdown" href="#" class="dropdown-toggle"><i class="fa fa-envelope fa-fw"></i><span class="badge badge-orange">7</span></a>
                        
                    </li>
                    <li class="dropdown"><a data-hover="dropdown" href="#" class="dropdown-toggle"><i class="fa fa-tasks fa-fw"></i><span class="badge badge-yellow">8</span></a>
                        
                    </li>
                    <li class="dropdown topbar-user"><a data-hover="dropdown" href="#" class="dropdown-toggle"><img src="/assets/${session.userPicture}" alt="" class="img-responsive img-circle"/>&nbsp;<span class="hidden-xs">${session.username}</span>&nbsp;<span class="caret"></span></a>
                        <ul class="dropdown-menu dropdown-user pull-right">
                            <li><a href="${createLink(controller:'user', action:'profile')}"><i class="fa fa-user"></i>My Profile</a></li>
                            <li><a href="#"><i class="fa fa-calendar"></i>My Calendar</a></li>
                            <li><a href="#"><i class="fa fa-envelope"></i>My Inbox<span class="badge badge-danger">3</span></a></li>
                            <li><a href="#"><i class="fa fa-tasks"></i>My Tasks<span class="badge badge-success">7</span></a></li>
                            <li class="divider"></li>
                            <li><a href="#"><i class="fa fa-lock"></i>Lock Screen</a></li>
                            <li><a href="Login.html"><i class="fa fa-key"></i>Log Out</a></li>
                        </ul>
                    </li>
                    <li id="topbar-chat" class="hidden-xs"><a href="javascript:void(0)" data-step="4" data-intro="&lt;b&gt;Form chat&lt;/b&gt; keep you connecting with other coworker" data-position="left" class="btn-chat"><i class="fa fa-comments"></i><span class="badge badge-info">3</span></a></li>
                </ul>
            </div>
        </nav>
        </div>
        <!--END TOPBAR-->
        <div id="wrapper">
            <!--BEGIN SIDEBAR MENU-->
            <nav id="sidebar" role="navigation" data-step="2" data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
                data-position="right" class="navbar-default navbar-static-side">
            <div class="sidebar-collapse menu-scroll">
                <ul id="side-menu" class="nav">
                    
                     <div class="clearfix"></div>
                     
                    <li><a href="${createLink(controller:'user', action:'dashboard')}"><i class="fa fa-tachometer fa-fw">
                        <div class="icon-bg bg-orange"></div>
                    </i><span class="menu-title">Dashboard</span></a></li>
                  
                    <li><a href="${createLink(controller:'meeting', action:'myMeetings')}"><i class="fa fa-send-o fa-fw">
                        <div class="icon-bg bg-green"></div>
                    </i><span class="menu-title">Meetings</span></a>

                </li>


                    <li><a href="${createLink(controller:'processModel', action:'createProcessModel')}"><i class="fa fa-refresh">
                        <div class="icon-bg bg-blue"></div>
                    </i><span class="menu-title">Process Model</span></a></li>

                    <li><a href="Profile.html"><i class="fa fa-edit fa-fw">
                        <div class="icon-bg bg-grey"></div>
                    </i><span class="menu-title">Profile</span></a></li>


                    <li><a href="Email.html"><i class="fa fa-envelope-o">
                        <div class="icon-bg bg-primary"></div>
                    </i><span class="menu-title">Email</span></a></li>
                    
                    
                </ul>
            </div>
        </nav>
            <!--END SIDEBAR MENU-->
            <div id="page-wrapper">
                <g:layoutBody/>
            </div>
            <!--END PAGE WRAPPER-->
        </div>
    </div>
    
    
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery-2.1.4.min.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery-migrate-1.2.1.min.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery-ui.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'bootstrap.min.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'bootstrap-hover-dropdown.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'html5shiv.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'respond.min.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.metisMenu.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.slimscroll.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.cookie.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'custom.min.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.menu.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'holder.js')}"></script>



	<g:pageProperty name="page.javascripts"/>
    <!--CORE JAVASCRIPT-->
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'main.js')}"></script>
     
    <script>        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-145464-12', 'auto');
        ga('send', 'pageview');
    </script>
    
</body>
</html>
	