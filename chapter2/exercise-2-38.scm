(define (fold-left op initial sequence)
  (define (iter result rest)
	(if (null? rest)
		result
		(iter (op result (car rest))
			  (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (if (null? sequence)
	  initial
	  (op (car sequence)
		  (fold-right op initial (cdr sequence)))))

;; We just explain the difference between the following two expressions:
;; (fold-left - 0 (list 1 2 3 4 5))
;; (fold-right - 0 (list 1 2 3 4 5))
;;
;; First, (fold-left - 0 (list 1 2 3 4 5)) is just equal to:
;; (- (- (- (- (- 0 1) 2) 3) 4) 5)
;; namely:
;; 0 - 1 - 2 - 3 - 4 - 5
;;
;; And then, (fold-right - 0 (list 1 2 3 4 5)) is just equal to:
;; (- 1 (- 2 (- 3 (- 4 (- 5 0)))))
;; namely:
;; (1-(2-(3-(4-(5-0)))))
;;
;; So, the result of
;; (fold-right / 1 (list 1 2 3))
;; is
;; (/ 1 (/ 2 (/ 3 1)))
;; 3/2
;;
;; The result of
;; (fold-left / 1 (list 1 2 3))
;; is
;; (/ (/ (/ 1 1) 2) 3)
;; 1/6
;;
;; The result of
;; (fold-right list nil (list 1 2 3))
;; is
;; (list 1 (list 2 (list 3 nil)))
;; (1 (2 (3 ())))
;;
;; The result of
;; (fold-left list nil (list 1 2 3))
;; is
;; (list (list (list nil 1) 2) 3)
;; (((() 1) 2) 3)
;;
;; So, in order to get the same result for fold-left and fold-right,
;; the operation op should meet the following requirements:
;; we should make sure that the operator follows the associative law,
;; namely the results of (op a (op b c)) and (op (op a b) c) are the same.
;; For example, + and *
