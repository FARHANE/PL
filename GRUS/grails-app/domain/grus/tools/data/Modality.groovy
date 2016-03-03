package grus.tools.data

class Modality {
	String modalityName
	int rating = 0
	static belongsTo = [vote : VotingData]
    static constraints = {
    	sort id: "asc"
    }
}
