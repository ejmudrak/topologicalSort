;;;; x-member:
;; Determines whether element is member of list

(defun x-member (element list)
	(cond 
		((null list) nil)
		((eql element (first list)) T)
		(T (x-member element (rest list)))
	)
)