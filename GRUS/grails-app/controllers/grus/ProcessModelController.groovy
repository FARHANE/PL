package grus
import grails.converters.JSON
import grails.web.JSONBuilder
import groovy.json.JsonSlurper
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN', 'ROLE_SUPERUSER'])
class ProcessModelController {

    def createProcessModel(){

        if(request.method == 'POST'){
            def processModel = new ProcessModel(processModelName : params.modelName, processModelDescription: params.modelDescription)
            processModel.save(flush:true)
            def converter = params as JSON
            def inputJSON = new JsonSlurper().parseText(converter.toString())
            
            def phases =new JsonSlurper().parseText(inputJSON.phases)

            phases.each{
                def phase = new PhaseModel(modelPhaseName : it.phaseName).save(flush: true, failOnError: true)                  
                it.tools.each{
                    def toolModel = ToolModel.findByToolModelName(it)
                    new ToolsModelOfPhaseModel(phase : phase, tool: toolModel).save(flush: true, failOnError: true)                 
                }
                processModel.addToPhasesOfModel(phase)
            }
            
            processModel.save(flush:true, failOnError: true)
            
                    
        }
        def tools = ToolModel.findAll()

        [tools:tools]
        
    }
    def saveSuccess(){
        flash.messageTitle ="Process Model created with success"
        flash.message = 'Your Process Model  is created ! '
        flash.messageType= "note-success"
        render(view: '/user/userNotification')
    }
}
