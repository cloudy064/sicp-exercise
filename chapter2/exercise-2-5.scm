;; You can just define these three functions as below.
;;(define (cons a b)
;;  (lambda (m) (m a b)))
;;
;;(define (car x)
;;  (x (lambda (a b) (expt 2 a))))
;;
;;(define (cdr x)
;;  (x (lambda (a b) (expt 3 b))))

;; But, according to the description of the exercise, you must implement three functions only in arithmetic operations.
;; Just think about it. 2 and 3 are relatively prime numbers. So, provided a number which can be represented by 2a3b, we can call it m, you can get (car m) by dividing m by 2 until the remainder is not zero, and the count you apply dividing operation is just the number, (car m)
;; (cdr m) is the same.

(define (cons a b)
  (* (expt 2 a)
	 (expt 3 b)))

(define (car x)
  (define (has-divider-2 x) (= (remainder x 2) 0))
  (define (car-iter num count)
	(if (has-divider-2 num)
		(car-iter (/ num 2) (+ count 1))
		count))
  (car-iter x 0))

(define (cdr x)
  (define (has-divider-3 x) (= (remainder x 3) 0))
  (define (cdr-iter num count)
	(if (has-divider-3 num)
		(cdr-iter (/ num 3) (+ count 1))
		count))
  (cdr-iter x 0))
