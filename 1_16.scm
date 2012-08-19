(define (even? n)
  (= (remainder n 2) 0))
(define (square n) (* n n))

(define (fast-expt b n)
  (cond ((= n 0) 1)
		((even? n) (square (fast-expt b (/ n 2))))
		(else (* b (fast-expt b (- n 1))))))

(fast-expt 2 10)

(define (my-expt-iter a b n)
  (cond ((= n 0) a)
		((even? n) (my-expt-iter a (square b) (/ n 2)))
		(else (my-expt-iter (* a b) b (- n 1)))))

(define (my-expt b n)
  (my-expt-iter 1 b n))

(my-expt 2 10)

(fast-expt 2 100)
(my-expt 2 100)

(fast-expt 2 1000)
(my-expt 2 1000)

;my-expt
;nが奇数の時 ab b^(n-1) にする
;nが偶数の時 a (b^2)^(n/2) にする
