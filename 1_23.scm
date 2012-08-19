;前回定義分
(use srfi-19)

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
		(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (time-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-time)))

(define (start-prime-test n start-time)
  (if (prime? n)
	(report-prime (time-difference (current-time) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;今回定義分

(define (next divisor)
  (if (= divisor 2) 3 (+ divisor 2)))

(define (new-smallest-divisor n)
  (new-find-divisor n 2))

(define (new-find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
		(else (find-divisor n (next test-divisor)))))

(define (new-prime? n)
  (= n (new-smallest-divisor n)))

(define (new-time-prime-test n)
  (newline)
  (display n)
  (new-start-prime-test n (current-time)))

(define (new-start-prime-test n start-time)
  (if (new-prime? n)
	(report-prime (time-difference (current-time) start-time))))

;前回のテストを使用したテスト
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

(newline)

;今回のテストを使用したテスト
(new-time-prime-test 1009)
(new-time-prime-test 1013)
(new-time-prime-test 1019)
(new-time-prime-test 10007)
(new-time-prime-test 10009)
(new-time-prime-test 10037)
(new-time-prime-test 100003)
(new-time-prime-test 100019)
(new-time-prime-test 100043)
(new-time-prime-test 1000003)
(new-time-prime-test 1000033)
(new-time-prime-test 1000037)

;実行結果
;1009 *** #<time-duration 0.000015000>#<undef>
;1013 *** #<time-duration 0.000012000>#<undef>
;1019 *** #<time-duration 0.000012000>#<undef>
;10007 *** #<time-duration 0.000034000>#<undef>
;10009 *** #<time-duration 0.000035000>#<undef>
;10037 *** #<time-duration 0.000034000>#<undef>
;100003 *** #<time-duration 0.000110000>#<undef>
;100019 *** #<time-duration 0.000105000>#<undef>
;100043 *** #<time-duration 0.000111000>#<undef>
;1000003 *** #<time-duration 0.000218000>#<undef>
;1000033 *** #<time-duration 0.000267000>#<undef>
;1000037 *** #<time-duration 0.000218000>#<undef>
;
;1009 *** #<time-duration 0.000009000>#<undef>
;1013 *** #<time-duration 0.000008000>#<undef>
;1019 *** #<time-duration 0.000007000>#<undef>
;10007 *** #<time-duration 0.000022000>#<undef>
;10009 *** #<time-duration 0.000023000>#<undef>
;10037 *** #<time-duration 0.000023000>#<undef>
;100003 *** #<time-duration 0.000069000>#<undef>
;100019 *** #<time-duration 0.000069000>#<undef>
;100043 *** #<time-duration 0.000070000>#<undef>
;1000003 *** #<time-duration 0.000239000>#<undef>
;1000033 *** #<time-duration 0.000217000>#<undef>
;1000037 *** #<time-duration 0.000218000>#<undef>
;
;今回のテストの方が早いっぽい
