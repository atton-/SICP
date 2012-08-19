;1.24より
(use srfi-19)
(use srfi-27)

(define (square x) (* x x))

(define (fermat-test n)
  (define (try-it a)
	(= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
		((fermat-test n) (fast-prime? n (- times 1)))
		(else #f)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
		((even? exp)
		 (remainder (square (expmod base (/ exp 2) m)) m))
		(else
		  (remainder (* base (expmod base (- exp 1) m)) m))))


(define (time-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-time)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
	(report-prime (time-difference (current-time) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;12個テスト
(time-prime-test 1009)
(time-prime-test 1013)
(time-prime-test 1019)
(time-prime-test 10007)
(time-prime-test 10009)
(time-prime-test 10037)
(time-prime-test 100003)
(time-prime-test 100019)
(time-prime-test 100043)
(time-prime-test 1000003)
(time-prime-test 1000033)
(time-prime-test 1000037)


;ここから1.25

(define (fast-expt b n)
  (cond ((= n 0) 1)
		((even? n) (square (fast-expt b (/ n 2))))
		(else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

;12個テスト
(time-prime-test 1009)
(time-prime-test 1013)
(time-prime-test 1019)
(time-prime-test 10007)
(time-prime-test 10009)
(time-prime-test 10037)
(time-prime-test 100003)
(time-prime-test 100019)
(time-prime-test 100043)
(time-prime-test 1000003)
(time-prime-test 1000033)
(time-prime-test 1000037)

;実行結果
;1009 *** #<time-duration 0.000730000>#<undef>
;1013 *** #<time-duration 0.000622000>#<undef>
;1019 *** #<time-duration 0.000620000>#<undef>
;10007 *** #<time-duration 0.100800000>#<undef>
;10009 *** #<time-duration 0.103482000>#<undef>
;10037 *** #<time-duration 0.101020000>#<undef>
;100003 *** #<time-duration 15.176828000>#<undef>
;100019 *** #<time-duration 14.333741000>#<undef>
;100043 *** #<time-duration 15.030397000>#<undef>
;1000003 *** #<time-duration 2428.398909000>#<undef>
;1000033 *** #<time-duration 2293.739900000>#<undef>
;1000037 *** #<time-duration 2734.410885000>#<undef>

;やたら遅くなってる。
;fast-exptでexp自体を求めるのは早いけど、reaminderで巨大な数を扱うことになるので遅い

;参考 : http://swatmac.info/?p=478
