(load "public.scm")
(load "exercise-1-43.scm")

(define (smooth g)
  (lambda (x) (average-three (g (- x dx))
		                     (g x)
		                     (g (+ x dx)))))

(define (smooth-n-times g n)
  (lambda (x) (((repeated3 smooth n) g) x)))

;;这里要注意一下，如果写成((repeated3 (smooth g) n) x)意思就完全变了
;;可以取思考一下
