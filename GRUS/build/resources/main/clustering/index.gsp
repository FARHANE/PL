<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="userlayout"/>
        <title>Clustering</title>
        
        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheetse',file:'jquery.news-ticker.css')}" />
    </head>
    <body>
        
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">
                            Clustering</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb pull-right">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="dashboard.html">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="hidden"><a href="#">Tool</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">Clustering</li>
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
                                        <div class="panel panel-green">
                                            <div class="panel-heading">
                                                <i class="fa fa-filter"></i>&nbsp;&nbsp;Clustering
                                            </div>
                                        <div class="panel-body pan row" >
                                            <g:if test="${isFacilitator == true}">
                                                <div class="col-md-4" style="padding-top:20px;">
                                                    <div class="panel panel-pink">
                                                        <div class="panel-heading">
                                                            Add Cluster
                                                        </div>
                                                        <div class="panel-body pan">
                                                            <g:form name="addClusterForm" url="[controller:'cluster',action:'saveCluster']">
                                                                <div class="form-body pal">
                                                                    <div class="form-group">
                                                                        <div class="input-icon right">
                                                                            <i class="fa fa-wrench"></i>
                                                                            
                                                                            <g:textField id="cluster" name="cluster" class="form-control" placeholder="Cluster name" required="true" />
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    
                                                                </div>
                                                                <div class="form-actions text-right pal">
                                                                    <button id="addClusterBtn"type="button" class="btn btn-primary">
                                                                        Add Cluster</button>
                                                                </div>
                                                            </g:form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </g:if>
                                            <!--end form-->
                                           <!--start table cluster-->

                                                <div class="col-md-8" style="padding-top:20px;">

                                                    <div class="panel panel-red">
                                                        <div class="panel-heading">Ideas</div>
                                                            <div class="panel-body">
                                                            <table class="table table-hover table-condensed">
                                                                <thead>
                                                                <tr>
                                                                    
                                                                    <th>Username</th>
                                                                    <th>Idea</th>
                                                                    <th>Created</th>
                                                                    <th>Cluster</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody id="listIdeas">
                                                                    <g:each var="idea" in="${data}">
                                                                    <tr>
                                                                        
                                                                        <g:if test="${idea.author == null}">
                                                                            <td>Anonym</td>
                                                                        </g:if>
                                                                        <g:else>
                                                                        <td>${idea.author.username}</td>

                                                                        </g:else>
                                                                        <td>${idea.field}</td>
                                                                        <td><span class='label label-sm label-success'>${idea.created.format('dd/MM/yyyy HH:mm:ss')}</span></td>
                                                                        <td>
                                                                            <g:if test="${isFacilitator == true}"> 
                                                                            <select class="clusterList" style="width:100px;" id="${idea.id}" name="${idea.id}">
                                                                                <g:each var="cluster" in="${clusters}">
                                                                                    <option value="${cluster.id}">${cluster.field}</option>
                                                                                </g:each>
                                                                            </select>

                                                                            </g:if>
                                                                            <g:else>
                                                                            <span class="view" id = "${idea.id}"></span>
                                                                            </g:else>
                                                                        </td>
                                                                    </tr>
                                                                    </g:each>
                                                                
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <g:if test="${isFacilitator == true}"> 
                                                    <p>
                                                    <button id="saveClusters" class="btn btn-info">Commit</button>

                                                    </p>
                                                    <button id="nextStep" class="btn btn-success" style="width:100%">Next Step</button>
                                                    </g:if>
                                                
                                                </div>
                                                <g:if test="${isFacilitator == false}"> 
                                                    <div class="col-md-4" style="padding-top:20px;">
                                                        <div id="availableClusters"class="list-group">
                                                            <span class="list-group-item active" style="color:#ffffff">
                                                                available clusters
                                                            </span>
                                                            <g:each var="cluster" in="${clusters}">
                                                                <span class='list-group-item'>${cluster.field}</span>
                                                            </g:each>
                                                            
                                                           </div>
                                                   
                                                    </div>
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
    
    <script src="/assets/websockets/application.js" type="text/javascript"></script>
    <asset:javascript src="spring-websocket" />
    <script type="text/javascript">
        $(document).ready(function(){
            var socket = new SockJS("${createLink(uri: '/stomp')}");
            var client = Stomp.over(socket);
            var firstadd = true;

            client.connect({}, function() {
                client.subscribe("/user/queue/addCluster", function(message) {
                    var cluster = JSON.parse(JSON.parse(message.body));
                    var clusterText = cluster.clusterName;
                    var clusterId = cluster.clusterId;

                    $('.clusterList').append("<option value='"+clusterId+"'>"+clusterText+"</option>");
                    $("#availableClusters").append("<span class='list-group-item'>"+clusterText+"</span>");
                    if(firstadd){
                        firstadd = false;
                        $('.view').text(clusterText);
                    }
                    $("#listIdeas").append(ideaHtml);
                });
                client.subscribe("/user/queue/changeCluster", function(message) {
                    var ideaCluster = JSON.parse(JSON.parse(message.body));
                    var idea = ideaCluster.idea;
                    var cluster = ideaCluster.clusterField;
                    $('span#'+idea).text(cluster);
                });
                client.subscribe("/topic/nextStep", function(message) {
                        var href = JSON.parse(JSON.parse(message.body));
                        $(location).attr('href', href.location);
                    });
            });

            $("#addClusterBtn").click(function() {
                    var clusterText = $('#cluster').val();
                    var clusteringId="${clustering.id}";
                    
                    var cluster = {
                            "clusteringId" : clusteringId,
                            "clusterText" : clusterText,
                            
                        };
                    $.ajax({
                        type: "POST",
                        url: "/Clustering/saveCluster",
                        data: { cluster: JSON.stringify(cluster)} ,
                        success : function(data){
                        client.send("/app/addCluster", {}, JSON.stringify(data));
                        }                     
                    }); 
                    
                });
            
            $('.clusterList').change(function(){
                var ideaCluster = $(this).attr('name')+"$"+$(this).find('option:checked').attr("value");
                client.send("/app/changeCluster", {}, JSON.stringify(ideaCluster));
            });
            $('#nextStep').click(function(){
                    var href = "${clustering.id}";
                    client.send("/app/nextStep", {}, JSON.stringify(href));
                });
            $('#saveClusters').click(function(){
                    var clusters = {}
                    $('.clusterList').each(function(){
                        var items = []
                        clusters[$(this).val()] = items;

                    });
                    $('.clusterList').each(function(){
                        clusters[$(this).val()].push($(this).attr('id'));
                    });
                    $.ajax({
                        type: "POST",
                        url: "/Clustering/commitChange",
                        data: { clustersCommit: JSON.stringify(clusters)} ,
                        success : function(data){
                            alert("yes");
                        //client.send("/app/commitChange", {}, JSON.stringify(data));
                        }                     
                    });
                    
            });
        });
    </script>
    </content>
   
    </body>
</html>