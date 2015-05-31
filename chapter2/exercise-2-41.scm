(load "public.scm")

(define (triple-pair n)
  (flatmap (lambda (i)
			 (flatmap (lambda (j)
						(map (lambda (k)
							   (list i j k))
							 (enumerate-interval 1 (- j 1))))
					  (enumerate-interval 1 (- i 1))))
		   (enumerate-interval 1 n)))

(define (sum-of-list l)
  (fold-left + 0 l))

(define (triple-of-sum n s)
  (filter
   (lambda (x) (= (sum-of-list x) s))
   (triple-pair n)))
