package grus.tools
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.core.Authentication
import grus.ToolController
import grus.User
import grus.tools.data.BrainstormingData
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import groovy.json.JsonBuilder
import groovy.json.JsonSlurper
@Secured(['ROLE_ADMIN', 'ROLE_SUPERUSER', 'ROLE_USER'])
class BrainstormingController {

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
                println "*****************************"
                println ideaJson
                def idea = null
                if(ideaJson.anonym == "true"){

                    idea = new BrainstormingData(data : ideaJson.ideaText).save(flush : true)
                }
                else{
                	def auth = SecurityContextHolder.getContext().getAuthentication()

                    idea = new BrainstormingData(data : ideaJson.ideaText,author : (int)auth.getPrincipal().getId()).save(flush : true)
                }

              def brainstorm = Brainstorming.findById(ideaJson.brainstormingId)
              brainstorm.addToIdeas(idea).save(flush:true)
              render idea.id
              
        }

            
        
    }
}
