<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="userlayout"/>
        <title>Meeting</title>
        
        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheetse',file:'jquery.news-ticker.css')}" />
    </head>
    <body>
        
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">
                            Show Meeting</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb pull-right">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="dashboard.html">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="hidden"><a href="#">Meeting</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">Show Meeting</li>
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
                            <div class="col-lg-12">
                                <div class="row">
                                    <!--variables to  send for the tool + (mmeting)-->
                                    

                                    <div class="col-lg-12">
                                        <div class="panel panel-red">
                                            <div class="panel-heading">
                                                 Topic : " ${meeting.topic} "</div>
                                            <div class="panel-body pan">
                                                <div class="row" style="padding:20px;">
                                                    <div class="col-md-6" >
                                                        <div>
                                                            <h2 style="color:#f03800">Description</h2>
                                                            <p style="text-align:justify">${meeting.description}</p>
                                                            <g:if test="${meeting.typeOfMeeting == 'public'}">
                                                                <p><span class="label label-success">Public</span></p>
                                                            </g:if>
                                                            <g:else>
                                                                <p><span class="label label-danger">Private</span></p>
                                                            </g:else>
                                                            <p><span class="label label-sm label-info">Start date</span> : ${meeting.startDate.format("dd/MM/yyyy - HH:mm")}</p>
                                                            <p><span class="label label-sm label-warning">End date </span> &nbsp;: ${meeting.endDate.format("dd/MM/yyyy - HH:mm")}</p>
                                                            <!-- facilitator-->
                                                            <div class="panel">
                                                                <div class="panel-body">
                                                                    <div class="profile">
                                                                        <div style="margin-bottom: 15px" class="row">
                                                                            <div class="col-xs-12 col-sm-8">
                                                                                <h2>
                                                                                    ${facilitator.firstName+" "+ facilitator.lastName}</h2>
                                                                                <p>
                                                                                    <strong>Company : </strong> ${facilitator.company}</p>
                                                                                <p>
                                                                                    <strong>Job : </strong>${facilitator.job}</p>
                                                                                
                                                                            </div>
                                                                            <div class="col-xs-12 col-sm-4 text-center">
                                                                                <figure><img src="${assetPath(src: facilitator.picture)}" alt="" style="display: inline-block" class="img-responsive img-circle">
                                                                                
                                                                            </figure>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row text-center divider">
                                                                            <div class="col-xs-12 col-sm-4 emphasis">
                                                                                <h2>
                                                                                    <strong>${nbOfMeetings}</strong></h2>
                                                                                <p>
                                                                                    <small>Meeting Facilitated</small>
                                                                                </p>
                                                                                <button class="btn btn-yellow btn-block">
                                                                                    <span class="fa fa-envelope"></span>&nbsp; Message
                                                                                </button>
                                                                            </div>
                                                                            <div class="col-xs-12 col-sm-4 emphasis">
                                                                                <h2>
                                                                                    <strong>${meeting.facilitator.meetingsParticipatedIn.size()}</strong></h2>
                                                                                <p>
                                                                                    <small>Participations</small>
                                                                                </p>
                                                                                <button class="btn btn-blue btn-block">
                                                                                    <span class="fa fa-user"></span>&nbsp; Profile
                                                                                </button>
                                                                            </div>
                                                                            <div class="col-xs-12 col-sm-4 emphasis">
                                                                                <h2>
                                                                                    <strong>0</strong></h2>
                                                                                <p>
                                                                                    <small>Groups</small>
                                                                                </p>
                                                                                <div class="btn-group dropup">
                                                                                    <button type="button"  class="btn btn-orange dropdown-toggle">
                                                                                        <span class="fa fa-group"></span>&nbsp; Invitation
                                                                                    </button>
                                                                                    
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--end facilitator-->
                                                            <!--start users-->
                                                            <div>
                                                                <div class="portlet box">
                                                                    <div class="portlet-header">
                                                                        <div class="caption">
                                                                            Participants</div>
                                                                    </div>
                                                                    <div style="overflow: hidden;" class="portlet-body">
                                                                        <ul class="todo-list ">
                                                                            <g:each var="participant" in="${participants}">
                                                                            <li style="cursor: default;">
                                                                                <span><img class="img-responsive " style="height:30px;float:left;padding-right:20px;" src="${assetPath(src: participant.picture)}"></span>
                                                                                <div class="todo-title" style="padding-top:10px;">
                                                                                    ${participant.username}</div>
                                                                                <div style="padding-top:10px;"class="todo-actions pull-right clearfix">
                                                                                    <a href="#" class="todo-complete"><i class="fa fa-eye"></i></a><a href="#" class="todo-edit">
                                                                                        <i class="fa fa-envelope"></i></a><a href="#" class="todo-remove"><i class="fa fa-trash-o">
                                                                                        </i></a>
                                                                                </div>
                                                                            </li>
                                                                           </g:each>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--end users-->
                                                        </div>
                                                    </div>
                                                    <!--start timeline-->
                                                    <div class="col-md-6" >
                                                        <div style="background-color :#eeeeee">
                                                        <div class="timeline-centered timeline-sm">
                                                            
                                                            <article class="timeline-entry">
                                                                <div class="timeline-entry-inner">
                                                                    <time datetime="2014-01-10T03:45" class="timeline-time"><span>${meeting.startDate.format("dd/MM/yyyy")}</span><span>${meeting.startDate.format("HH:mm")}</span></time>
                                                                    <div class="timeline-icon bg-violet"><i class="fa fa-refresh"></i></div>
                                                                    <div class="timeline-label"><h4 class="timeline-title">Process : ${modelProcess.processModelName}</h4>

                                                                        <p>${modelProcess.processModelDescription}</p></div>
                                                                </div>
                                                            </article>
                                                            <g:each var="phase" in="${phases}" status="i" >

                                                            <article  class=" timeline-entry ${ (i % 2) == 0 ? 'left-aligned' : ''}">
                                                                <div class="timeline-entry-inner">
                                                                    <time datetime="2014-01-10T03:45" class="timeline-time">
                                                                    
                                                                        <g:if test="${process.currentPhase.phaseModel.id ==phase.id}">

                                                                        <span style="color:#f0ad4e;font-size:1.1em" >Current Phase</span>
                                                                        
                                                                        </g:if>
                                                                    </time>
                                                                    <div class="timeline-icon bg-${ (process.currentPhase.phaseModel.id ==phase.id)? 'orange' : 'green'}"><i class="fa fa-${ (process.currentPhase.phaseModel.id ==phase.id)? 'gear fa-spin' : 'code-fork'}"></i></div>
                                                                    <div class="timeline-label bg-${ (process.currentPhase.phaseModel.id ==phase.id)? 'orange' : 'green'}"><h4 class="timeline-title">${phase.modelPhaseName}</h4>
                                                                    <p>
                                                                        <g:each status="pos" var="tool" in="${itemPhase[phase.modelPhaseName]}">
                                                                   <g:if test = "${process.currentPhase.phaseModel.id ==phase.id && position == pos }">
                                                                        <div style="color : blue">
                                                                        <i class="fa fa-forward"></i>
                                                                        &nbsp;${tool}

                                                                    </div>
                                                                        </g:if>
                                                                        <g:else>
                                                                            <div>
                                                                                <i class="fa fa-gear"></i>
                                                                                &nbsp;${tool}

                                                                            </div>
                                                                        </g:else>
                                                                            

                                                                            
                                                                        </g:each>
                                                                    </p></div>
                                                                </div>
                                                            </article>
                                                        </g:each>
                                                           <article class="timeline-entry">
                                                            
                                                                <div class="timeline-entry-inner">
                                                                    <time datetime="2014-01-10T03:45" class="timeline-time"><span>${meeting.endDate.format("dd/MM/yyyy")}</span><span>${meeting.endDate.format("HH:mm")}</span></time>
                                                                    <div  class="timeline-icon"><i class="fa fa-flag"></i></div>
                                                                </div>
                                                            </article>
                                                            
                                                        </div>
                                                        </div>
                                                        <a href="${createLink(controller:meeting.process.currentPhase.currentTool.toolName, action:'index',id:meeting.process.currentPhase.currentTool.id)}" class="btn btn-success" style="width:100%;font-size:2em;">Go !</a>
                                                        
                                                        
                                                    </div>
                                                    <!--end timeline-->
                                                    
                                                </div>  
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
    <
    </content>
   
    </body>
</html>