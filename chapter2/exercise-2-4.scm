(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

;;Just a example below:
;;
;;e.g.
;;(define a (cons 1 2))
;; then
;; a represents (lambda (m) (m 1 2)).
;;
;; so (car a) is equal to
;; (a (lambda (p q) p))
;; a is a function here (lambda (m) (m 1 2)).
;; It accept a parameter here, namely (lambda (p q) p)
