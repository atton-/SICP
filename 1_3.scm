(define (hoge x y z)
	 (* (mid x y z) (high x y z)))

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

(hoge 134 1222 3)
(hoge 5 2 3)
(hoge 1 2 13)
	  
