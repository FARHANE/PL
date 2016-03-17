<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="userlayout"/>
        <title>Meeting List</title>
        
        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheetse',file:'jplist-custom.css')}" />

    </head>
    <body>
        <!--BEGIN TITLE & BREADCRUMB PAGE-->
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div class="page-title">
                        Meeting List</div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-right">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="dashboard.html">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="hidden"><a href="#">Meeting</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                    <li class="active">Meeting List</li>
                </ol>
                <div class="clearfix">
                </div>
            </div>
        <!--END TITLE & BREADCRUMB PAGE-->
        <!--BEGIN CONTENT-->
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
                            <div>
                                <a href="${createLink(controller:'meeting', action:'myMeetings')}" class="btn btn-orange">My meetings</a>
                                <a href="${createLink(controller:'meeting', action:'publicMeetings')}" class="btn btn-blue">Public meetings</a>
                                
                                <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SUPERUSER">
                                    <a href="${createLink(controller:'meeting', action:'facilitatorOf')}" class="btn btn-yellow">Facilitator of</a>
                                    <a href="${createLink(controller:'meeting', action:'add')}" class="btn btn-red">Add a meeting</a>
                                </sec:ifAnyGranted>

                                
                            </div>
                            <div class="page-content">
                    <div class="row">
                    <div class="col-lg-12">
                        <div class="panel">
                            <div class="panel-body">
                                <div id="grid-layout-table-1" class="box jplist">
                                    <div class="jplist-ios-button"><i class="fa fa-sort"></i>jPList Actions</div>
                                    <div class="jplist-panel box panel-top">
                                        <button type="button" data-control-type="reset" data-control-name="reset" data-control-action="reset" class="jplist-reset-btn btn btn-default">Reset<i class="fa fa-share mls"></i></button>
                                        <div data-control-type="drop-down" data-control-name="paging" data-control-action="paging" class="jplist-drop-down form-control">
                                            <ul class="dropdown-menu">
                                                <li><span data-number="3"> 3 per page</span></li>
                                                <li><span data-number="5"> 5 per page</span></li>
                                                <li><span data-number="10" data-default="true"> 10 per page</span></li>
                                                <li><span data-number="all"> view all</span></li>
                                            </ul>
                                        </div>
                                        <div data-control-type="drop-down" data-control-name="sort" data-control-action="sort" data-datetime-format="{month}/{day}/{year}" class="jplist-drop-down form-control">
                                            <ul class="dropdown-menu">
                                                <li><span data-path="default">Sort by</span></li>
                                                <li><span data-path=".title" data-order="asc" data-type="text">Title A-Z</span></li>
                                                <li><span data-path=".title" data-order="desc" data-type="text">Title Z-A</span></li>
                                                <li><span data-path=".desc" data-order="asc" data-type="text">Description A-Z</span></li>
                                                <li><span data-path=".desc" data-order="desc" data-type="text">Description Z-A</span></li>
                                                <li><span data-path=".like" data-order="asc" data-type="number" data-default="true">Participants asc</span></li>
                                                <li><span data-path=".like" data-order="desc" data-type="number">Participants desc</span></li>
                                                
                                            </ul>
                                        </div>
                                        <div class="text-filter-box">
                                            <div class="input-group"><span class="input-group-addon"><i class="fa fa-search"></i></span><input data-path=".title" type="text" value="" placeholder="Filter by Title" data-control-type="textbox" data-control-name="title-filter" data-control-action="filter" class="form-control"/></div>
                                        </div>
                                        <div class="text-filter-box">
                                            <div class="input-group"><span class="input-group-addon"><i class="fa fa-search"></i></span><input data-path=".desc" type="text" value="" placeholder="Filter by Description" data-control-type="textbox" data-control-name="desc-filter" data-control-action="filter" class="form-control"/></div>
                                        </div>
                                        <div data-type="Page {current} of {pages}" data-control-type="pagination-info" data-control-name="paging" data-control-action="paging" class="jplist-label btn btn-default"></div>
                                        <div data-control-type="pagination" data-control-name="paging" data-control-action="paging" class="jplist-pagination"></div>
                                    </div>
                                    <div class="box text-shadow">
                                        <table class="demo-tbl">
                                            <g:each in="${meetings}" var="meeting">
                                                <tr class="tbl-item"><!--<img/>-->
                                                    <td class="img">
                                                       
                                                        <img class="col-md-12"src="${resource(dir:'/images/users',file:meeting.facilitator.picture)}" alt="" class="img-responsive"/>

                                                        <p class="facilitator">${meeting.facilitator.username}</p>
                                                    </td>
                                                    <!--<data></data>-->
                                                    <td class="td-block">
                                                        <p class="date">End date :${meeting.endDate.format("dd/MM/yyyy - HH:mm")}</p>
                                                        <p class="date">Start date : ${meeting.startDate.format("dd/MM/yyyy - HH:mm")}</p>
                                                        
                                                        <p class="title">
                                                            ${meeting.topic}
                                                        </p>
                                                        <p class="desc">${meeting.description}</p>
                                                        <g:if test="${meeting.typeOfMeeting == 'public'}">
                                                            <span class="label label-success">Public</span>
                                                            <span style="float:right"><a href="${createLink(controller:'meeting', action:'show',id:meeting.id)}" class="btn btn-blue">Show</a></span>
                                                            <span style="float:right"><a href="${createLink(controller:'meeting', action:'report',id:meeting.id)}" class="btn btn-blue">Report</a></span>
                                                            <p class="like hide">0 Participants</p>
                                                        </g:if>
                                                        <g:else>
                                                            <span class="label label-danger">Private</span>
                                                            <span style="float:right"><a href="${createLink(controller:'meeting', action:'show',id:meeting.id)}" class="btn btn-blue">Show</a></span>
                                                             <span style="float:right"><a href="${createLink(controller:'meeting', action:'report',id:meeting.id)}" class="btn btn-blue">Report</a></span>
                                                            <g:if test="${meeting.participants == null}">
                                                                <p class="like">0 Participants</p>
                                                            </g:if>
                                                            <g:else>
                                                                <g:if test="${meeting.participants!=null}">
                                                                    <p class="like">${meeting.participants.size()} Participants</p>
                                                                </g:if>
                                                            </g:else>

                                                        </g:else>
                                                        
                                                       
                                                    </td>
                                            </tr>
                                            </g:each>
                                            

                                        </table>
                                        </div>
                                    <div class="box jplist-no-results text-shadow align-center"><p>No results found</p></div>
                                    <div class="jplist-ios-button"><i class="fa fa-sort"></i>jPList Actions</div>
                                    <div class="jplist-panel box panel-bottom">
                                        <div data-control-type="drop-down" data-control-name="paging" data-control-action="paging" data-control-animate-to-top="true" class="jplist-drop-down form-control">
                                            <ul class="dropdown-menu">
                                                <li><span data-number="3"> 3 per page</span></li>
                                                <li><span data-number="5"> 5 per page</span></li>
                                                <li><span data-number="10" data-default="true"> 10 per page</span></li>
                                                <li><span data-number="all"> view all</span></li>
                                            </ul>
                                        </div>
                                        <div data-control-type="drop-down" data-control-name="sort" data-control-action="sort" data-control-animate-to-top="true" data-datetime-format="{month}/{day}/{year}" class="jplist-drop-down form-control">
                                            <ul class="dropdown-menu">
                                                <li><span data-path="default">Sort by</span></li>
                                                <li><span data-path=".title" data-order="asc" data-type="text">Title A-Z</span></li>
                                                <li><span data-path=".title" data-order="desc" data-type="text">Title Z-A</span></li>
                                                <li><span data-path=".desc" data-order="asc" data-type="text">Description A-Z</span></li>
                                                <li><span data-path=".desc" data-order="desc" data-type="text">Description Z-A</span></li>
                                                <li><span data-path=".like" data-order="asc" data-type="number" data-default="true">Participants asc</span></li>
                                                <li><span data-path=".like" data-order="desc" data-type="number">Participants desc</span></li>
                                                
                                            </ul>
                                        </div>
                                        <div data-type="{start} - {end} of {all}" data-control-type="pagination-info" data-control-name="paging" data-control-action="paging" class="jplist-label btn btn-default"></div>
                                        <div data-control-type="pagination" data-control-name="paging" data-control-action="paging" data-control-animate-to-top="true" class="jplist-pagination"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                            
                            </div>
                            
                        </div>
                    </div>
                </div>
                <!--END CONTENT-->
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
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jplist.min.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jplist.js')}"></script>


    </content>
   <style type="text/css">
   .picture-30{
    display: inline-block;
    height: 30px;
    position: relative;
    width: 30px;
   }
   .facilitator{
    color : #f03800;
    width: 100px;
    text-align: center;
   }
   .img{
    width: 130px;
    padding-right: 0px;
   }

   </style>
    </body>
</html>