(define (even? n)
  (= (remainder n 2) 0))
(define (square n) (* n n))

(define (fast-expr b n)
  (cond ((= n 0) 1)
		((even? n) (square (fast-expr b (/ n 2))))
		(else (* b (fast-expr b (- n 1))))))

(fast-expr 2 10)

(define (my-expr-iter a b n)
  (cond ((= n 0) a)
		((even? n) (my-expr-iter a (square b) (/ n 2)))
		(else (my-expr-iter (* a b) b (- n 1)))))

(define (my-expr b n)
  (my-expr-iter 1 b n))

(my-expr 2 10)

(fast-expr 2 100)
(my-expr 2 100)

(fast-expr 2 1000)
(my-expr 2 1000)

;my-expr
;nが奇数の時 ab b^(n-1) にする
;nが偶数の時 a (b^2)^(n/2) にする
