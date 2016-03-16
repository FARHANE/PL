package grus

class Phase{

    String phaseName
    static belongsTo = [ process : Process]
    Tool currentTool
    PhaseModel phaseModel
    static hasMany =[ tools : Tool]
    Date created = new Date()
    Phase nextPhase = null
    static constraints = {
        tools nullable: true
        currentTool nullable:true
        process nullable:true
        currentTool nullable : true
        nextPhase nullable:true

    }
    static mapping = {
        phaseName index : true
        
    }
    
}