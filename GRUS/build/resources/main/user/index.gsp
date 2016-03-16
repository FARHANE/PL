<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="userlayout"/>
    <title>My Profile</title>

    <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheetse',file:'jquery.news-ticker.css')}" />
</head>
<body>

<!--BEGIN TITLE & BREADCRUMB PAGE-->
<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
    <div class="page-header pull-left">
        <div class="page-title">
            Dashboard</div>
    </div>
    <ol class="breadcrumb page-breadcrumb pull-right">
        <li><i class="fa fa-home"></i>&nbsp;<a href="dashboard.html">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
        <li class="hidden"><a href="#">Dashboard</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
        <li class="active">Dashboard</li>
    </ol>
    <div class="clearfix">
    </div>
</div>
<!--END TITLE & BREADCRUMB PAGE-->
<!--BEGIN CONTENT-->
<div class="page-content">
    <div id="tab-general">
        <!-- 4 box -->
        <div id="sum_box" class="row mbl">
            <div class="col-sm-6 col-md-3">
                <div class="panel profit db mbm">
                    <div class="panel-body">
                        <p class="icon"><i class="icon fa fa-comments"></i></p>
                        <h4 class="value">
                            <span>${publicMeeting}</span></h4></h4>
                        <p class="description">Public meeting</p>
                        <div class="progress progress-sm mbn">
                            <div role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
                                 style="width: 80%;" class="progress-bar progress-bar-success">
                                <span class="sr-only">80% Complete (success)</span></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="panel income db mbm">
                    <div class="panel-body">
                        <p class="icon"><i class="icon fa fa-calendar"></i></p>
                        <h4 class="value">
                            <span>${privateMeeting}</span></h4>
                        <p class="description">
                            Private meetings</p>
                        <div class="progress progress-sm mbn">
                            <div role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                                 style="width: 60%;" class="progress-bar progress-bar-info">
                                <span class="sr-only">60% Complete (success)</span></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="panel task db mbm">
                    <div class="panel-body">
                        <p class="icon"><i class="icon fa fa-check"></i></p>
                        <h4 class="value">
                            <span>${finishedMeeting}</span></h4>
                        <p class="description">Finished meetings</p>
                        <div class="progress progress-sm mbn">
                            <div role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"
                                 style="width: 50%;" class="progress-bar progress-bar-danger">
                                <span class="sr-only">50% Complete (success)</span></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="panel visit db mbm">
                    <div class="panel-body">
                        <p class="icon">
                            <i class="icon fa fa-group"></i>
                        </p>
                        <h4 class="value">
                            <span>${userNumber}</span></h4>
                        <p class="description">
                            Number of users</p>
                        <div class="progress progress-sm mbn">
                            <div role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
                                 style="width: 70%;" class="progress-bar progress-bar-warning">
                                <span class="sr-only">70% Complete (success)</span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        

    </div>
</div>
<!--BEGIN FOOTER-->
<div id="footer">
    <div class="copyright">
        <a>2016 © GRUS</a></div>
</div>
<!--END FOOTER-->
<!--END PAGE WRAPPER-->
<content tag="javascripts">

    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery-1.10.2.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'responsive-tabs.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.flot.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.flot.categories.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.flot.pie.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.flot.tooltip.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.flot.resize.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.flot.fillbetween.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.flot.stack.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.flot.spline.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'zabuto_calendar.min.js')}"></script>
    <script type="text/javascript">
        $(function () {

    

    
  

   
    //BEGIN INTRO JS
    $(window).load(function() {
        introJs().start();
    });
    //END INTRO JS

    //BEGIN CHAT FORM
    $('.chat-scroller').slimScroll({
        "width": '100%',
        "height": '270px',
        "wheelStep": 5,
        "scrollTo": "100px"
    });
    
   

    //BEGIN COUNTER FOR SUMMARY BOX
    counterNum($(".profit h4 span:first-child"), 0, "${publicMeeting}", 1, 30);
    counterNum($(".income h4 span:first-child"), 0, "${privateMeeting}", 1, 50);
    counterNum($(".task h4 span:first-child"), 0, "${finishedMeeting}" , 1, 100);
    counterNum($(".visit h4 span:first-child"), 0, "${userNumber}", 1, 500);
    function counterNum(obj, start, end, step, duration) {
        $(obj).html(start);
        setInterval(function(){
            var val = Number($(obj).html());
            if (val < end) {
                $(obj).html(val+step);
            } else {
                clearInterval();
            }
        },duration);
    }
    //END COUNTER FOR SUMMARY BOX

});


    </script>

</content>

</body>
</html>