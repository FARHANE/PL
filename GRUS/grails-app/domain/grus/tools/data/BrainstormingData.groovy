package grus.tools.data
import grus.User
import grus.tools.Brainstorming
// idea
class BrainstormingData {
	String data
	User author
	Date created = new Date()
	static belongsTo = [brainstorming : Brainstorming]
    static constraints = {
    	author nullable : true
    }
}
