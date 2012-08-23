10					;=> 10
(+ 5 3 4)			;=> 12
(- 9 1)				;=> 8
(/ 6 2)				;=>3
(+ (* 2 4) (- 4 6))	;=> (+ 8 -2) 6
(define a 3)		;=> a
(define b (+ a 1))	;=> (define b 4) b
(+ a b (* a b))		;=> (+ 3 4 12) 19
(= a b)				;=> false
(if (and (> b a) (< b (* a b))) b a)
;(if (and true (< b 12)) b a) (if (and true true) b a) b =>4
(* (cond ((> a b) a)
	  ((< a b) b)
	  (else -1))
	  (+ a 1))
;(* (cond (false a)
;		  (true b)
;		  (else -1))
;		  4))
;
;(* b 4) (* 4 4) =>16
