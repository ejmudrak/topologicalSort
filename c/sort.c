// sort.c
// Erik Mudrak
// Principles of Programming Languages - Fall 2016
// Main program. Sorts a direct acyclic graph in topological order.
// Use 'make' to compile and link 
// Use './sort fileName.txt' to run and sort

	//// The Algorithm:
	// L ← Empty list that will contain the sorted elements
	// S ← Set of all nodes with no incoming edges
	// while S is non-empty do
	//     remove a node n from S
	//     add n to tail of L
	//     for each node m with an edge e from n to m do
	//         remove edge e from the graph
	//         if m has no other incoming edges then
	//             insert m into S
	// if graph has edges then
	//     return error (graph has at least one cycle)
	// else 
	//     return L (a topologically sorted order)

#include "sort.h"

STRING setL[MAXGRAPHSIZE] = {SENTINEL};		// Empty set that will contain the sorted elements
STRING setS[MAXGRAPHSIZE] = {SENTINEL};		// Set of all nodes with no incoming edges 

//// MAIN FUNCTION ////
int main (int argc, char **argv) 
{
	STRING graphName;
	strcpy(graphName, argv[1]);
	readGraph(graphFile, graphName, graph);

	// get set S: all nodes with no incoming edges
	getS(setS, graph);


	int i = 0;
	int j;
	STRING nodeN, nodeM;
	STRING first;
	strcpy(first, graph[i].startNode);

	// Increment through array while the current element does not equal the SENTINEL
	while (notSentinel(setS[i])) { 
	
		strcpy(nodeN, setS[i]); 
		removeNodeN(setS);
		insertAtEnd(nodeN, setL);

		// loops through every edge of the graph, checking if the current node and node N match
		for (j=0; notSentinel(graph[j].startNode); j++) {

			if (!strcmp(nodeN, graph[j].startNode)) {
				strcpy(nodeM, graph[j].endNode);

				// They're equal? Remove that edge from the graph, and decrement j so that we don't skip edges
				removeEdge(j, graph);
				j--;

				if (noIncomingEdges(nodeM, graph)) {
					insertAtEnd(nodeM, setS);
				}
			}
		}
	}

	// Check if the graph has edges, if so then it is cyclic
	for (i = 0; notSentinel(graph[i].startNode); i++) {
		strcpy(nodeN, graph[i].startNode);
		if (strcmp("", nodeN)) {
			// We know it is cyclic if nodeN HAS incoming edge(s)
			if (!noIncomingEdges(nodeN, graph)) {
				printf("Error. Graph is cyclic.\n");
				return 0;	
			}
		}
	}
	// We made it to the end of the program:
	// return L, the topologically sorted set
	printSet(setL);
}

