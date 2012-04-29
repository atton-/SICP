(define (hoge x y z)
	 (* (mid x y z) (high x y z)))

(define (fuga x y z)
  (/ (* x y z) (low x y z)))

(define (low x y z)
  (if (< x y)
	(if (< z x)
		z
		x)
	(if (< z y)
	  z
	  y)))

(define (mid x y z)
  (if (> x y)
	(if (> y z)
	  y
	  z)
	(if (> x z)
	  x
	  y)))

(define (high x y z)
  (if (> x y)
	(if (> z x)
	  z
	  x)
	(if (> y z)
	  y
	  z)))





;(use slib)
;(require 'trace)
;(trace mid)

;(hoge 134 1222 3)
;(fuga 134 1222 3)
;(hoge 5 2 3)
;(fuga 5 2 3)
;(hoge 1 2 13)
;(fuga 1 2 13)

(define (piyo a b c)
  (define (square x) (* x x))
  (define (minimum x y) (if (< x y) x y))
  (- 
	(+ (square a) (square b) (square c))
	(square (minimum a (minimum b c)))))

(piyo 1 2 3)
(piyo 6 2 3)
(piyo 4 7 3)
