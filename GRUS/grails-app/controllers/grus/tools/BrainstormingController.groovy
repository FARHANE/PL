package grus.tools
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.core.Authentication
import grus.ToolController
import grus.User
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
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
       	//def user = auth.getPrincipal()//User.findByUsername(auth.getName())
        def isFacilitator = ToolController.isFacilitatorOfMeeting(meeting,(int)auth.getPrincipal().getId())
        
        [brainstorm:brainstorm,ideas:ideas,isFacilitator:isFacilitator]
    }
}
