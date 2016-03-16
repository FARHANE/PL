package grus
import grus.Phase
import grus.Process
import grus.Meeting
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_SUPERUSER', 'ROLE_USER'])
class ToolController {
    static def getMeetingFromPhase(phase){
     	def process = phase.process
     	def meeting = process.meeting
     	return meeting
     }
     static def isFacilitatorOfMeeting(Meeting meeting,int userId){
     	return (meeting.facilitator.id == userId)
     }
	 
	 static def setNextTool (id){
		 
		 def tool = Tool.findById(id)
		 def phase = tool.phase
		 if(tool.nextTool!=null){
			 phase.currentTool = tool.nextTool
			 phase.save(flush:true)
		 }		 
		 else
		 {
			def process = phase.process
			if(process.currentPhase.nextPhase==null)
			{
				// end meeting
			}			
			else
			{
				process.currentPhase = phase.nextPhase
				process.save(flush:true)
			}
			
		 }
	 }
}