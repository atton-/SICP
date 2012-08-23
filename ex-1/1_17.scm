(define (even? n)
  (= (remainder n 2) 0))

(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))

(define (multi a n)
  (if (= a 0)
	0
	(if (even? a)
	  (double (multi (halve a) n))
	  (+ n (multi (- a 1) n)))))

(multi 3 4)
(multi (multi (multi 3 5) 4) 9)
