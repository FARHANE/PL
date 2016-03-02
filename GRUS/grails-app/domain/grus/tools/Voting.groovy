package grus.tools
import grus.Tool
import grus.tools.data.VotingData
class Voting extends Tool{

	static hasMany = [data : VotingData]
    static constraints = {
    }
    static mapping ={
    	data column: 'votes'
    }
}
