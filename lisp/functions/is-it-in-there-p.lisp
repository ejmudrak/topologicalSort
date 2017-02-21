;; Is it in there?

(defun is-it-in-there-p (element list)
	(cond 
		((null list) nil)
		((eql element (first list)) T)
		(T (is-it-in-there-p element (rest list)))
	)
)