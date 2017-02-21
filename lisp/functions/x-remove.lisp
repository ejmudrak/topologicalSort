;; x-remove:
;;	Remove element from list
;;	Augmented recursion

(defun x-remove (element list)
	(cond
		((null list) nil)
		((eql element (first list)) (x-remove element (rest list)))
		(T(cons (first list) (x-remove element (rest list))))
	)
)