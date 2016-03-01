package grus

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	String firstName
	String lastName
	String emailAddress
	String company
	String job
	Date created = new Date()
	Date birthday
	String picture = "/users/default.gif"
	String gender

	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	static hasMany = [meetingsFacilitated : Meeting , meetingsParticipatedIn : Meeting]
	static mappedBy = [ meetingsParticipatedIn: "participants",meetingsFacilitated : "facilitator"]
	User(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		firstName nullable : true
		lastName nullable : true
		emailAddress nullable : true
		company nullable : true
		job nullable : true
		birthday nullable : true
		picture nullable : true
		gender nullable : true,inList: ["M","F"]

	}

	static mapping = {
		password column: '`password`'
	}
}
