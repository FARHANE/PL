package grus.tools.data
import grus.tools.Voting
class VotingData extends Data{

	static hasMany= [modalities : Modality]

	Data item
	static belongsTo = [voting: Voting]
    static constraints = {
    }
    static mapping ={
    	
    }
}
