;;;; minimum
;; Finds minimum value in list
;; kinda sorta augmented

(defun minimum (list) 
	(cond
		((null list) 100)
		((< (first list) (minimum (rest list))) (first list))
		(T(minimum(rest list)))
	)
)