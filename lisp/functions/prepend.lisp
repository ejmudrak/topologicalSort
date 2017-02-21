;;;; prepend
;; Add element to beginning of list

(defun prepend (element list)
	(cond 
		((null list) nil)
		(T (cons element list))
	)
)