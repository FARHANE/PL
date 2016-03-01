package grus
import grus.Phase
import grus.Process
import grus.Meeting
class ToolController {
    static def getMeetingFromPhase(phase){
     	def process = phase.process
     	def meeting = process.meeting
     	return meeting
     }
     static def isFacilitatorOfMeeting(Meeting meeting,int userId){
     	return (meeting.facilitator.id == userId)
     }
}
