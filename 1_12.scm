(define (pascal x y)	;x段目のy個目の値
  (if (= y 1) 1
	(if (= x y) 1
	  (+ (pascal  (- x 1) (- y 1)) (pascal (- x 1) y)))))

(pascal 1 1)
(pascal 2 1)
(pascal 2 2)
(pascal 3 2)
(pascal 5 3)
