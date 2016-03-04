<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="userlayout"/>
        <title>Consensus</title>
        
        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheetse',file:'jquery.news-ticker.css')}" />
    </head>
    <body>
        
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">
                            Consensus</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb pull-right">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="dashboard.html">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="hidden"><a href="#">Tool</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">Consensus</li>
                    </ol>
                    <div class="clearfix">
                    </div>
                </div>
                
                <!--END TITLE & BREADCRUMB PAGE-->
                <div class="page-content">
                    <div id="tab-general">
                        <div class="row mbl">
                            <div class="col-lg-12">
                                <div class="col-md-12">
                                    <div id="area-chart-spline" style="width: 100%; height: 300px; display: none;">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="row">
                                    
                                    <div class="col-md-12">
                                        <div class="panel panel-blue">
                                            <div class="panel-heading">
                                                <i class="fa fa-bar-chart"></i>&nbsp;&nbsp;Consensus
                                            </div>
                                        <div class="panel-body pan row" >
                                            
                                            <g:each var="data" in="${voting.data}">
                                            <div class="col-md-6" style="padding-top:20px;">
                                                <div class="portlet box">
                                                    <div class="portlet-header">
                                                        <div class="caption">${data.field}</div>
                                                    </div>
                                                    <div class="portlet-body">
                                                        <div id="${data.field}" style="width: 100%; height:300px"></div>
                                                    </div>
                                                </div>
                                               
                                            </div><!--end form-->
                                            </g:each>
                                           
                                                

                                        </div>
                                        </div>
                                        <g:if test="${isFacilitator == true}"> 
                                                    
                                                    <button id="nextStep" class="btn btn-success" style="width:100%">Next Step</button>
                                                    </g:if>
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
   


    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.news-ticker.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.menu.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'pace.min.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'holder.js')}"></script>




    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.slimscroll.js')}"></script>

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
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'index.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'highcharts.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'data.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'drilldown.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'exporting.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'highcharts-more.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'charts-highchart-pie.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'charts-highchart-more.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'charts-flotchart.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'main.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'loader.js')}"></script>
    
    <script src="/assets/websockets/application.js" type="text/javascript"></script>

    
    <asset:javascript src="spring-websocket" />
    

    <script type="text/javascript">

        $(document).ready(function(){

            google.charts.load('current', {'packages':['bar']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
            var options = {
             
            };
            var chart = null
            <g:each var="chart" in="${charts}">
            var dataOf${chart.first().first()} = google.visualization.arrayToDataTable([
                        <g:each var="line" in="${chart}" status="i">
                        <g:if test="${i == 0}">
                            ["${line[0]}","${line[1]}" ,{ role: 'style' }],
                        </g:if>
                        <g:else>
                        ["${line[0]}",${line[1]} ,"${line[2]}"],
                        </g:else>
                         
                    </g:each>
              ]);
            chart = new google.charts.Bar(document.getElementById('${chart.first().first()}')); 
            chart.draw(dataOf${chart.first().first()}, options);
            </g:each>
             
          }


          //websocket
          var socket = new SockJS("${createLink(uri: '/stomp')}");
          var client = Stomp.over(socket);
          client.connect({}, function() {
                client.subscribe("/user/queue/consensusNextStep", function(message) {
                        var href = JSON.parse(JSON.parse(message.body));
                        $(location).attr('href', href.location);
                    });
                
            });
        $('#nextStep').click(function(){

                    var href = "${voting.id}";
                    client.send("/app/consensusNextStep", {}, JSON.stringify(href));
                });

        });
        
    </script>
    </content>
   
    </body>
</html>