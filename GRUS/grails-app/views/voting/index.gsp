<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="userlayout"/>
        <title>Voting</title>
        
        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheetse',file:'jquery.news-ticker.css')}" />
    </head>
    <body>
        
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">
                            Voting</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb pull-right">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="dashboard.html">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="hidden"><a href="#">Tool</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">Voting</li>
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
                                        <div class="panel panel-pink">
                                            <div class="panel-heading">
                                                <i class="fa fa-bullhorn"></i>&nbsp;&nbsp;Voting
                                            </div>
                                        <div class="panel-body pan row" >
                                            <g:if test="${isFacilitator == true}">
                                                
                                            </g:if>
                                            <div class="col-md-8" style="padding-top:20px;">

                                                    <div class="panel panel-red">
                                                        <div class="panel-heading">Votes</div>
                                                            <div class="panel-body">
                                                            <table class="table table-hover table-condensed">
                                                                <thead>
                                                                <tr>
                                                                    
                                                                    <th>Item</th>
                                                                    <th>Rating</th>
                                                                    <th>Vote<th>
                                                                    <g:if test="${isFacilitator == true}">
                                                                    <th>add modality<th>
                                                                    </g:if>
                                                                   
                                                                </tr>
                                                                </thead>
                                                                <tbody id="listvotes">
                                                                    <g:each var="vote" in="${votes}">
                                                                    <tr>
                                                                        
                                                                        
                                                                        <td>${vote.field}</td>
                                                                        <td>
                                                                            <select class="modalitiesList" style="width:100px;" id="${vote.id}">
                                                                               <g:each var="modality" in="${vote.modalities}">
                                                                                    <option value="${modality.id}">${modality.modalityName}</option>
                                                                                    </g:each>
                                                                            </select>

                                                                        </td>
                                                                        <td>
                                                                            <div class="input-group">
                                                                                <button id="${vote.id}" class="btn btn-success OkBtn" type="button">Ok</button>
                                                                                
                                                                            </div>
                                                                        </td>
                                                                        <g:if test="${isFacilitator == true}">
                                                                        <td>
                                                                            <div class="input-group">
                                                                                <input type="text" placeholder="Add a modality" class="form-control" name="modalityText" id="${vote.id}">
                                                                                <span class="input-group-btn">
                                                                                    <button id="${vote.id}" class="btn btn-success addModalityBtn" type="button"><i class="fa fa-plus-circle"></i></button>
                                                                                </span>
                                                                            </div>
                                                                        </td>
                                                                        </g:if>
                                                                        
                                                                        
                                                                        
                                                                    </tr>
                                                                    </g:each>
                                                                
                                                                </tbody>
                                                            </table>
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
                client.subscribe("/user/queue/addModality", function(message) {
                    var modality = JSON.parse(JSON.parse(message.body));
                    
                    var modalityName = modality.modalityName;
                    var modalityId = modality.modalityId;
                    var voteId = modality.voteId;
                    $("select[id='"+voteId+"']").append("<option value='"+modalityId+"'>"+modalityName+"</option>");
                });
                client.subscribe("/user/queue/votingNextStep", function(message) {
                        var href = JSON.parse(JSON.parse(message.body));
                        $(location).attr('href', href.location);
                    });
                
            });

            
            $('.addModalityBtn').click(function(){
                    var modality = $("input[id='"+$(this).attr('id')+"']").val();
                    var voteDataId=$(this).attr('id');
                    
                    var modalityVote = {
                            "voteId" : voteDataId,
                            "modalityText" : modality     
                        };
                        
                    $.ajax({
                        type: "POST",
                        url: "/Voting/saveModality",
                        data: { modalityVote: JSON.stringify(modalityVote)} ,
                        success : function(data){
                        client.send("/app/addModality", {}, JSON.stringify(data));
                        }                     
                    }); 
                    
            });
            $(".OkBtn").click(function(){
                
                 var modalityId =$("select[id = '"+$(this).attr('id')+"'] option:selected").val();
                 var mod = {
                            "modalityId" : modalityId     
                        };
                $.ajax({
                        type: "POST",
                        url: "/Voting/addRating",
                        data: { modality: JSON.stringify(mod)} ,
                        success : function(data){
                        
                        }                     
                    }); 
                $("select[id = '"+$(this).attr('id')+"']").prop("disabled",true);
                $(this).remove();

            });
            $('#nextStep').click(function(){

                    var href = "${voting.id}";
                    client.send("/app/votingNextStep", {}, JSON.stringify(href));
                });
        })
    </script>
    </content>
   
    </body>
</html>