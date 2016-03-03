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
import java.security.Principal
@Secured(['ROLE_ADMIN', 'ROLE_SUPERUSER', 'ROLE_USER'])

class ClusteringController {
	SimpMessagingTemplate brokerMessagingTemplate
    def index() { 
    	def clustering = Clustering.findById(params.id)
    	def clusters = clustering.data
    	def previousTool = clustering.previousTool
    	def data = previousTool.data.sort{it.id}
        def author = false
        if(data && data.getAt(0).hasProperty("author")){
            author = true
        }
        println author
    	def meeting = ToolController.getMeetingFromPhase(clustering.phase)
        def auth = SecurityContextHolder.getContext().getAuthentication()
        def isFacilitator = ToolController.isFacilitatorOfMeeting(meeting,(int)auth.getPrincipal().getId())    	
    	[author : author, clustering:clustering,clusters:clusters,data:data,isFacilitator:isFacilitator]
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
           
		    render true

              
        }     
        
    }
    @MessageMapping("/clusteringNextStep")
    protected String clusteringNextStep(String toolId, Principal principal) {
        Brainstorming.withTransaction{ status ->
            def clustering = Clustering.findById(toolId)
            def phase = clustering.phase
            def process = phase.process
            def meeting = process.meeting
            def href = "/"+clustering.nextToolType+"/index/"+clustering.nextTool.id
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
