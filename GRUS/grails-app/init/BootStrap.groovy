import grus.User
import grus.Role
import grus.UserRole
import grus.ToolModel
import grus.ProcessModel
import grus.PhaseModel
import grus.ToolsModelOfPhaseModel

class BootStrap {

    def init = { servletContext ->
        /*  To not delete this
        */
    	def roleAdmin = new Role('ROLE_ADMIN').save(flush:true)
    	def roleUser = new Role('ROLE_USER').save(flush:true)
    	def roleFacilitator = new Role('ROLE_SUPERUSER').save(flush:true)
    	/*******************************************/
        /*  To not delete this
            if you add a tool to your application please create a ToolModel for this tool
            (see the exaples below )
        */
        def tool01 =  new ToolModel(toolModelName:"Brainstorming",toolModelDescription:"a tool that's let you echange ideas",icon:"fa-users",label:"label-yellow")
        def tool02 =  new ToolModel(toolModelName:"Clustering",toolModelDescription:"make a cluster of group of ideas",icon:"fa-puzzle-piece",label:"label-blue")
        def tool03 =  new ToolModel(toolModelName:"Voting",toolModelDescription:"let you make a vote a bout a topic",icon:"fa-thumbs-o-up",label:"label-orange")
        tool01.save(flush:true)
        tool02.save(flush:true)
        tool03.save(flush:true)
        def phase01 = new PhaseModel(modelPhaseName : "phase N° :01 (Brainstorming -> Clustering -> Voting)")
        def phase02 = new PhaseModel(modelPhaseName : "phase N° :02 (Brainstorming -> Voting)")
        def phase03 = new PhaseModel(modelPhaseName : "phase N° :03 (Brainstorming -> Voting -> Clustering -> Voting)")
        phase01.save(flush:true)
        phase02.save(flush:true)
        phase03.save(flush:true)
        new ToolsModelOfPhaseModel(phase : phase01,tool : tool01).save(flush : true)
        new ToolsModelOfPhaseModel(phase : phase01,tool : tool02).save(flush : true)
        new ToolsModelOfPhaseModel(phase : phase01,tool : tool03).save(flush : true)

        new ToolsModelOfPhaseModel(phase : phase02,tool : tool01).save(flush : true)
        new ToolsModelOfPhaseModel(phase : phase02,tool : tool03).save(flush : true)

        new ToolsModelOfPhaseModel(phase : phase03,tool : tool01).save(flush : true)
        new ToolsModelOfPhaseModel(phase : phase03,tool : tool03).save(flush : true)
        new ToolsModelOfPhaseModel(phase : phase03,tool : tool02).save(flush : true)
        new ToolsModelOfPhaseModel(phase : phase03,tool : tool03).save(flush : true)

        def processModel01 = new ProcessModel(processModelName : "Process N° : 01",processModelDescription: "The process has one phase that contain Brainstorming, Clustering and Voting in this order")
        processModel01.addToPhasesOfModel(phase01)
        processModel01.save(flush : true)

        def processModel02 = new ProcessModel(processModelName : "Process N° : 02",processModelDescription: "The process has two phases the first contain (Brainstorming, Voting)  the second contain (Brainstorming, Voting, Clustering, Voting)")
        processModel02.addToPhasesOfModel(phase02)
        processModel02.addToPhasesOfModel(phase03)
        processModel02.save(flush : true)

        /****************************************************/

        
        def grus =new User(firstName:"Cheryl",lastName:"Todd",emailAddress:"vitae.diam.Proin@loremtristique.co.uk",username:"grus",password:"grus",gender:"M",job:"Student",company:"ENSEEIHT",picture:"users/default.gif").save(flash:true)
        def admin =new User(firstName:"Hunter",lastName:"Zelda",emailAddress:"eros@fermentumrisusat.com",username:"admin",password:"admin",gender:"M",job:"Student",company:"ENSEEIHT",picture:"users/default.gif").save(flash:true)
        def facilitator =new User(firstName:"Giselle",lastName:"Wade",emailAddress:"eu@sollicitudin.edu",username:"facilitator",password:"facilitator",gender:"M",job:"Student",company:"ENSEEIHT",picture:"users/default.gif").save(flash:true)
        
        def user01 =new User(firstName:"Holly",lastName:"Aiko",emailAddress:"Aenean@blanditmattis.org",username:"user01",password:"user",gender:"M",job:"Student",company:"ENSEEIHT",picture:"users/default.gif").save(flash:true)
        def user02 =new User(firstName:"Mannix",lastName:"Lara",emailAddress:"neque@non.com",username:"user02",password:"user",gender:"M",job:"Student",company:"ENSEEIHT",picture:"users/default.gif").save(flash:true)
        def user03 =new User(firstName:"Marshall",lastName:"Summer",emailAddress:"lacus@molestie.ca",username:"user03",password:"user",gender:"M",job:"Student",company:"ENSEEIHT",picture:"users/default.gif").save(flash:true)
        
        UserRole.create(grus,roleFacilitator,true)
        UserRole.create(admin,roleFacilitator,true)
    	UserRole.create(facilitator,roleFacilitator,true)
        UserRole.create(user01,roleFacilitator,true)
        UserRole.create(user02,roleFacilitator,true)
    	UserRole.create(user03,roleFacilitator,true)


    

    }
    def destroy = {
    }
}
