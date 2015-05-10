(load "exercise-2-7.scm")

(define (mul-interval x y)
  (let ((lx (lower-bound x))
		(ux (upper-bound x))
		(ly (lower-bound y))
		(uy (upper-bound y)))
	(cond ((and (>= lx 0)
				(>= ly 0))
		   (make-interval (* lx ly) (* ux uy)))
		  ((and (< lx 0)
				(>= ux 0)
				(>= ly 0))
		   (make-interval (* uy lx) (* uy ux)))
		  ((and (< ux 0)
				(>= ly 0))
		   (make-interval (* uy lx) (* ly ux)))
		  ((and (>= lx 0)
				(< ly 0)
				(>= uy 0))
		   (make-interval (* ly ux) (* uy ux)))
		  ((and (< lx 0)
				(>= ux 0)
				(< ly 0)
				(>= uy 0))
		   (let ((rl1 (* lx uy))
				 (rl2 (* ux ly))
				 (ru1 (* lx ly))
				 (ru2 (* ux uy)))
			 (make-interval (min rl1 rl2) (max ru1 ru2))))
		  ((and (< ux 0)
				(< ly 0)
				(> uy 0))
		   (make-interval (* lx uy) (* lx ly)))
		  ((and (> lx 0)
				(< uy 0))
		   (make-interval (* ux ly) (* lx uy)))
		  ((and (< lx 0)
			   (> ux 0)
			   (< ly 0))
		   (make-interval (* ux ly) (* lx ly)))
		  ((and (< ux 0)
				(< uy 0))
		   (make-interval (* ux uy) (* lx ly))))))
