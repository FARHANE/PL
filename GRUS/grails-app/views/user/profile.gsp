<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="userlayout"/>
		<title>My Profile</title>
		
	</head>
	<body>
		<!--BEGIN PAGE WRAPPER-->
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">
                            Profile</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb pull-right">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="dashboard.html">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="hidden"><a href="#">Profile</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">Profile</li>
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
                              <div class="row">
                    <div class="col-md-12"><h2>${user?.lastName+" "+user?.firstName}</h2>

                        <div class="row mtl">
                            <div class="col-md-3">
                                <div class="form-group">
                                	<div class="text-center mbl row">
                                        
                                        <img class="col-md-12"style="width:100%"src="${resource(dir:'/images/users',file:user.picture)}" alt="" class="img-responsive"/>
                                        
                                    </div>
                                    <div class="text-center mbl">
                                    <g:uploadForm action="uploadImage">
								        <input type="file" name="picture" class="btn btn-green"/>
								        <i class="fa fa-upload"></i>
								        <input type="submit" value="upload" />
								        
                                        
								    </g:uploadForm>
                                    </div>
                                </div>
                                <table class="table table-striped table-hover">
                                    <tbody>
                                    <tr>
                                        <td >User Name</td>
                                        <td>${user.username}</td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td>${user?.emailAddress}</td>
                                    </tr>

                                    

                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-9">
                              
                                <div id="generalTabContent" class="tab-content">
                                    <div id="tab-edit" class="tab-pane fade in active">
                                        <g:form name="changeProfileForm" enctype="multipart/form-data" class="form-horizontal" url="[controller:'user',action:'changePassword']">
                                            <h3>Change Password</h3>
                                           
                                            <div class="form-group"><label class="col-sm-3 control-label">New Password</label>

                                                <div class="col-sm-9 controls">
                                                    <div class="row">
                                                        <div class="col-xs-4">
                                                         <g:passwordField id="password" placeholder="New password" type="password" name="password" class="form-control"   />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-3 control-label">Confirm Password</label>

                                                <div class="col-sm-9 controls">
                                                    <div class="row">
                                                        <div class="col-xs-4">
                                                        <g:passwordField id="passwordConfirmation" placeholder="Confirm password" type="password" name="passwordConfirmation" class="form-control"   />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                           <div class="form-group">
                                                <div class="col-sm-9 controls">
                                                    <div class="row">
                                                        <div class="col-xs-4">
                                                        <button type="submit" class="btn btn-green ">Change password</button>
                                                        </div>
                                                    </div>
                                                </div>
                                               
                                            </div>
                                        </g:form>
                                            <hr/>
                                            <h3>Profile Setting</h3>
                                             <g:form name="changeProfileForm" enctype="multipart/form-data" class="form-horizontal" url="[controller:'user',action:'changeProfile']">
                                            <div class="form-group"><label class="col-sm-3 control-label">First Name</label>

                                                <div class="col-sm-9 controls">
                                                    <div class="row">
                                                        <div class="col-xs-9">
                                                        <g:textField id="firstName" value="${user.firstName}" name="firstName" class="form-control"   />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group"><label class="col-sm-3 control-label">Last Name</label>
                                                <div class="col-sm-9 controls">
                                                    <div class="row">
                                                        <div class="col-xs-9">
                                                        <g:textField id="lastName" value="${user.lastName}" name="lastName" class="form-control"   />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-3 control-label">Email</label>
                                                <div class="col-sm-9 controls">
                                                    <div class="row">
                                                        <div class="col-xs-9">
                                                        <g:textField id="emailAddress" value="${user.emailAddress}" name="emailAddress" class="form-control"   />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group"><label class="col-sm-3 control-label">Gender</label>
                                                
                                                <g:if test="${user.gender == "M"}">
												     <div class="col-sm-9 controls">
	                                                    <div class="row">
	                                                        <div class="col-xs-9">
	                                                            <label class="radio-inline">
	                                                            <g:radio name="gender" value="M" checked="true" />
	                                                            &nbsp;Male&nbsp;&nbsp;&nbsp;&nbsp;
	                                                            </label>
	                                                            <label class="radio-inline">
	                                                            <g:radio name="gender" value="F" />
	                                                            &nbsp;Female&nbsp;&nbsp;&nbsp;&nbsp;</label>
	                                                            
	                                                        </div>
	                                                    </div>
	                                                </div>
												</g:if>
												<g:else>
												     <div class="col-sm-9 controls">
	                                                    <div class="row">
	                                                        <div class="col-xs-9">
	                                                            
	                                                            <label class="radio-inline">
	                                                            <g:radio name="gender" value="M" />
	                                                            &nbsp;Male&nbsp;&nbsp;&nbsp;&nbsp;</label>
	                                                            <label class="radio-inline">
	                                                            <g:radio name="gender" value="F" checked="true"/>
	                                                            &nbsp;Female&nbsp;&nbsp;&nbsp;&nbsp;</label>
	                                                           
	                                                        </div>
	                                                    </div>
	                                                </div>
												</g:else>
                                                
                                            </div>                                        


                                            <div class="form-group"><label class="col-sm-3 control-label">Company</label>
                                                <div class="col-sm-9 controls">
                                                    <div class="row">
                                                        <div class="col-xs-9">
                                                        	<g:textField id="company" value="${user.company}" name="company" class="form-control"   />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group"><label class="col-sm-3 control-label">Job</label>
                                                <div class="col-sm-9 controls">
                                                    <div class="row">
                                                        <div class="col-xs-9">
                                                        <g:textField id="job" value="${user.job}" name="job" class="form-control"   />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            

                                            <hr/>
                                            
                                            <button type="submit" class="btn btn-green btn-block">Finish</button>
                                        </g:form>
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
               
            <!--END PAGE WRAPPER-->
	</body>
</html>