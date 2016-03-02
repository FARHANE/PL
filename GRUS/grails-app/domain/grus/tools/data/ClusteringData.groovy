package grus.tools.data
import grus.tools.Clustering

class ClusteringData extends Data {
	
	static hasMany = [elements : Data]
	static belongsTo = [clustering: Clustering]
    static constraints = {
    }
    static mapping ={
    	elements column: 'element_id'
    }
}
