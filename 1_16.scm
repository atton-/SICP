(define (even? n)
  (= (remainder n 2) 0))
(define (square n) (* n n))

(define (fast-expr b n)
  (cond ((= n 0) 1)
		((even? n) (square (fast-expr b (/ n 2))))
		(else (* b (fast-expr b (- n 1))))))

(fast-expr 2 10)
