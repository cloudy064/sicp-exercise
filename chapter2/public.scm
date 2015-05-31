(define (enumerate-interval low high)
  (if (> low high)
	  ()
	  (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append () (map proc seq)))
