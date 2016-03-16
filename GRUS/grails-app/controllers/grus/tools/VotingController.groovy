package grus.tools
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.core.Authentication
import grus.ToolController
import grus.User
import grus.Meeting
import grus.tools.data.Data
import grus.tools.data.VotingData
import grus.tools.data.Modality
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import groovy.json.JsonBuilder
import groovy.json.JsonSlurper
import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.simp.SimpMessagingTemplate
import grus.ToolsModelOfPhaseModel
import grus.ToolModel
import java.security.Principal
@Secured(['ROLE_ADMIN', 'ROLE_SUPERUSER', 'ROLE_USER'])


class VotingController {
    SimpMessagingTemplate brokerMessagingTemplate
    def index() { 
    	def voting = Voting.findById(params.id)
        if(voting.previousTool == null ){
            flash.messageTitle ="Ooops !"
            flash.message = "The meeting can not start with a voting "
            flash.messageType= "note-danger"
            render(view: '/user/userNotification')
        }
        else{
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
            def previousTool = voting.previousTool
            def data = previousTool.data
            if(isFacilitator && voting.data.isEmpty()){// create votingdata if that not existe
                for( element in data){// for echa item in the previous tool we create a votingData
                    def vote = new VotingData(voting: voting,field :element.field ,item :element).save(flush : true,failOnError :  true)
                    voting.addToData(vote) // add votingdata to voting
                }
                voting.save(flush:true)
            }
            def votes = voting.data
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
                    
            [voting:voting,votes:votes,data:data,isFacilitator:isFacilitator,meeting:meeting,itemPhase:itemPhase,modelProcess:modelProcess,phases:phases,process:process,position:position]
        }
    	
    }
    def saveModality(){
        
        if(request.method == 'POST'){
            def modalityJson = new JsonSlurper().parseText(request.getParameter("modalityVote"))
            println modalityJson.modalityText

            def voteData = VotingData.findById(modalityJson.voteId)

            def modality = new Modality(vote: voteData,modalityName :modalityJson.modalityText).save(flush:true,failOnError:true)
            
            voteData.addToModalities(modality)
            voteData.save(flush:true) 
            render modality.id

              
        }   
    }
    @MessageMapping("/addModality")
    protected String addModality(String newModalityID, Principal principal) {

        Voting.withTransaction{ status ->
                
                def modality = Modality.findById(newModalityID)     
                
                def builder = new JsonBuilder()
                builder {
                        modalityName(modality.modalityName)
                        modalityId(modality.id)
                        voteId(modality.vote.id)
                       // clusterName(cluster.field)
                }
                

                def voting = modality.vote.voting

                def phase = voting.phase
                def process = phase.process
                def meeting = process.meeting
                brokerMessagingTemplate.convertAndSendToUser(meeting.facilitator.username,"/queue/addModality",builder.toString())

                for (user in meeting.participants){
                    brokerMessagingTemplate.convertAndSendToUser(user.username,"/queue/addModality",builder.toString())
                }

            } 
    }
    def addRating(){
        
        if(request.method == 'POST'){
            def modalityJson = new JsonSlurper().parseText(request.getParameter("modality"))
            

            def modality = Modality.findById(modalityJson.modalityId)

            modality.rating++
            modality.save(flush : true)
            
            render modality.id

              
        }   
    }
    @MessageMapping("/votingNextStep")
    protected String votingNextStep(String toolId, Principal principal) {       
        Voting.withTransaction{ status ->
            def voting = Voting.findById(toolId)
            def phase = voting.phase
            def process = phase.process
            def meeting = process.meeting
            def href = null
            href = "/Consensus/index/"+toolId
             
            def builder = new JsonBuilder()
            builder {
                location(href)                
            }

            brokerMessagingTemplate.convertAndSendToUser(meeting.facilitator.username,"/queue/votingNextStep",builder.toString())
            sleep(100)
            for (user in meeting.participants){
                brokerMessagingTemplate.convertAndSendToUser(user.username,"/queue/votingNextStep",builder.toString())
            }
            ToolController.setNextTool(toolId)
        }    
    }


}
