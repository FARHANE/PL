package grus.tools.data
import grus.User
import grus.tools.Brainstorming
// idea
class BrainstormingData extends Data{
	
	User author
	String comment = null
	static belongsTo = [brainstorming : Brainstorming]
    static constraints = {
    	author nullable : true
    	comment nullable : true
    }
}
