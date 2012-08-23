;SICP1.29なintegral

(define (sum term a next b)
  (if (> a b)
	0
	(+ (term a)
	   (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a(/ dx 2.0)) add-dx b)
	 dx))

(define (cube x) (* x x x))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
;gosh> 0.24998750000000042
;gosh> 0.249999875000001

;simpsonな自前定義

;関数が引数を2つ取れるようなsum
(define (new-sum term a next b)
  (if (> a b)
	0
	(+ (term b a)
	   (new-sum term (next a) next b))))

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))

  (define (y k) (f (+ a (* k h))))

  (define (multi-y n k)	; 係数付きのyを求める
	(if (or (= k 0) (= k n))
	  (y k)				; y_0 と y_k は y
	  (if (= (remainder k 2) 1)
		(* 4 (y k))		; 奇数なら4y
		(* 2 (y k)))))	; 偶数なら2y

  (define (inc a) (+ a 1))

  (* (/ h 3.0)
	 (new-sum multi-y 0 inc n)))

(simpson-integral cube 0 1 100)
(simpson-integral cube 0 1 1000)
;gosh> 0.25
;gosh> 0.25

;simpsonの公式の方が精度が高い


;2乗で試してみる
(define (square x) (* x x))

(integral square 0 1 0.01)
(integral square 0 1 0.001)
(simpson-integral square 0 1 100)
(simpson-integral square 0 1 1000)
;gosh> 0.33332500000000054
;gosh> 0.33333325000000047
;gosh> 0.33333333333333337
;gosh> 0.3333333333333333

;やっぱりsimpsonの方が精度が高い
