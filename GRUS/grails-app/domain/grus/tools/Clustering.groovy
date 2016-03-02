package grus.tools
import grus.Tool
import grus.tools.data.ClusteringData
class Clustering extends Tool{
	
	static hasMany = [data : ClusteringData]
    static constraints = {
    }
    static mapping = {
    	table 'clustering_data'
    }
}
