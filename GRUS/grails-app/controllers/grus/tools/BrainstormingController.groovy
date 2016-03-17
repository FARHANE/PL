package grus.tools
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.core.Authentication
import grus.ToolController
import grus.User
import grus.Meeting
import grus.tools.data.BrainstormingData
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import groovy.json.JsonBuilder
import groovy.json.JsonSlurper
import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.simp.SimpMessagingTemplate
import java.security.Principal
import grus.ToolsModelOfPhaseModel
import grus.ToolModel
@Secured(['ROLE_ADMIN', 'ROLE_SUPERUSER', 'ROLE_USER'])
class BrainstormingController {
	SimpMessagingTemplate brokerMessagingTemplate
    def index() { 
    	 /*
            The Go! button in the show meeting view send the id of the tool (here the Brainstorming) 
            to Brainstorming controller so we can get the phase the process and the meeting ;)
        */
        def brainstorm = Brainstorming.findById(params.id)
        def ideas = brainstorm.data.sort{it.id}
        
        def meeting = ToolController.getMeetingFromPhase(brainstorm.phase)
        
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
        
        [brainstorm:brainstorm,ideas:ideas,isFacilitator:isFacilitator,meeting:meeting,itemPhase:itemPhase,modelProcess:modelProcess,phases:phases,process:process,position:position]
    }
    def saveIdea(){
        if(request.method == 'POST'){

                def ideaJson = new JsonSlurper().parseText(request.getParameter("idea"))
               
                def brainstorm = Brainstorming.findById(ideaJson.brainstormingId)

                def idea = null
                if(ideaJson.anonym == "true"){

                    idea = new BrainstormingData(field : ideaJson.ideaText,comment :ideaJson.commentText ,brainstorming:brainstorm).save(flush : true)
                }
                else{
                	def auth = SecurityContextHolder.getContext().getAuthentication()
                	def user = User.findById(auth.getPrincipal().getId())
                    idea = new BrainstormingData(field : ideaJson.ideaText,brainstorming:brainstorm,author : user).save(flush : true)
                 
                }

              brainstorm.addToData(idea)
              brainstorm.save(flush:true)
              
		      render idea.id

              
        }     
        
    }
    @MessageMapping("/addIdea")
    protected String addIdea(String ideaId, Principal principal) {

    	Brainstorming.withTransaction{ status ->
    	        def idea = BrainstormingData.findById(ideaId)     
    	    	def builder = new JsonBuilder()
                if(idea.author){
                      builder {
                        message(idea.field)
                        comment(idea.comment)
                        created(idea.created.format('dd/MM/yyyy HH:mm:ss'))
                        author(idea.author.username)

                    }  
                    }
                    else{
                            builder {
                                message(idea.field)
                                comment(idea.comment)
                                created(idea.created.format('dd/MM/yyyy HH:mm:ss'))
                                author("Anonym")
                            }  
                    }
    	        

    	        def brainstorming = idea.brainstorming
            	def phase = brainstorming.phase
            	def process = phase.process
            	def meeting = process.meeting
            	brokerMessagingTemplate.convertAndSendToUser(meeting.facilitator.username,"/queue/addIdea",builder.toString())
            	for (user in meeting.participants){
            		brokerMessagingTemplate.convertAndSendToUser(user.username,"/queue/addIdea",builder.toString())
            	}

	    	} 
    }
    
    @MessageMapping("/setAnonym")
    protected String setAnonym(String brainstormingAnonym, Principal principal) {
       Brainstorming.withTransaction{ status ->

       		def brainstormingId = brainstormingAnonym.substring(0,brainstormingAnonym.indexOf(':'))
       		def anonymBoolean = brainstormingAnonym.substring(brainstormingAnonym.indexOf(':')+1)
       		def brainstorming = Brainstorming.findById(brainstormingId)
    		def phase = brainstorming.phase
        	def process = phase.process
        	def meeting = process.meeting

	        def builder = new JsonBuilder()
	        builder {
	            anonym(anonymBoolean)
	            
	        }
	        builder.toString()
	        brokerMessagingTemplate.convertAndSendToUser(meeting.facilitator.username,"/queue/setAnonym",builder.toString())
        	for (user in meeting.participants){
        		brokerMessagingTemplate.convertAndSendToUser(user.username,"/queue/setAnonym",builder.toString())
        	}
    	}
        
    }
    @MessageMapping("/brainstormingNextStep")
    protected String brainstormingNextStep(String toolId, Principal principal) {        
        Brainstorming.withTransaction{ status ->            
            def brainstorming = Brainstorming.findById(toolId)
            def phase = brainstorming.phase
            def process = phase.process
            def meeting = process.meeting
            def href = null
            if (brainstorming.nextTool!= null){
                href = "/"+brainstorming.nextToolType+"/index/"+brainstorming.nextTool.id
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

            brokerMessagingTemplate.convertAndSendToUser(meeting.facilitator.username,"/queue/brainstormingNextStep",builder.toString())
            sleep(1000)
            for (user in meeting.participants){
                brokerMessagingTemplate.convertAndSendToUser(user.username,"/queue/brainstormingNextStep",builder.toString())
            }
            ToolController.setNextTool(toolId)
        }    
    }
}
