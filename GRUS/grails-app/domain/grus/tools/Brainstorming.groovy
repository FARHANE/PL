package grus.tools
import grus.Tool
import grus.tools.data.BrainstormingData
class Brainstorming extends Tool{

	static hasMany = [ideas : BrainstormingData]
    static constraints = {
    }
}
