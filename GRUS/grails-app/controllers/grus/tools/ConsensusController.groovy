package grus.tools
import grus.ToolController
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import groovy.json.JsonBuilder
import groovy.json.JsonSlurper
import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.simp.SimpMessagingTemplate
import java.security.Principal
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_SUPERUSER', 'ROLE_USER'])
class ConsensusController {
    SimpMessagingTemplate brokerMessagingTemplate
    def index() { 
    	def voting = Voting.findById(params.id)
        def meeting = ToolController.getMeetingFromPhase(voting.phase)
        def auth = SecurityContextHolder.getContext().getAuthentication()
        def isFacilitator = ToolController.isFacilitatorOfMeeting(meeting,(int)auth.getPrincipal().getId())
    	
    	
    	def charts =[]
    	for(data in voting.data){

    		def rgb = new Random().nextInt(1 << 24) // A random 24-bit integer
    		def color = '#' + Integer.toString(rgb, 16).padLeft(6, '0')
    		def head = [data.item.field, 'Vote', '']
    		def chartData = [];
    		chartData.push(head)
    		for(modality in data.modalities){
    			def mod = [modality.modalityName , modality.rating , color]
    			chartData.push(mod)
    		}
    		charts.push(chartData)
    	}
    	        
    	[voting:voting,charts:charts,isFacilitator:isFacilitator]
    }
    @MessageMapping("/consensusNextStep")
    protected String consensusNextStep(String toolId, Principal principal) {       
        Voting.withTransaction{ status ->
            def voting = Voting.findById(toolId)
            def phase = voting.phase
            def process = phase.process
            def meeting = process.meeting
            def href = null
            if (voting.nextTool!= null){
                href = "/"+voting.nextToolType+"/index/"+voting.nextTool.id
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

            brokerMessagingTemplate.convertAndSendToUser(meeting.facilitator.username,"/queue/consensusNextStep",builder.toString())
            sleep(100)
            for (user in meeting.participants){
                brokerMessagingTemplate.convertAndSendToUser(user.username,"/queue/consensusNextStep",builder.toString())
            }
            ToolController.setNextTool(toolId)
        }    
    }
}
