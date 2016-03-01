<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="userlayout"/>
        <title>Brainstorming</title>
        
        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheetse',file:'jquery.news-ticker.css')}" />
    </head>
    <body>
        
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">
                            Brainstorming</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb pull-right">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="dashboard.html">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="hidden"><a href="#">Tool</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">Brainstorming</li>
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
                                        <div class="panel panel-yellow">
                                            <div class="panel-heading">
                                                <i class="fa fa-comments"></i>&nbsp;&nbsp;Brainstorming
                                            </div>
                                        <div class="panel-body pan row" >
                                            <div class="col-md-4" style="padding-top:20px;">
                                                <div class="panel panel-red">
                                                    <div class="panel-heading">
                                                        Add idea
                                                    </div>
                                                    <div class="panel-body pan">
                                                        <g:form name="addIdeaForm" url="[controller:'brainstorming',action:'saveIdea']">
                                                            <div class="form-body pal">
                                                                <div class="form-group">
                                                                    <div class="input-icon right">
                                                                        <i class="fa fa-lightbulb-o"></i>
                                                                        
                                                                        <g:textField id="idea" name="idea" class="form-control" placeholder="Your idea" required="true" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <h4>Anonym</h4>
                                                                </div>
                                                                <div class="form-group" style="padding-left:20px;" >
                                                                        
                                                                    <g:if test="${isFacilitator == true}"> 
                                                                        <div class="radio " style="text-align:center;" >
                                                                        <label class="radio-inline">
                                                                            <g:radio  style="float:none" name="anonym" value="true" checked="true" />&nbsp;
                                                                            Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        </label>
                                                                        
                                                                        <label class="radio-inline">
                                                                            <g:radio  style="float:none" name="anonym" value="false"  /> No
                                                                        </label>
                                                                        
                                                                    </div>
                                                                    </g:if>
                                                                    <g:else>
                                                                    <div id="isAnonymLabel">
                                                                        <span class="label label-success" style="font-size:1.2em;">Yes</span>
                                                                    </div>
                                                                    
                                                                    </g:else>
                                                                </div>
                                                                    <img src="/assets/anonym.png" alt="" class="img-responsive"/>
                                                                
                                                            </div>
                                                            <div class="form-actions text-right pal">
                                                                <button id="addIdeaBtn"type="button" class="btn btn-primary">
                                                                    Add idea</button>
                                                            </div>
                                                        </g:form>
                                                    </div>
                                                </div>
                                                
                                            </div><!--end form-->
                                           <!--start table ideas-->
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
                                                                </tr>
                                                                </thead>
                                                                <tbody id="listIdeas">
                                                                    <g:each var="idea" in="${ideas}">
                                                                    <tr>

                                                                        <g:if test="${idea.author == null}">
                                                                            <td>Anonym</td>
                                                                        </g:if>
                                                                        <g:else>
                                                                        <td>${idea.author.username}</td>

                                                                        </g:else>
                                                                        <td>${idea.data}</td>
                                                                        <td><span class='label label-sm label-success'>${idea.created.format('dd/MM/yyyy HH:mm:ss')}</span></td>
                                                                    </tr>
                                                                    </g:each>
                                                                
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                   <g:if test="${isFacilitator == true}"> 
                                                    <button id="nextStep" class="btn btn-success" style="width:100%">Next Step</button>
                                                    </g:if>
                                                </div><!--end table ideas--> 
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
        $(document).ready(function() { 
                
                var socket = new SockJS("${createLink(uri: '/stomp')}");
                var client = Stomp.over(socket);
                var anonymat = "true";
                client.connect({}, function() {
                    client.subscribe("/user/queue/addIdea", function(message) {
                        var idea = JSON.parse(JSON.parse(message.body));
                        var ideaData = idea.message;
                        var created = idea.created;
                        var author = idea.author;
                      
                        var ideaHtml = "<tr><td>"+author+"</td><td>"+ideaData+"</td><td><span class='label label-sm label-success'>"+created+"</span></td></tr>";

                        $("#listIdeas").append(ideaHtml);
                    });
                    client.subscribe("/user/queue/nextStep", function(message) {
                        var href = JSON.parse(JSON.parse(message.body));
                        $(location).attr('href', href.location);
                    });
                    client.subscribe("/user/queue/setAnonym", function(message) {
                        var isAnonym = JSON.parse(JSON.parse(message.body));
                        if( "${isFacilitator}" != true){
                            if(isAnonym.anonym == "true"){
                                $('#isAnonymLabel').html("<span class='label label-success' style='font-size:1.2em;''>Yes</span>");
                                
                            }
                        else{
                            $('#isAnonymLabel').html("<span class='label label-danger' style='font-size:1.2em;''>No</span>");
                        } 

                       
                        }
                         anonymat = isAnonym.anonym;
                        
                         
                    });

                });
                
                $("#addIdeaBtn").click(function() {
                    var ideaText = $('#idea').val();
                    var brainstormingId="${brainstorm.id}";
                    
                    var idea = {
                            "brainstormingId" : brainstormingId,
                            "ideaText" : ideaText,
                            "anonym" : anonymat
                        };
                    $.ajax({
                        type: "POST",
                        url: "/Brainstorming/saveIdea",
                        data: { idea: JSON.stringify(idea)} ,
                        success : function(data){
                        client.send("/app/addIdea", {}, JSON.stringify(data));
                        }                     
                    }); 
                    
                });
                $('#nextStep').click(function(){

                    var href = "${brainstorm.id}";
                    client.send("/app/nextStep", {}, JSON.stringify(href));
                });
                $('input[name="anonym"]').change(function(){
                    anonymat=$(this).val();
                    
                    client.send("/app/setAnonym", {}, JSON.stringify("${brainstorm.id}:"+anonymat));
                });
            });
        
    </script>
    </content>
   
    </body>
</html>