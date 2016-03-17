package grus
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder
import groovy.json.JsonSlurper
import org.springframework.web.multipart.MultipartFile
import grails.web.context.ServletContextHolder


@Secured(['ROLE_ADMIN', 'ROLE_SUPERUSER', 'ROLE_USER'])
class MeetingController {

    def add(){
        if(request.method == 'POST'){
            def facilitator = User.findById(params.facilitator)
            def processModel = ProcessModel.findById(params.processModel)
            def process = new Process(modelProcess : processModel)
            process.save(flush : true)
            processModel.phasesOfModel =processModel.phasesOfModel.sort{it.id}
            def currentPhase = null
            processModel.phasesOfModel.each{
            def previousTool = null
                // create phase with the same name of model
                def phase = new Phase(phaseName:it.modelPhaseName,process : process,phaseModel : it)
                phase.save(flush : true)
                def toolsModelId = ToolsModelOfPhaseModel.findAllByPhase(it) 
                toolsModelId.each{
                    def toolModel = ToolModel.findById(it.tool.id)
                    def  dc = grailsApplication.getDomainClass( 'grus.tools.'+toolModel.toolModelName )
                    def toolObject = null
                    if(previousTool) {
                        toolObject = dc.clazz.newInstance(toolName : toolModel.toolModelName,phase :phase,previousTool:previousTool,previousToolType:previousTool.getToolName())
                    }
                    else{
                        toolObject = dc.clazz.newInstance(toolName : toolModel.toolModelName,phase :phase)
                    }
                    toolObject.save(flush : true, failOnError : true)
                    if(previousTool != null){
                        previousTool.nextToolType = toolModel.toolModelName
                        previousTool.nextTool = toolObject
                        previousTool.save(flush:true)
                    }
                    previousTool = toolObject
                    phase.addToTools(toolObject)
                }
                if(phase.tools){
                    phase.currentTool = phase.tools.asList().first()
                }
                phase.save(flush:true)
                if(currentPhase!=null){
                        currentPhase.nextPhase = phase
                                           
                currentPhase.save(flush: true)
                }
                  
                currentPhase = phase
                process.addToPhases(phase)                
            }
            if(process.phases){
                process.currentPhase = process.phases.asList().first()
            }
            process.save(flush:true)
            

            def meeting = new Meeting(topic : params.topic,description:params.description,startDate:params.startDate,endDate:params.endDate,typeOfMeeting:params.typeOfMeeting,anonymat : params.anonymat,facilitator:facilitator.id,process:process)
            
           
            if(params.typeOfMeeting == "private"){
                for(userId in params.participants){
                    def user = User.findById(userId)
                    meeting.addToParticipants(user)
                }
                meeting.save(flush:true)
                facilitator.addToMeetingsFacilitated(meeting)
                facilitator.save(flush:true)
             
            }
            else{
                meeting.save(flush:true)
                facilitator.addToMeetingsFacilitated(meeting)
                facilitator.save(flush:true)
            }
            
            
            flash.messageTitle ="Meeting created with success"
            flash.message = 'Your meeting ('+meeting.topic+') is created ! '
            flash.messageType= "note-success"
            render(view: '/user/userNotification')
            return
               
        }

        else{
            def processList = ProcessModel.findAll()
            def role = Role.findByAuthority("ROLE_SUPERUSER")
            def facilitators = UserRole.findAllByRole(role).user
            def users = User.findAll()
            
            [processList:processList,facilitators:facilitators,users:users]
        }
        
    }
    def myMeetings(){
        def auth = SecurityContextHolder.getContext().getAuthentication()
        def user = User.findByUsername(auth.getName())
        def meetings = user.meetingsParticipatedIn
        

        render(view: '/meeting/listAll',model:[meetings:meetings])
    }
    def facilitatorOf(){

        def auth = SecurityContextHolder.getContext().getAuthentication()
        def user = User.findByUsername(auth.getName())
        def meetings = user.meetingsFacilitated
        render(view: '/meeting/listAll',model:[meetings:meetings])
    }
    def publicMeetings(){
        def meetings = Meeting.findAllByTypeOfMeeting('public')
        render(view: '/meeting/listAll',model:[meetings:meetings])
        
    }
    def show(){
        def user = User.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName())
        def meeting = Meeting.findById(params.id)
        def auth = SecurityContextHolder.getContext().getAuthentication()
        def isFacilitator = ToolController.isFacilitatorOfMeeting(meeting,(int)auth.getPrincipal().getId())
        def nbOfMeetings = meeting.facilitator.meetingsFacilitated.size()
        def process = meeting.process
        def modelProcess = process.modelProcess
        def currentPhase = process.currentPhase
        def currentTool = currentPhase.currentTool 
        def toolsOfCurrentPhase = currentPhase.tools.sort{it.id}
        def position = 0
        toolsOfCurrentPhase.eachWithIndex { item, index ->
            if(item.id == currentTool.id){
                position = index
            }
        
        }
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
        
        
        [isFacilitator:isFacilitator,meeting:meeting,itemPhase:itemPhase,facilitator:meeting.facilitator,position:position,nbOfMeetings:nbOfMeetings,participants:meeting.participants,modelProcess:modelProcess,phases:phases,process:process, user:user]
    }
    
    def addUser(){
        def auth = SecurityContextHolder.getContext().getAuthentication()
        def user = User.findById(auth.getPrincipal().getId())       
        def meetingJson = new JsonSlurper().parseText(request.getParameter("meeting"))
        def meeting = Meeting.findById(meetingJson.meetingId)
        meeting.addToParticipants(user)
        meeting.save(flush: true)
        user.addToMeetingsParticipatedIn(meeting)
        user.save(flush:true)       
        render user.id
    }
    def theEndMessage(){
        
    }
    def report(){
        def meeting = Meeting.findById(params.id)
        def process = meeting.process
        def modelProcess = process.modelProcess
        def phases= process.phases

        
        [meeting:meeting,facilitator:meeting.facilitator,participants:meeting.participants,modelProcess:modelProcess,phases:phases,process:process]
    }
}
