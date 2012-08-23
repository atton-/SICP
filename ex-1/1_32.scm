;1.32 sumやproductより汎用的なaccumlate

;再帰的
(define (accumlate combiner null-value term a next b)
  (if (> a b)
	 null-value
	 (combiner (term a) (accumlate combiner null-value term (next a) next b))))

;総和
(define (inc x) (+ x 1))
(define (identity x) x)
(define (plus x y) (+ x y))

(accumlate plus 0 identity 1 inc 10)
(accumlate plus 0 identity 5 inc 10)
;gosh> 55
;gosh> 45

;総積
(define (multi x y) (* x y))
(accumlate multi 1 identity 1 inc 10)
(accumlate multi 1 identity 5 inc 10)
;gosh> 3628800
;gosh> 151200


;反復的
(define (accumlate combiner null-value term a next b)
  (define (iter a b stat)
	(if (> a b)
	  stat
	  (combiner (term a)
				(accumlate combiner null-value term (next a) next b))))
  (iter a b null-value))

;総和
(accumlate plus 0 identity 1 inc 10)
(accumlate plus 0 identity 5 inc 10)
;gosh> 55
;gosh> 45

;総積
(accumlate multi 1 identity 1 inc 10)
(accumlate multi 1 identity 5 inc 10)
;gosh> 3628800
;gosh> 151200
