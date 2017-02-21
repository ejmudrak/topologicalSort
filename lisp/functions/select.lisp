;;;; select:
;; Returns all of the list that occurs after the inputted element's value

(defun select (element list)
	(cond 
		((null list) nil)
		((eql element (first list)) (rest list))
		(T (select element (rest list)))	
	)
)
