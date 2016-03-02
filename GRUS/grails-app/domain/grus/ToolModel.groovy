package grus

class ToolModel {
	String toolModelName
	String toolModelDescription
	//for decoration 
	String icon = "fa-star"
	String label ="label-red"
    static belongsTo = PhaseModel
    static hasMany = [phasesModel : PhaseModel]
    static constraints = {
    	toolModelDescription nullable: true
    	toolModelName nullable:false, unique: true
    }
    static mapping={
    	toolModelName index : true
    }
}
