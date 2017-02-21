;;;; remove-tr
;; Remove element from list through tail recursion

(defun remove-tr (element list)
	(cond 
		((null list) (apply #'append list))
		((eql element (first list)) (cons nil (rest list)))
		(T (cons (first list) (remove-tr element (rest list))))
	)
)