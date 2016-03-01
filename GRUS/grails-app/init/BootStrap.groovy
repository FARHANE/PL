import grus.User
import grus.Role
import grus.UserRole
import grus.ToolModel
class BootStrap {

    def init = { servletContext ->
    	def roleAdmin = new Role('ROLE_ADMIN').save(flush:true)
    	def roleUser = new Role('ROLE_USER').save(flush:true)
    	def roleFacilitator = new Role('ROLE_SUPERUSER').save(flush:true)
    	def user01 =  new User(username : "happy1991",password : "123123",firstName : "FARHANE",picture:"/users/default.gif").save(flush:true)
    	def user02 =  new User(username : "omar1991",password : "123123",firstName : "OMAR").save(flush:true)
    	def user03 =  new User(username : "stof",password : "123123",firstName : "MOUSTAPHA").save(flush:true)
    	def user04 =  new User(username : "imad1991",password : "123123",firstName : "IMAD").save(flush:true)
    	UserRole.create(user01,roleFacilitator,true)
    	UserRole.create(user02,roleUser,true)
    	UserRole.create(user03,roleFacilitator,true)
    	UserRole.create(user04,roleUser,true)

        def tool01 =  new ToolModel(toolModelName:"Brainstorming",toolModelDescription:"a tool that's let you echange ideas",icon:"fa-users",label:"label-yellow")
        def tool02 =  new ToolModel(toolModelName:"Clustering",toolModelDescription:"make a cluster of group of ideas",icon:"fa-puzzle-piece",label:"label-blue")
        def tool03 =  new ToolModel(toolModelName:"Voting",toolModelDescription:"let you make a vote a bout a topic",icon:"fa-thumbs-o-up",label:"label-orange")
        tool01.save(flush:true)
        tool02.save(flush:true)
        tool03.save(flush:true)
    }
    def destroy = {
    }
}
