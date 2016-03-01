package grus
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder

@Secured(['ROLE_ADMIN', 'ROLE_SUPERUSER', 'ROLE_USER'])
class MeetingController {

    def add(){
        if(request.method == 'POST'){
           
            def facilitator = User.findById(params.facilitator)
            def processModel = ProcessModel.findById(params.processModel)
            def process = new Process(modelProcess : processModel)
            process.save(flush : true)

            
            
            processModel.phasesOfModel.each{
                // create phase with the same name of model
                //def modelPhaseObject = PhaseModel.findById(value)
                
                def phase = new Phase(phaseName:it.modelPhaseName,process : process)
                phase.save(flush : true)
                def previousTool = null

                it.toolsName.each{
                    def  dc = grailsApplication.getDomainClass( 'grus.tools.'+it.toolModelName )
                    def toolObject = null
                    if(previousTool) {
                        toolObject = dc.clazz.newInstance(toolName : it.toolModelName,phase :phase,previousTool:previousTool,previousToolType:previousTool.getToolName())
                    }
                    else{
                        toolObject = dc.clazz.newInstance(toolName : it.toolModelName,phase :phase)
                    }
                    toolObject.save(flush : true, failOnError : true)
                    if(previousTool != null){
                        previousTool.nextToolType = it.toolModelName
                        previousTool.nextTool = toolObject
                        previousTool.save(flush:true)
                    }
                    previousTool = toolObject
                    phase.addToTools(toolObject)
                }
                phase.currentTool = phase.tools.asList().first()
                
                phase.save(flush:true)
               
                process.addToPhases(phase)
                

            }
            process.currentPhase = process.phases.asList().first()
            
            process.save(flush:true)
            

            def meeting = new Meeting(topic : params.topic,description:params.description,startDate:params.startDate,endDate:params.endDate,typeOfMeeting:params.typeOfMeeting,facilitator:facilitator.id,process:process)
            
           
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
        def meeting = Meeting.findById(params.id)
        def nbOfMeetings = meeting.facilitator.meetingsFacilitated.size()
        def process = meeting.process
        def modelProcess = process.modelProcess
        def phases= modelProcess.phasesOfModel
        [meeting:meeting,facilitator:meeting.facilitator,nbOfMeetings:nbOfMeetings,participants:meeting.participants,modelProcess:modelProcess,phases:phases,process:process]
    }
}
