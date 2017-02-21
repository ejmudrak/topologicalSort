// Graph.java
// Erik Mudrak
// Principles of Programming Languages - Fall 2016
// Graph class:
// 	Defines a graph as an array of edges, with methods to construct the graph and sort its nodes 

import java.util.*;
import java.util.List;
import java.io.*;

public class Graph {

	//// ----- VARIABLES ----- ////

	private Vector<Edge> graph = new Vector<Edge>();

	//// ----- METHODS ----- ////

	// topologicalSort:
	//	Sorts graph topologically and returns sorted list L
	public List topologicalSort() {

		// S: set of all start nodes with no incoming edges. Implemented with properties of a linked list.
		// LinkedHashSet source: https://docs.oracle.com/javase/7/docs/api/java/util/LinkedHashSet.html
		Set<String> S = new LinkedHashSet<String>();

		// We fill set S with its initial contents, so that sorting may begin
		getNodesWithNoIncomingEdges(S);

		// L: The empty list, which will be filled with sorted nodes of the graph
		List<String> L = new ArrayList<String>();

		// Nodes n and m, corresponding to the current start and end node
		String n, m;

		// Loop until there are no more nodes to sort
		while (!S.isEmpty()) {
			n = getFirstElement(S); 
			S.remove(n);
			L.add(n);

			// loops through every edge of the graph, checking if the current node and node N match
			for (int i=0; i < graph.size(); i++) {

				// Loop through the graph, comparing n to each start node
				if (n.equals(graph.elementAt(i).getStartNode())) {
					m = graph.elementAt(i).getEndNode();

					// Remove that edge from the graph, and decrement i so that we don't skip edges
					graph.remove(i);
					i--;

					if (noIncomingEdges(m)) {
						S.add(m);
					}
				}
			}
		}
		// if the graph is not empty, then we know that the graph is cyclic
		if (!graph.isEmpty()) {
			System.out.println("Error: Graph is cyclic, cannot sort.");
			System.exit(1);
		}
		return L;
	} 

	/// getNodesWithNoIncomingEdges:
	// Takes in (empty) set and creates S,
	// 	by looping through the startNode of each edge, providing a set of all nodes with no incoming edges
	public void getNodesWithNoIncomingEdges(Set<String> set) {
		for (int i=0; i<graph.size(); i++) {
			String currentNode = graph.elementAt(i).getStartNode();
			if (noIncomingEdges(currentNode)) {
				set.add(currentNode);
			}
		}
	}

	/// noIncomingEdges: 
	//	Takes in an element
	// 	Loops through the array in search of the element, if found the element is an incoming edge 
	//	Returns 1 if the node has no incoming edges, 0 if it does have incoming edges
	public Boolean noIncomingEdges(String element) {
		for (int i=0; i < graph.size(); i++) {
			if ( element.equals(graph.elementAt(i).getEndNode()) ) {
				return false;
			}
		}
		return true;
	}

	// getFirstElement:
	//	Utilizes an iterator to find indices of the set, so that we can return the element at the first index
	//	Iterator source: https://docs.oracle.com/javase/8/docs/api/java/util/LinkedHashSet.html
	public String getFirstElement(Set<String> set) {
		Iterator<String> it = set.iterator(); 
		return it.next();
	}

	//// ----- CONSTRUCTOR ----- /////

	Graph(BufferedReader reader) {

		String line;
		String[] lineStrings;
		try { 
			// method ready() checks if the BufferedReader is empty, so we can catch empty files
			if (!reader.ready()) {
				System.out.println("Error: File is empty, cannot sort.");
				System.exit(1);
			}
			// Add characters to node until a space is detected
			for (int i=0; (line = reader.readLine()) != null; i++) {

				Edge edge = new Edge(); 

				// Split line into two 'nodes', space delimited. 
				// Source: http://docs.oracle.com/javase/7/docs/api/java/lang/Stringraph.html#split(java.langraph.String)
				lineStrings = line.split(" ");
				edge.setStartNode(lineStrings[0]);
				edge.setEndNode(lineStrings[1]);
				graph.add(edge);
			}
		}
		catch (IOException e) {
			System.out.printf("Error: Not readable\n");
		}
	}
};
