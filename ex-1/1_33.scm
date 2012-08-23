;1.32なaccumlate にfilterを追加
;a-b区間でfilterに一致するものをaccumlateするように

(define (filtered-accumlate filter combiner null-value term a next b)
  (define (iter a b stat)
	(if (> a b)
	  stat
	  (if (filter a)
		(combiner (term a)
				  (filtered-accumlate filter combiner null-value term (next a) next b))
		(filtered-accumlate filter combiner null-value term (next a) next b))))
  (iter a b null-value))

;1.22なprime?
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

;a. a-b区間内の素数を二乗して足してみる
(define (plus x y) (+ x y))
(define (inc x) (+ x 1))
(define (square x) (* x x))

;2-10と2-20
(filtered-accumlate prime? plus 0 square 2 inc 10)
(+ (square 2) (square 3) (square 5) (square 7))
(filtered-accumlate prime? plus 0 square 2 inc 20)
(+ (square 2) (square 3) (square 5) (square 7) (square 11) (square 13) (square 17) (square 19)) 
;gosh> 87
;gosh> 87
;gosh> 1027
;gosh> 1027

;b. nと互いに素でnより小さい正の整数の和

;1.20なgcd
(define (gcd a b)
  (if (= b 0)
	a
	(gcd b (remainder a b))))

;filterが2つ引数必要なので一応再定義 curry化がうんぬんとかでいける？

(define (filtered-accumlate filter combiner null-value term a next b)
  (define (iter a b stat)
	(if (> a b)
	  stat
	  (if (filter a b)
		(combiner (term a)
				  (filtered-accumlate filter combiner null-value term (next a) next b))
		(filtered-accumlate filter combiner null-value term (next a) next b))))
  (iter a b null-value))

;aとbが互いに素か？
(define (each-prime? a b)
  (= (gcd a b) 1))
(define (identity x) x)

;今回はbがnでaがi

;2から10の区間と、2から20の区間
(filtered-accumlate each-prime? plus 0 identity 2 inc 10)
(+ 3 7 9)
(filtered-accumlate each-prime? plus 0 identity 2 inc 20)
(+ 3 7 9 11 13 17 19)
;gosh> 19
;gosh> 19
;gosh> 79
;gosh> 79
