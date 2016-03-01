package grus

class Tool {
	String toolName
	static belongsTo = [ phase : Phase]
	Date created = new Date()
	String nextToolType
	Tool nextTool	
	String previousToolType
	Tool previousToolUUID
    static constraints = {
		toolName nullable: false,blank:false
		nextToolUUID nullable:true
		nextToolType nullable:true
		previousToolUUID nullable:true
		previousToolType nullable:true
		phase nullable : true
		nextTool nullable : true
    }
    static mapping = {
		toolName index: true
		
	}
	
}
