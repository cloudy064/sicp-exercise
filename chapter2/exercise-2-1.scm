;; exercise 2.1

(define (add-rat x y)
  (default-make-rat (+ (* (number x) (denom y))
					   (* (number y) (denom x)))
                	(* (denom x) (denom y))))

(define (sub-rat x y)
  (default-make-rat (- (* (number x) (denom y))
					   (* (number y) (denom x)))
			        (* (denom x) (denom y))))

(define (mul-rat x y)
  (default-make-rat (* (number x) (number y))
		        	(* (denom x) (denom y))))

(define (div-rat x y)
  (default-make-rat (* (number x) (denom y))
			        (* (denom x) (number y))))

(define (equal-rat? x y)
  (= (* (number x) (denom y))
	 (* (denom x) (number y))))

(define (simple-make-rat n d)
  (cons n d))

(define (number x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (number x))
  (display "/")
  (display (denom x)))

(define (make-rat-ex n d)
  (let ((g (gcd n d)))
	(cons (/ n g) (/ d g))))

(define (make-rat-sign n d)
  (define is-d-negative (< d 0))
  (let ((g (gcd n d))
		(rn (if is-d-negative (-n) n))
		(rd (if is-d-negative (-d) d)))
	(cons (/ rn g) (/ rd g))))

(define default-make-rat simple-make-rat)
