// Edge.java
// Erik Mudrak
// Principles of Programming Languages - Fall 2016
// Edge class: 
//	Defines an edge as a pair of nodes (start, end)

public class Edge {

	private String startNode;
	private String endNode;

	// constructor
	Edge () {
	}

	public void setStartNode(String node) {
		startNode = node;
	}

	public void setEndNode(String node) {
		endNode = node;
	}

	public String getStartNode() {
		return startNode;
	}

	public String getEndNode() {
		return endNode;
	}
};
