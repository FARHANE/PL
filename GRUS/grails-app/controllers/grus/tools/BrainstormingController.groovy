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
@Secured(['ROLE_ADMIN', 'ROLE_SUPERUSER', 'ROLE_USER'])
class BrainstormingController {
	SimpMessagingTemplate brokerMessagingTemplate
    def index() { 
    	 /*
            The Go! button in the show meeting view send the id of the tool (here the Brainstorming) 
            to Brainstorming controller so we can get the phase the process and the meeting ;)
        */
        def brainstorm = Brainstorming.findById(params.id)
        def ideas = brainstorm.ideas

        def meeting = ToolController.getMeetingFromPhase(brainstorm.phase)
        
        def auth = SecurityContextHolder.getContext().getAuthentication()
        def isFacilitator = ToolController.isFacilitatorOfMeeting(meeting,(int)auth.getPrincipal().getId())
        
        [brainstorm:brainstorm,ideas:ideas,isFacilitator:isFacilitator]
    }
    def saveIdea(){
        if(request.method == 'POST'){

                def ideaJson = new JsonSlurper().parseText(request.getParameter("idea"))
                def brainstorm = Brainstorming.findById(ideaJson.brainstormingId)
                def idea = null
                if(ideaJson.anonym == "true"){

                    idea = new BrainstormingData(data : ideaJson.ideaText,brainstorming:brainstorm).save(flush : true)
                }
                else{
                	def auth = SecurityContextHolder.getContext().getAuthentication()

                    idea = new BrainstormingData(data : ideaJson.ideaText,brainstorming:brainstorm,author : (int)auth.getPrincipal().getId()).save(flush : true)
                }

              
              brainstorm.addToIdeas(idea).save(flush:true)
              render idea.id
              
        }     
        
    }
    @MessageMapping("/addIdea")
    protected String addIdea(String ideaId, Principal principal) {

    	Brainstorming.withTransaction{ status ->
	        def idea = BrainstormingData.findById(ideaId)      
	    	def builder = new JsonBuilder()
	        builder {
	            message(idea.data)
	            created(idea.created.format('dd/MM/yyyy HH:mm:ss'))
	            author(idea.author)

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
    @MessageMapping("/nextStep")
    protected String nextStep(String brainstormingId) {
    	Brainstorming.withTransaction{ status ->
    		def brainstorming = Brainstorming.findById(brainstormingId)
    		def phase = brainstorming.phase
        	def process = phase.process
        	def meeting = process.meeting
        	def href = "/"+brainstorming.nextToolType+"/index/"+brainstorming.nextTool.id
    		def builder = new JsonBuilder()
	        builder {
	            location(href)
	            
	        }

	        brokerMessagingTemplate.convertAndSendToUser(meeting.facilitator.username,"/queue/nextStep",builder.toString())
        	for (user in meeting.participants){
        		brokerMessagingTemplate.convertAndSendToUser(user.username,"/queue/nextStep",builder.toString())
        	}

    	}
        
        
    }
    @MessageMapping("/setAnonym")
    protected String setAnonym(String brainstormingAnonym) {
       Brainstorming.withTransaction{ status ->
       		def brainstormingId = brainstormingAnonym.substring(0,brainstormingAnonym.indexOf(':'))
       		def anonymBoolean = brainstormingAnonym.substring(brainstormingAnonym.indexOf(':')+1)
       		println "*****************************************************"
       		
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
}
