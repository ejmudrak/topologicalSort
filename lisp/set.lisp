;;;; set.lisp
;;;; Erik Mudrak, Fall 2016
;;;; Contains all functions associated with the set datatype for topologically sorting a DAG 

;; get-s: returns the set S of all nodes with no incoming edges
(defun get-s (src-nodes dest-nodes)
	(get-s-hlpr src-nodes dest-nodes nil)
)

;; get-s-hlpr: tail recursively creates set S
(defun get-s-hlpr (src-nodes dest-nodes set-s)
	(cond
		; when we get to the end of src nodes, we're done! Reversed so that it comes out in correct order
		((is-it-empty-p src-nodes) (reverse set-s))

		;; check if first element of src nodes is a member of dest nodes
		; yes? we don't want that src node, drop it and move on to the next element of src nodes
		((member (first src-nodes) dest-nodes) (get-s-hlpr (rest src-nodes) dest-nodes set-s))
		
		; if element of src-nodes is already a part of s, skip it to avoid duplicates
		((member (first src-nodes) set-s) (get-s-hlpr (rest src-nodes) dest-nodes set-s))

		; no? great, we want that element. Put it in set-s and move on to the next element of src nodes
		(T (get-s-hlpr (rest src-nodes) dest-nodes (cons (first src-nodes) set-s)))
	)
)

;; insert-m-into-s: Loops through each source node n and looks for destination nodes m with no incoming edges to insert into set s
;; Pre-condition: takes in the source node n, set S, and graph
;; Post-condition: Returns an updated set-s with dest node m added
(defun insert-m-into-s (node-n set-s graph) 

	;; loop through each node m with an edge e from n to m
	(cond
		((is-it-empty-p graph) set-s)
		((is-it-empty-p node-n) set-s)
		((eql node-n (get-node-n graph))
			(insert-m-into-s node-n 
				(insert-end (get-m (get-node-m graph) (remove-edge graph)) set-s) (rest graph)))
		(T (insert-m-into-s node-n set-s (rest graph)))
	)
)

;; clear-nils: goes through list and removes all nils
(defun clear-nils (list)
  (clear-nils-hlpr nil list)
)

(defun clear-nils-hlpr (element list)
  (apply #'append 
  	(mapcar #'(lambda(x) 
  		(cond
			((eql element x) nil)
			(T(list x)))) 
  		list))
)
