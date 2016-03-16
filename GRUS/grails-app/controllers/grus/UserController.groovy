package grus
import grus.UserRole
import grus.Role
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
@Secured(['ROLE_ADMIN', 'ROLE_SUPERUSER', 'ROLE_USER'])
class UserController {
	
    def index() {// the dashboard view
       def auth = SecurityContextHolder.getContext().getAuthentication()
       def user = User.findByUsername(auth.getName())
       session.userPicture = user.picture
       session.username = user.username
       session.userRole = UserRole.findByUser(user).role

       
       def publicMeeting = Meeting.countByTypeOfMeeting('public')
       def privateMeeting = Meeting.countByTypeOfMeeting('private')
       def finishedMeeting = Meeting.countByState('finished')
       def meetingNumber = Meeting.count()
       def userNumber = User.count()
       /**/
      
       [userPicture : session.userPicture,meetingNumber:meetingNumber,finishedMeeting:finishedMeeting,publicMeeting:publicMeeting,privateMeeting:privateMeeting,userNumber:userNumber]
    }
    def profile(){
    	def auth = SecurityContextHolder.getContext().getAuthentication()
        def user = User.findByUsername(auth.getName())
        def servletContext = request.getSession().getServletContext()
       // def picture = user.picture.substring(servletContext)
        //render picture
    	[user:user]
    }
    @Secured("permitAll")
    def signUp(){
    	
    	if(params.username &&  params.password && params.passwordConfirmation){
			if(params.password == params.passwordConfirmation){
					User user = new User(firstName:params.firstName,lastName:params.lastName,username:params.username, email:params.email, password:params.password,picture:"/users/default.gif")
					user.save(flush: true,failOnError: true)

					def authority = Role.findByAuthority("ROLE_SUPERUSER")
					UserRole.create(user,authority,true)
					List<GrantedAuthority> grantedAuths = new ArrayList<GrantedAuthority>();
    				grantedAuths.add(new SimpleGrantedAuthority("ROLE_SUPERUSER"));

					SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(user.username,user.password,grantedAuths)) 
					redirect(controller: "user",action:"index")
	
				
			}
		}
			
    }
    def uploadImage() {
	    def file = request.getFile('picture')
	    if (file.empty) {
	    	flash.messageTitle ="Error ! in uploading image"
	        flash.message = 'file cannot be empty'
	        flash.messageType= "note-danger"
	        render(view: 'userNotification')
	        return
	    }
	    def servletContext = request.getSession().getServletContext()
	    def destinationDirectory = "/images/users"
        def storagePath = servletContext.getRealPath(destinationDirectory)

        // Create storage path directory if it does not exist
        def storagePathDirectory = new File(storagePath)
        if (!storagePathDirectory.exists()) {
            print "CREATING DIRECTORY ${storagePath}: "
            if (storagePathDirectory.mkdirs()) {
                println "SUCCESS"
            } else {
                println "FAILED"
            }
        }
        def auth = SecurityContextHolder.getContext().getAuthentication()
        def name = auth.getName()+".jpg"
        // Store file
        if (!file.isEmpty()) {
            file.transferTo(new File("${storagePath}/${name}"))
            println "Saved file: ${storagePath}/${name}"
            def user = User.findByUsername(auth.getName())
		    print user.username
		    user.picture= "${name}"
		    session.userPicture = user.picture
		    user.save(failOnError: true,flush: true)
		    
		   // session.user.picture = "${storagePath}/${name}"
	    redirect(action:"profile", user:user)

        } else {
            println "File ${file.inspect()} was empty!"
            
        }  
	}
	def changeProfile(){
		if(request.method == 'POST'){
			try{

    		def auth = SecurityContextHolder.getContext().getAuthentication()
    		def user = User.findByUsername(auth.getName())
    		user.firstName = params.firstName
	    	user.lastName = params.lastName
	    	user.gender = params.gender
	    	user.company = params.company
	    	user.job = params.job
	    	user.emailAddress = params.emailAddress
	    	
	    	user.save(failOnError: true,flush: true)
    		flash.messageTitle ="Great !"
            flash.message = "Your profile was been updated"
            flash.messageType= "note-success"
            render(view: '/user/userNotification')
    	}
    	catch(e){
            flash.messageTitle ="Ooops !"
            flash.message = "Someting wrong!"
            flash.messageType= "note-danger"
            render(view: '/user/userNotification')
    		
    	}
		}
		def auth = SecurityContextHolder.getContext().getAuthentication()
    	def user = User.findByUsername(auth.getName())
		render(view: '/user/profile',model:[user:user])
    	
    }
    def changePassword(){
		if(request.method == 'POST'){
			try{
			if(params.password == params.passwordConfirmation){
				def auth = SecurityContextHolder.getContext().getAuthentication()
    			def user = User.findByUsername(auth.getName())	
    			user.setPassword(params.password)
	    		user.save(failOnError: true,flush: true)
	    		flash.messageTitle ="Great !"
	            flash.message = "Your profile was been updated"
	            flash.messageType= "note-success"
	            render(view: '/user/userNotification')
			}
    		
	    	
    	}
    	catch(e){
    			flash.messageTitle ="Ooops !"
	            flash.message = "Someting wrong"
	            flash.messageType= "note-danger"
	            render(view: '/user/userNotification')
    	}
		}
        flash.messageTitle ="Great !"
                flash.message = "Your profile was been updated"
                flash.messageType= "note-success"
                render(view: '/user/userNotification')
		def auth = SecurityContextHolder.getContext().getAuthentication()
    	def user = User.findByUsername(auth.getName())
		render(view: '/user/profile',model:[user:user])
    	
    }

}