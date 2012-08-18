(define (double a) (* 2 a))
(define (halve a) (/ a 2))
(define (even? n) (= (remainder n 2) 0))


; b * n を計算する
; stat + (* a b n)が不変になるようにする
; ab は (* a b) を持ってる状態変数的な
(define (multi-iter stat a b ab n)
  (cond 
	((= a 0) 0)
	((= n 1) (+ stat ab))
	(else (if (even? n)
			(multi-iter stat (double a) b (double ab) (halve n))
			(multi-iter (+ stat ab) a b ab (- n 1))))))

(define (multi a n)
  (multi-iter 0 1 a a n))

(multi 5 10)
(* 5 10)
(multi 6 10)
(* 6 10)
(multi 6 12)
(* 6 12)
(multi 7 13)
(* 7 13)
(multi 21 10)
(* 21 10)
(multi 121 110)
(* 121 110)
(multi (multi 121 13) 110)
(* (* 121 13) 110)
