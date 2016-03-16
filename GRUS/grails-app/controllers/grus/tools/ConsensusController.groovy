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
import grus.User
import grus.ToolsModelOfPhaseModel
import grus.ToolModel

@Secured(['ROLE_ADMIN', 'ROLE_SUPERUSER', 'ROLE_USER'])
class ConsensusController {
    SimpMessagingTemplate brokerMessagingTemplate
    def index() { 
    	def voting = Voting.findById(params.id)
        def meeting = ToolController.getMeetingFromPhase(voting.phase)
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
    	        
    	[voting:voting,charts:charts,isFacilitator:isFacilitator,,meeting:meeting,itemPhase:itemPhase,modelProcess:modelProcess,phases:phases,process:process,position:position]
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
