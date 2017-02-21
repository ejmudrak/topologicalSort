;; Search by key, return paired element

(defun sbk (key list)
	(cond 
		((null list) nil)
		((eql key (first(first list))) (first(rest(first list))))
		(T (sbk key (rest list)))
	)
)