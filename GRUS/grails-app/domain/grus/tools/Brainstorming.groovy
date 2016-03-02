package grus.tools
import grus.Tool
import grus.tools.data.BrainstormingData
class Brainstorming extends Tool{
	
	static hasMany = [data : BrainstormingData]
    static constraints = {
    }
    static mapping = {
    	table 'brainstorming_data'
    }
}
