package grus.tools.data
import grus.User
import grus.tools.Brainstorming
// idea
class BrainstormingData extends Data{
	
	User author
	
	static belongsTo = [brainstorming : Brainstorming]
    static constraints = {
    	author nullable : true
    }
}
