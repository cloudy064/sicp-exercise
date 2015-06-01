(define (split proc1 proc2)
  (define (proc-ret painter n)
	(if (= n 0)
		painter
		(let ((smaller (proc-ret painter (- n 1))))
		  (proc1 painter (proc2 smaller smaller)))))
  (lambda (painter n) (proc-ret painter n)))

(define right-split (split beside below))

(define up-split (split below beside))
