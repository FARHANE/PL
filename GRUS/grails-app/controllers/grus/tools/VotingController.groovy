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
import java.security.Principal
@Secured(['ROLE_ADMIN', 'ROLE_SUPERUSER', 'ROLE_USER'])


class VotingController {

    def index() { 
    	def voting = Voting.findById(params.id)
    	

    	def previousTool = voting.previousTool
    	def data = previousTool.data
        if(voting.data.isEmpty()){// create votingdata if that not existe
            for( element in data){// for echa item in the previous tool we create a votingData
                def vote = new VotingData(field :element.field ,item :element).save(flush : true,failOnError :  true)
                voting.addToData(vote) // add votingdata to voting
            }
            voting.save(flush:true)
        }
        def votes = voting.data
    	def meeting = ToolController.getMeetingFromPhase(voting.phase)
        def auth = SecurityContextHolder.getContext().getAuthentication()
        def isFacilitator = ToolController.isFacilitatorOfMeeting(meeting,(int)auth.getPrincipal().getId())    	
    	[voting:voting,votes:votes,data:data,isFacilitator:isFacilitator]
    }
    def saveModality(){
        if(request.method == 'POST'){
            def modalityJson = new JsonSlurper().parseText(request.getParameter("modalityVote"))
            println modalityJson.modalityText

            def voteData = VotingData.findById(modalityJson.voteId)

            def modality = new Modality(modalityName :modalityJson.modalityText).save(flush:true,failOnError:true)
            
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
}
