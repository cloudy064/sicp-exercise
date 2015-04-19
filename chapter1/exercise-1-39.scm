(load "exercise-1-37.scm")

;;(cont-frac n d k)

(define (tan-cf x k)
  (define (n i)
	(if (= i 1)
		x
		(- (square x))))
  (define (d i) (- (* i 2) 1.0))
  (cont-frac n d k))
