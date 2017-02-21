// graph.c
// Erik Mudrak
// Principles of Programming Languages - Fall 2016
// graph function implementations

#include "graph.h"

// readGraph: 
// Reads input file graph in to graph datatype 
void readGraph (FILE *f, STRING fileName, EDGE *g) {
	// Throw main fn's file reading code in here
	int size = 0;

	// Open file and retrieve graph information from it until the end:
	f = fopen(fileName, "r");
	if (f == NULL) {
		printf("File failed to open.");
	}

	// Step through the file, if we reach the end and the position returned by ftell is 0, the file is empty
	/// SOURCE: https://www.tutorialspoint.com/c_standard_library/c_function_ftell.htm
	fseek(f, 0, SEEK_END);
	if (ftell(f) == 0) {
		printf("Cannot sort: The graph is empty.\n");
	} else {
		// Start back at the beginning of the file and read nodes into graph
		fseek(f, 0, SEEK_SET);
		int i = 0;
		while (!feof(f)) {
			fscanf(f, "%s %s", g[i].startNode, g[i].endNode);
			i++;
		} 
		size = i;
	}
	fclose(f);

	// insert a sentinel at the end of the inputted graph:
	strcpy(g[size+1].startNode, SENTINEL);
	strcpy(g[size+1].endNode, SENTINEL);
}

// removeEdge:
// Takes in graph g and position i
// Removes the entire edge at i from the graph
void removeEdge (int i, EDGE *g) {
	int j;
	for (j=i; notSentinel(g[j].endNode); j++) {
		// Remove the element by putting the next element in its place, until the end of the array is reached
		strcpy(g[j].startNode, g[j+1].startNode);
		strcpy(g[j].endNode, g[j+1].endNode);
	}
}

/// noIncomingEdges: 
//	Takes in an element, array, and size 
// 	Loops through the array in search of the element.
//	Returns 1 if the node has no incoming edges, 0 if it does have incoming edges
int noIncomingEdges (STRING element, EDGE *g) {
	int i;
	// loop and compare while neither node of the graph's edge is the sentinel
	for (i=0; notSentinel(g[i].startNode) && notSentinel(g[i].endNode); i++) {
		if (!strcmp(element, g[i].endNode)) {	
			return 0;
		}
	}	
	return 1;
}
