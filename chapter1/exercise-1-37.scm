(define (cont-frac n d k)
  (define (cont-frac-iter index result)
	(if (= index 0)
		result
		(cont-frac-iter (- index 1) (/ (n index) (+ (d index) result)))))
  (cont-frac-iter k 0))

(define (guess-gold-ratio k)
  (/ 1 (cont-frac (lambda (i) 1.0)
			 (lambda (i) 1.0)
			 k)))
