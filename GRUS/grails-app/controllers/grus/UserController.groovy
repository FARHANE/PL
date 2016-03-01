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
       [userPicture : session.userPicture]
    }
    @Secured("permitAll")
    def signUp(){
    	
    	if(params.username &&  params.password && params.passwordConfirmation){
			if(params.password == params.passwordConfirmation){
					User user = new User(firstName:params.firstName,lastName:params.lastName,username:params.username, email:params.email, password:params.password,picture:"/users/default.gif")
					user.save(flush: true,failOnError: true)

					def authority = Role.findByAuthority("ROLE_USER")
					UserRole.create(user,authority,true)
					List<GrantedAuthority> grantedAuths = new ArrayList<GrantedAuthority>();
    				grantedAuths.add(new SimpleGrantedAuthority("ROLE_USER"));

					SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(user.username,user.password,grantedAuths)) 
					redirect(controller: "user",action:"index")
	
				
			}
		}
			
    }


}