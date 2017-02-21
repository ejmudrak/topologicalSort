;;;; select-position:
;; Returns all of the list that occurs after the inputted position

(defun select-position (position list)
	(cond 
		((null list) nil)
		((= position 0) (rest list))
		(T (select-position (- position 1) (rest list)))	
	)
)
