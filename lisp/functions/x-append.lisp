;; x-append:
;;	append listA to listB

(defun x-append (listA listB)
	(cond 
		((null listA) listB)
		(T(cons (first listA) (x-append (rest listA) listB)))
	)
)
