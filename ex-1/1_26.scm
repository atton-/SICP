;1.24な部分

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

(time-prime-test 11)
(time-prime-test 12)
(time-prime-test 13)

;実行結果
;11 *** #<time-duration 0.000034000>#<undef>
;12#<undef>
;13 *** #<time-duration 0.000020000>#<undef>

;1.26な追加分
(define (expmod base exp m)
  (cond ((= exp 0) 1)
		((even? exp)
		 (remainder (* (expmod base (/ exp 2) m)
					   (expmod base (/ exp 2) m))
					m))
		(else
		  (remainder (* base (expmod base (- exp 1) m))
					 m))))


(time-prime-test 11)
(time-prime-test 12)
(time-prime-test 13)

;実行結果
;11 *** #<time-duration 0.000052000>#<undef>
;12#<undef>
;13 *** #<time-duration 0.000051000>#<undef>


;結構遅くなってる。
;偶数の場合はexpmodを二回評価することになってるので、log(n)な枝の二分木な感じになって計算量増加

;log_2(n)が(log_2(n))^2になってnでO(n)らしい。
;参考 : http://swatmac.info/?p=478
