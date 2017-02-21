;; n-element:
;;	Determines nth element of list

(defun n-element (n list)
	(cond 
		((null list) nil)
		((= n 0) (first list))
		(T(n-element (- n 1) (rest list)))
	)
)