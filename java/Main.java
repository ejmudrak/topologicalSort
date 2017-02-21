// Main.java
// Erik Mudrak
// Principles of Programming Languages - Fall 2016
// Main program. Sorts a direct acyclic graph in topological order.

	//// Algorithm:
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

	import java.util.*;
	import java.util.List; // Incorrect List class was importing, needed specification
	import java.io.*;

	public class Main {
		public static void main(String[] args) {
			// Read in a file to create the graph
			String readString;
			Scanner console = new Scanner(System.in);
			System.out.printf("Type a filename, then press enter: ");
			readString = console.nextLine();
			File in = new File(readString);

			// error checking: Is the file there, and readable?
			try {
				BufferedReader reader = new BufferedReader(new FileReader(in));
				System.out.println("File found! Reading in progress...");
				Graph graph = new Graph(reader);
				List answer = graph.topologicalSort();

				System.out.printf("Found the sorted set! ");
				System.out.println(answer.toString());
			}
			catch (java.io.FileNotFoundException e) {
				System.out.println("File Not Found!");
				System.exit(1);
			}
		}
	};
