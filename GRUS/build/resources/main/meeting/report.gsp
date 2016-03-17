<!DOCTYPE html>
<%@ page import="grails.converters.*" %>
<%@ page import="org.codehaus.groovy.grails.web.json.*" %>
<html>

<head>
	<title> Rapport meeting du <g:formatDate format="dd/MM/yyyy HH:mm" date="${meeting.startDate}"/><br /></title>
</head>

<body>
	<div id="reportContent">
		<h1> Rapport meeting du <g:formatDate format="dd/MM/yyyy HH:mm" date="${meeting.startDate}"/><br/></h1>
		<h1 style="font-size:300%;" style="text-align:center;">${meeting.topic}</h1><br/>
		<p style="font-size:160%;">${meeting.description}</p><br/>

		Faciltateur : ${facilitator.firstName} ${facilitator.lastName}<br/>
		<BR>
	
		<h2>Liste des participants</h2>
		<ul>
			<g:each var="user" in="${meeting.participants}">
				<li>${user.username}</li>
			</g:each>
		</ul>
    
    	<h2>Liste des phases</h2>
		<%--<ul>
			<g:each var="user" in="${meeting.participants}">
				<li>${user.username}</li>
			</g:each>
		</ul>--%>
		<ul>
		<g:each var="phase" in="${phases}">
			<h3>${phase.phaseName}</h3>
	
		<g:each var="tool" in="${phase.tools}">
			<li><u>${tool.toolName}</u></li><br/0>
			<g:if test="${tool.toolName.equals("Brainstorming")}">
			<table border>
				<g:each var="idea" in="${tool.data}">
			<tr>
					<g:if test="${idea.author == null}">
						<td>Anonym:</td>
					</g:if>
					<g:else>
						<td>${idea.author}:</td>

					</g:else>
						<td>${idea.field}</td>
						<td><span class='label label-sm label-success'>${idea.created.format('dd/MM/yyyy HH:mm:ss')}</span></td>

        	</tr>
			
				</g:each>
			</table>
			<br/>
			</g:if>
			<g:else>
				<g:if test="${tool.toolName.equals("Clustering")}">
				<g:each var="cluster" in="${tool.data}">

					<tr>
						<u><i>${cluster.field}</i></u> &nbsp;&nbsp;   <span class='label label-sm label-success'>${cluster.created.format('dd/MM/yyyy HH:mm:ss')}</span> </br>
						<g:each var="idea" in="${cluster.elements}">
						<table border>
							<tr>

							<td>${idea.field}</td>
							<td><span class='label label-sm label-success'>${idea.created.format('dd/MM/yyyy HH:mm:ss')}</span></td>

							</tr>
						</table>
							<br/>
						</g:each>
							
					</tr>
					<br/>
				</g:each>
				<br/>
				
				
				</g:if>
				<g:else>
					<g:if test="${tool.toolName.equals("Voting")}">
					                                            
													<g:each var="data" in="${tool.data}">
															<table border>
															<tr>
																<td><u>${data.field}:</u><td>
															</tr>
															<tr>
															<g:each var="modality" in="${data.modalities}">
															
																<td>modality : ${modality.modalityName} </td> 
																<td>rating : ${modality.rating} votes	</td> 
															</tr>	
															
															</g:each>
															</table>															
													</g:each>
                                           
                                                

												</div>
											</div>
										</div>
									</div>
									</div>
                    </div>
                </div>
						
						
					<br/>
				
				
					</g:if>
				</g:else>
			</g:else>
		</g:each>
		</g:each>
		</ul>
	</div>
	
	<p><button id="cmd" class="btn btn-sm btn-primary">Generer en pdf</button></p>
    <p><input type="button" class="btn btn-sm btn-primary" onClick="window.print()" value=Imprimer> </p>
	
	<br/>

	
	<div id="editor"></div>

	<script src="/assets/jspdf.min.js" type="text/javascript"></script>
	<script src="/assets/jquery-2.1.4.min.js" type="text/javascript"></script>

    

    <script type="text/javascript">

		 
			$(function () {
				var doc = new jsPDF();
				
				var specialElementHandlers = {
					'#editor': function (element, renderer) {
						return true;
					}
				};

				$('#cmd').click(function () {
					doc.fromHTML($('#reportContent').get(0), 20, 20, {
						'width': 500,
							'elementHandlers': specialElementHandlers
					});
					doc.save('report-meeting${meeting.topic}.pdf');
				});
			});
		
		  
        
    </script>
	
		
</body>
</html>