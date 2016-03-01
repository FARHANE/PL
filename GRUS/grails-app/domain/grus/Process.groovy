package grus

class Process {
	
	ProcessModel modelProcess
	Phase currentPhase
	static belongsTo =[ meeting : Meeting]
	static hasMany = [phases : Phase]
	static constraints = {
		modelProcess nullable: true
		currentPhase nullable : true
		phases nullable : true
		meeting nullable:true
    }
}
