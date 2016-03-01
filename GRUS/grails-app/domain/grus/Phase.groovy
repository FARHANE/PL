package grus

class Phase{

    String phaseName
    static belongsTo = [ process : Process]
    Tool currentTool
    static hasMany =[ tools : Tool]
    Date created = new Date()

    static constraints = {
        tools nullable: true
        currentTool nullable:true
        process nullable:true
        currentTool nullable : true
        

    }
    static mapping = {
        phaseName index : true
        
    }
    
}