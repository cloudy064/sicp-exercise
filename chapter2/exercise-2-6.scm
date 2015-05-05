(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; we can expand (add-1 zero) as follows:
;; (add-1 zero)
;; (lambda (f) (lambda (x) (f ((zero f) x))))
;; Because that zero represents for (lambda (f) (lambda (x) x)),
;; then (zero f) is just (lambda (x) x).
;; So (add-1 zero) is equal to
;; (lambda (f) (lambda (x) (f ((lambda (x)) x)))
;; (lambda (f) (lambda (x) (f x)))
;; namely the value of one

(define one (lambda (f) (lambda (x) (f x))))

;; The same, two can be defined as (add-1 one)
;; (lambda (f) (lambda (x) (f ((one f) x))))
;; in which, (one f) is (lambda (x) (f x))
;; So (add-1 one) is equal to
;; (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
;; (lambda (f) (lambda (x) (f (f x))))
;; namely the value of two

(define two (lambda (f) (lambda (x) (f (f x)))))

;; so, we can conclude that
;; n is the format of
;; (define n (lambda (f) (lambda (x) ((repeat f n) x))))
;; in which, repeat is defined in chapter 1.

(define three (lambda (f) (lambda (x) (f  (f (f x))))))
