package grus

class PhaseModel {
	String modelPhaseName
	static hasMany =  [toolsName : ToolModel]
    static constraints = {
    	toolsName nullable:true
    }
}
