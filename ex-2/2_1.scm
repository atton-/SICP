;2.1な正負計算可なmake-rat
(define (make-rat x y)
  (let ((g (gcd x y))
		(sign (if (or (and (< x 0) (< y 0))
					  (and (> x 0) (> y 0)))
				+
				-)))
	(cons (sign (abs (/ x g)))
		  (abs (/ y g)))))

(define (numer rat) (car rat))	;分子を返す
(define (denom rat) (cdr rat))	;分母を返す

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
			   (* (numer y) (denom x)))
			(* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
			   (* (numer y) (denom x)))
			(* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
			(* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
			(* (denom x) (numer y))))

(define (print-rat rat)
  (newline)
  (display (numer rat))
  (display "/")
  (display (denom rat)))


(print-rat (make-rat -1 2))
(print-rat (make-rat -1 -2))
;gosh> 
;-1/2#<undef>
;gosh> 
;1/2#<undef>

(print-rat (add-rat (make-rat -1 2) (make-rat 3 4)))
(print-rat (add-rat (make-rat -1 2) (make-rat 1 -2)))
;gosh> 
;1/4#<undef>
;gosh> 
;-1/1#<undef>

(print-rat (sub-rat (make-rat -1 2) (make-rat 3 4)))
(print-rat (sub-rat (make-rat -1 2) (make-rat 1 -2)))
;gosh> 
;-5/4#<undef>
;gosh> 
;0/1#<undef>

(print-rat (mul-rat (make-rat -1 2) (make-rat 3 4)))
(print-rat (mul-rat (make-rat -1 2) (make-rat 3 -4)))
;gosh> 
;-3/8#<undef>
;gosh> 
;3/8#<undef>

(print-rat (div-rat (make-rat -1 2) (make-rat 3 4)))
(print-rat (div-rat (make-rat -1 2) (make-rat 3 -4)))
;gosh> 
;-2/3#<undef>
;gosh> 
;2/3#<undef>
