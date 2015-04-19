(load "public.scm")

(define (resolve-cubic a b c)
  (define (cubic x)
	(+ (expt x 3) (* a (expt x 2)) (* b x) c))
  (newtons-method cubic 1))
