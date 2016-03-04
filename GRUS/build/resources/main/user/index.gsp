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
                            <span data-counter="178" data-start="10" data-end="50" data-step="1" data-duration="0">
                            </span></h4>
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
                            <span>215</span></h4>
                        <p class="description">
                            Coming meetings</p>
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
                            <span>215</span></h4>
                        <p class="description">Closed meetings</p>
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
                            <span>128</span></h4>
                        <p class="description">
                            Groups</p>
                        <div class="progress progress-sm mbn">
                            <div role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
                                 style="width: 70%;" class="progress-bar progress-bar-warning">
                                <span class="sr-only">70% Complete (success)</span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--end 4 box-->
        <div class="row mbl">
            <div class="col-lg-12">
                <div class="panel">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-8">
                                <h4 class="mbs">
                                    Network Performance</h4>
                                <p class="help-block">
                                    Sed ut perspiciatis unde omnis iste natus error sit voluptatem...</p>
                                <div id="area-chart-spline" style="width: 100%; height: 300px">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <h4 class="mbm">
                                    Server Status</h4>
                                <span class="task-item">CPU Usage (25 - 32 cpus)<small class="pull-right text-muted">40%</small><div
                                        class="progress progress-sm">
                                    <div role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                                         style="width: 40%;" class="progress-bar progress-bar-orange">
                                        <span class="sr-only">40% Complete (success)</span></div>
                                </div>
                                </span><span>Memory Usage (2.5GB)<small class="pull-right text-muted">60%</small><div
                                    class="progress progress-sm">
                                <div role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                                     style="width: 60%;" class="progress-bar progress-bar-blue">
                                    <span class="sr-only">60% Complete (success)</span></div>
                            </div>
                            </span><span>Disk Usage (C:\ 120GB , D:\ 430GB)<small class="pull-right text-muted">55%</small><div
                                    class="progress progress-sm">
                                <div role="progressbar" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"
                                     style="width: 55%;" class="progress-bar progress-bar-green">
                                    <span class="sr-only">55% Complete (success)</span></div>
                            </div>
                            </span><span>Domain (2/5)<small class="pull-right text-muted">66%</small><div class="progress progress-sm">
                                <div role="progressbar" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"
                                     style="width: 66%;" class="progress-bar progress-bar-yellow">
                                    <span class="sr-only">66% Complete (success)</span></div>
                            </div>
                            </span><span>Database (90/100)<small class="pull-right text-muted">90%</small><div
                                    class="progress progress-sm">
                                <div role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"
                                     style="width: 90%;" class="progress-bar progress-bar-pink">
                                    <span class="sr-only">90% Complete (success)</span></div>
                            </div>
                            </span><span>Email Account (25/50)<small class="pull-right text-muted">50%</small><div
                                    class="progress progress-sm">
                                <div role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"
                                     style="width: 50%;" class="progress-bar progress-bar-violet">
                                    <span class="sr-only">50% Complete (success)</span></div>
                            </div>
                            </span>
                            </div>
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

    //BEGIN CALENDAR
    $("#my-calendar").zabuto_calendar({
        language: "en"
    });
    //END CALENDAR

    //BEGIN TO-DO-LIST
    $('.todo-list').slimScroll({
        "width": '100%',
        "height": '250px',
        "wheelStep": 5
    });
    $( ".sortable" ).sortable();
    $( ".sortable" ).disableSelection();
    //END TO-DO-LIST

    //BEGIN AREA CHART SPLINE
    var d6_1 = [["Jan", 67],["Feb", 91],["Mar", 36],["Apr", 150],["May", 28],["Jun", 123],["Jul", 38]];
    var d6_2 = [["Jan", 59],["Feb", 49],["Mar", 45],["Apr", 94],["May", 76],["Jun", 22],["Jul", 31]];
    $.plot("#area-chart-spline", [{
        data: d6_1,
        label: "Upload",
        color: "#ffce54"
    },{
        data: d6_2,
        label: "Download",
        color: "#01b6ad"
    }], {
        series: {
            lines: {
                show: !1
            },
            splines: {
                show: !0,
                tension: .4,
                lineWidth: 2,
                fill: .8
            },
            points: {
                show: !0,
                radius: 4
            }
        },
        grid: {
            borderColor: "#fafafa",
            borderWidth: 1,
            hoverable: !0
        },
        tooltip: !0,
        tooltipOpts: {
            content: "%x : %y",
            defaultTheme: true
        },
        xaxis: {
            tickColor: "#fafafa",
            mode: "categories"
        },
        yaxis: {
            tickColor: "#fafafa"
        },
        shadowSize: 0
    });
    //END AREA CHART SPLINE

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
    $('.chat-form input#input-chat').on("keypress", function(e){

        var $obj = $(this);
        var $me = $obj.parents('.portlet-body').find('ul.chats');
        
        if (e.which == 13) {
            var content = $obj.val();
            
            if (content !== "") {
                $me.addClass(content);
                var d = new Date();
                var h = d.getHours();
                var m = d.getMinutes();
                if (m < 10) m = "0" + m;
                $obj.val(""); // CLEAR TEXT ON TEXTAREA
                
                var element = ""; 
                element += "<li class='in'>";
                element += "<img class='avatar' src='https://s3.amazonaws.com/uifaces/faces/twitter/kolage/48.jpg'>";
                element += "<div class='message'>";
                element += "<span class='chat-arrow'></span>";
                element += "<a class='chat-name' href='#'>Admin &nbsp;</a>";
                element += "<span class='chat-datetime'>at July 6, 2014" + h + ":" + m + "</span>";
                element += "<span class='chat-body'>" + content + "</span>";
                element += "</div>";
                element += "</li>";
                
                $me.append(element);
                var height = 0;
                $me.find('li').each(function(i, value){
                    height += parseInt($(this).height());
                });

                height += '';
                //alert(height);
                $('.chat-scroller').slimScroll({
                    scrollTo: height
                });
            }
        }
    });
    $('.chat-form span#btn-chat').on("click", function(e){

        e.preventDefault();
        var $obj = $(this).parents('.chat-form').find('input#input-chat');
        var $me = $obj.parents('.portlet-body').find('ul.chats');
        var content = $obj.val();

        if (content !== "") {
            $me.addClass(content);
            var d = new Date();
            var h = d.getHours();
            var m = d.getMinutes();
            if (m < 10) m = "0" + m;
            $obj.val(""); // CLEAR TEXT ON TEXTAREA
            
            var element = ""; 
            element += "<li class='in'>";
            element += "<img class='avatar' src='https://s3.amazonaws.com/uifaces/faces/twitter/kolage/48.jpg'>";
            element += "<div class='message'>";
            element += "<span class='chat-arrow'></span>";
            element += "<a class='chat-name' href='#'>Admin &nbsp;</a>";
            element += "<span class='chat-datetime'>at July 6, 2014" + h + ":" + m + "</span>";
            element += "<span class='chat-body'>" + content + "</span>";
            element += "</div>";
            element += "</li>";
            
            $me.append(element);
            var height = 0;
            $me.find('li').each(function(i, value){
                height += parseInt($(this).height());
            });
            height += '';

            $('.chat-scroller').slimScroll({
                scrollTo: height
            });
        }
        
    });
    //END CHAT FORM

    //BEGIN COUNTER FOR SUMMARY BOX
    counterNum($(".profit h4 span:first-child"), 0, "${publicMeeting}", 1, 30);
    counterNum($(".income h4 span:first-child"), 636, 812, 1, 50);
    counterNum($(".task h4 span:first-child"), 103, 155 , 1, 100);
    counterNum($(".visit h4 span:first-child"), 310, 376, 1, 500);
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