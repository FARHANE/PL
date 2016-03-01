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
                            New Meeting</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb pull-right">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="dashboard.html">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="hidden"><a href="#">Meeting</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">New Meeting</li>
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
                                    
                                    <div class="col-lg-12">
                                        <div class="panel panel-orange">
                                            <div class="panel-heading">
                                                Add a new meeting</div>
                                            <div class="panel-body pan">
                                                <g:form name="addMeetingForm" url="[controller:'meeting',action:'add']">
                                                <div class="form-body pal">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <div class="input-icon">
                                                                    <i class="fa fa-flag"></i>
                                                                    <g:textField id="topic" name="topic" class="form-control" placeholder="Topic" required="true" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <div class="input-icon right">
                                                                begin at :
                                                                    
                                                                    <g:datePicker class="form-control" name="startDate" value=""
              default="${new Date().plus(1)}"/>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <div class="input-icon right">
                                                                finish at :
                                                                    
                                                                    <g:datePicker class="form-control" name="endDate" value=""
              default="${new Date().plus(7)}"/>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="radio" >
                                                            <label class="radio-inline">
                                                                <g:radio id="privateBtn" name="typeOfMeeting" value="private" checked="true" />&nbsp;
                                                                Private&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            </label>
                                                            
                                                            <label class="radio-inline">
                                                                <g:radio id="publicBtn" style="float:none" name="typeOfMeeting" value="public"  /> Public
                                                                </label>
                                                            
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group">
                                                        <g:textArea name="description" rows="5" placeholder="Description" class="form-control" />
                                                    </div>
                                                    <hr />
                                                    
                                                    <select name="processModel">
                                                        <g:each in="${processList}" var="process">
                                                            <option value="${process.id}">${process.processModelName}</option>
                                                        </g:each>
                                                    </select>
                                                    
                                                    <hr/>
                                                    <select name="facilitator">
                                                        <g:each in="${facilitators}" var="facilitator">
                                                            <option value="${facilitator.id}">${facilitator.username}</option>
                                                        </g:each>
                                                    </select>
                                                    
                                                    <hr/>

                                                    <div class="row" id="usersPanel">
                                                        <div class="col-md-5">
                                                                <div class="panel panel-green">
                                                                    <div class="panel-heading">All users</div>
                                                                    <div class="panel-body">
                                                                        <table class="table table-hover">
                                                                            <thead>
                                                                            <tr>
                                                                                <th>Select</th>
                                                                                <th>Picture</th>
                                                                                <th>Username</th>
                                                                                
                                                                            </tr>
                                                                            </thead>
                                                                            <tbody id="listOfUsers">

                                                                                <g:each in="${users}" var="user">
                                                                                    <tr id="${user.id}">
                                                                                        <td><input type="checkbox" name="users" value="${user.id}"></td>
                                                                                        <td><img src="${assetPath(src: user.picture)}"
                                                                                            class="picture-30"></td>
                                                                                        <td>${user.username}</td>
                                                                                        
                                                                                    </tr>
                                                                                </g:each>
                                                                            
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                        </div>
                                                        <div class="col-md-2" style="padding-top:200px;">
                                                                <button id="addBtn"class="btn btn-primary" type="button" style="margin-bottom:20px;">&nbsp;&nbsp;&nbsp;&nbsp; Add -->&nbsp;&nbsp;&nbsp;</button>
                                                                <button id="removeBtn"class="btn btn-warning" type="button"> &nbsp;&nbsp;<--Remove </button>
                                                        </div>
                                                        <div class="col-md-5">
                                                                <div class="panel panel-yellow">
                                                                    <div class="panel-heading">Participants</div>
                                                                    <div class="panel-body">
                                                                        <table class="table table-hover">
                                                                            <thead>
                                                                            <tr>
                                                                                <th>#</th>
                                                                                <th>Picture</th>
                                                                                <th>Username</th>
                                                                           </tr>
                                                                            </thead>
                                                                            <tbody id="participants">
                                                                                  


                                                                            </tbody>
                                                                            
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                        </div>
                                                        
                                                    </div>
                                                    <hr />

                                                    
                                                    
                                                </div>
                                                <div class="form-actions text-right pal">
                                                    <button type="submit" class="btn btn-primary">
                                                        Continue</button>
                                                </div>
                                                </g:form>
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
    <script type="text/javascript">
        

        $(document).ready(function() {

        $('#addBtn').click(function(){
            $('#listOfUsers > tr').each(function() {
                var checkbox = $(this).find('td input').is(':checked');
                if(checkbox){
                    var idUser= $(this).attr('id');
                    var image =$(this).find('td').eq(1);
                    var username =$(this).find('td').eq(2);
                    var userHtml ="<tr id='"+idUser+"'><td><input value='"+idUser+"' name='participants' type='checkbox' checked = 'true'/></td><td>"+image.html()+"</td><td>"+username.html()+"</td>"+"<td></td></tr>";
                    $('#participants').append(userHtml);
                    $(this).remove();
                }
            });
        });

        $('#removeBtn').click(function(){
            $('#participants > tr').each(function() {
                var checkbox = $(this).find('td input').is(':checked');
                if(checkbox){
                var idUser= $(this).attr('id');
                var image =$(this).find('td').eq(1);
                var username =$(this).find('td').eq(2);
                var userHtml ="<tr id='"+idUser+"'><td><input value='"+idUser+"'name='users' type='checkbox' /></td><td>"+image.html()+"</td><td>"+username.html()+"</td>"+"<td></td></tr>";
                $('#listOfUsers').append(userHtml);
                $(this).remove();
                }
            });
        }); 
        $('input[type=radio][name=typeOfMeeting]').change(function(){
            if ($("#publicBtn").attr("checked")){
                $("#usersPanel").hide();

            }
            else{
                $("#usersPanel").show();
                
            }
           
            
        });

        
        });


        
        
    </script>
    </content>
   <style type="text/css">
   .picture-30{
    display: inline-block;
    height: 30px;
    position: relative;
    width: 30px;
   }
   </style>
    </body>
</html>