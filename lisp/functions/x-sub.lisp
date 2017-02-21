;; x-sub:
;;	Takes 2 elements and list, returns list with the first element replaced with the second

(defun x-sub (old new list)
	(cond 
		((null list) nil)
		((eql old (first list)) (cons new (x-sub old new (rest list))))
		(T (cons(first list) (x-sub old new (rest list))))
	)
)