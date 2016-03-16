package grus.tools
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.core.Authentication
import grus.ToolController
import grus.User
import grus.Meeting
import grus.tools.data.Data
import grus.tools.data.ClusteringData
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import groovy.json.JsonBuilder
import groovy.json.JsonSlurper
import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.simp.SimpMessagingTemplate
import grus.ToolsModelOfPhaseModel
import grus.ToolModel
import java.security.Principal
@Secured(['ROLE_ADMIN', 'ROLE_SUPERUSER', 'ROLE_USER'])

class ClusteringController {
	SimpMessagingTemplate brokerMessagingTemplate
    def index() { 
    	def clustering = Clustering.findById(params.id)
        if(clustering.previousTool == null){
            flash.messageTitle ="Ooops !"
            flash.message = "The meeting can not start with a clustering "
            flash.messageType= "note-danger"
            render(view: '/user/userNotification')
        }
        else{
        	def clusters = clustering.data
        	def previousTool = clustering.previousTool
        	def data = previousTool.data.sort{it.id}
            def author = false
            if(data && data.getAt(0).hasProperty("author")){
                author = true
            }
            
        	def meeting = ToolController.getMeetingFromPhase(clustering.phase)
            def auth = SecurityContextHolder.getContext().getAuthentication()
            def user = User.findById(auth.getPrincipal().getId())
            def isParticipant = user in meeting.participants
            def isFacilitator = ToolController.isFacilitatorOfMeeting(meeting,(int)auth.getPrincipal().getId())
            if(!isFacilitator && !isParticipant){
                flash.messageTitle ="You can not access to this meeting"
                flash.message = 'Your name is not in list of participants'
                flash.messageType= "note-warning"
                render(view: '/user/userNotification')
            }
            if(!isFacilitator && meeting.state == "coming"){
                flash.messageTitle ="The meeting is not begin yet"
                flash.message = 'The facilitator of the meeting must start the meeting before you can participate in '
                flash.messageType= "note-info"
                render(view: '/user/userNotification')
            }
            else{
                meeting.state = "open"
                meeting.save(flush : true)
            }
            /*timeline*/
        def process = meeting.process
        def currentPhase = process.currentPhase
        def currentTool = currentPhase.currentTool 
        def toolsOfCurrentPhase = currentPhase.tools.sort{it.id}
        
        def position = 0
        toolsOfCurrentPhase.eachWithIndex { item, index ->
            if(item.id == currentTool.id){
                position = index
            }
        }
        
        def modelProcess = process.modelProcess
        def phases= modelProcess.phasesOfModel
        phases = phases.sort {it.id}
        def itemPhase = [:]
        for(phase in phases)
        {
            def toolsModel = ToolsModelOfPhaseModel.findAllByPhase(phase)
            
            def item = []
            for(toolModel in toolsModel)
            {
                def toolName = ToolModel.findById(toolModel.tool.id).toolModelName
                item.push(toolName)
            }
            itemPhase.put(phase.modelPhaseName,item)
        }
            [author : author, clustering:clustering,clusters:clusters,data:data,isFacilitator:isFacilitator,meeting:meeting,itemPhase:itemPhase,modelProcess:modelProcess,phases:phases,process:process,position:position]
            
        }
    }
    def saveCluster(){
        if(request.method == 'POST'){

            def clusterJson = new JsonSlurper().parseText(request.getParameter("cluster"))
           
            def clustering = Clustering.findById(clusterJson.clusteringId)

            def cluster = new ClusteringData(field :clusterJson.clusterText,clustering:clustering ).save(flush:true,failOnError:true)
            
            clustering.addToData(cluster)
	        clustering.save(flush:true) 
		    render cluster.id

              
        }     
        
    }

    @MessageMapping("/addCluster")
    protected String addCluster(String newClusterId, Principal principal) {

    	Clustering.withTransaction{ status ->
    			
    	        def cluster = ClusteringData.findById(newClusterId)     
    	        
    	    	def builder = new JsonBuilder()
                builder {
                        clusterId(cluster.id)
                        clusterName(cluster.field)
                }
    			

    	        def clustering = cluster.clustering

            	def phase = clustering.phase
            	def process = phase.process
            	def meeting = process.meeting
            	brokerMessagingTemplate.convertAndSendToUser(meeting.facilitator.username,"/queue/addCluster",builder.toString())

            	for (user in meeting.participants){
            		brokerMessagingTemplate.convertAndSendToUser(user.username,"/queue/addCluster",builder.toString())
            	}

	    	} 
    }
    @MessageMapping("/changeCluster")
    protected String changeCluster(String ideaCluster) {
		Clustering.withTransaction{ status ->
	        def ideaText = ideaCluster.substring(0, ideaCluster.indexOf('$'))
	        def clusterId = ideaCluster.substring(ideaCluster.indexOf('$')+1)
	        def cluster = ClusteringData.findById(clusterId)
	        
			def builder = new JsonBuilder()
		        builder {
		            idea(ideaText)
		            clusterField(cluster.field)
		        }
	        def clustering = cluster.clustering

        	def phase = clustering.phase
        	def process = phase.process
        	def meeting = process.meeting
        	brokerMessagingTemplate.convertAndSendToUser(meeting.facilitator.username,"/queue/changeCluster",builder.toString())

        	for (user in meeting.participants){
        		brokerMessagingTemplate.convertAndSendToUser(user.username,"/queue/changeCluster",builder.toString())
        	}
        }		
    }
    def commitChange(){
        if(request.method == 'POST'){

            def clusterJson = new JsonSlurper().parseText(request.getParameter("clustersCommit"))
            if(clusterJson.toString){
              clusterJson.each{clusterId,ithemsId -> // ithems like ideas for example
                def cluster = ClusteringData.findById(clusterId)
                cluster.elements.clear()
                //def clustering = cluster.clustering
                //def previousTool = clustering.previousTool

                ithemsId.each{
                    def data = Data.findById(it)
                    cluster.addToElements(data)
                }
                cluster.save(flush:true)

            }  
            }
            
           
		    render true

              
        }     
        
    }
    @MessageMapping("/clusteringNextStep")
    protected String clusteringNextStep(String toolId, Principal principal) {
        
        Clustering.withTransaction{ status ->            
            def clustering = Clustering.findById(toolId)
            def phase = clustering.phase
            def process = phase.process
            def meeting = process.meeting
            def href = null
            if (clustering.nextTool!= null){
                href = "/"+clustering.nextToolType+"/index/"+clustering.nextTool.id
                ToolController.setNextTool(toolId)
            }
            else{
                if(process.currentPhase.nextPhase==null)
                {
                    meeting.state = "finished"
                    meeting.save(flush:true)
                    href = "/meeting/theEndMessage"
                }
                else
                {
                    process.currentPhase = phase.nextPhase
                    process.save(flush:true)
                    href= "/"+process.currentPhase.currentTool.toolName+"/index/"+process.currentPhase.currentTool.id
                }
            }            
            def builder = new JsonBuilder()
            builder {
                location(href)
                
            }

            brokerMessagingTemplate.convertAndSendToUser(meeting.facilitator.username,"/queue/clusteringNextStep",builder.toString())
            for (user in meeting.participants){
                brokerMessagingTemplate.convertAndSendToUser(user.username,"/queue/clusteringNextStep",builder.toString())
            }
            
            
            
        }    
    }
    
}
