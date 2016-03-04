import grus.User
import grus.Role
import grus.UserRole
import grus.ToolModel
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
        /****************************************************/

        
        def grus =new User(firstName:"Cheryl",lastName:"Todd",emailAddress:"vitae.diam.Proin@loremtristique.co.uk",username:"grus",password:"grus",gender:"M",job:"Student",company:"ENSEEIHT",picture:"users/default.gif").save(flash:true)
        def admin =new User(firstName:"Hunter",lastName:"Zelda",emailAddress:"eros@fermentumrisusat.com",username:"admin",password:"admin",gender:"M",job:"Student",company:"ENSEEIHT",picture:"users/default.gif").save(flash:true)
        def facilitator =new User(firstName:"Giselle",lastName:"Wade",emailAddress:"eu@sollicitudin.edu",username:"facilitator",password:"facilitator",gender:"M",job:"Student",company:"ENSEEIHT",picture:"users/default.gif").save(flash:true)
        
        def user01 =new User(firstName:"Holly",lastName:"Aiko",emailAddress:"Aenean@blanditmattis.org",username:"user01",password:"user",gender:"M",job:"Student",company:"ENSEEIHT",picture:"users/default.gif").save(flash:true)
        def user02 =new User(firstName:"Mannix",lastName:"Lara",emailAddress:"neque@non.com",username:"user02",password:"user",gender:"M",job:"Student",company:"ENSEEIHT",picture:"users/default.gif").save(flash:true)
        def user03 =new User(firstName:"Marshall",lastName:"Summer",emailAddress:"lacus@molestie.ca",username:"user03",password:"user",gender:"M",job:"Student",company:"ENSEEIHT",picture:"users/default.gif").save(flash:true)
        


        UserRole.create(grus,roleAdmin,true)
        UserRole.create(admin,roleAdmin,true)

    	UserRole.create(facilitator,roleFacilitator,true)

        UserRole.create(user01,roleUser,true)
        UserRole.create(user02,roleUser,true)
    	UserRole.create(user03,roleUser,true)
    

    }
    def destroy = {
    }
}
