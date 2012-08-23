;演算term次の項を求めるnextで、
;aからbの区間な総積を求めるproduct

;再帰的
(define (product a b next term)
  (if (> a b)
	1
	(* (term a)
	   (product (next a) b next term))))

;素直に整数の総積を求める
(define (identity x) x)
(define (inc x) (+ x 1))

(product 1 10 inc identity)
(product 5 10 inc identity)
;gosh> 3628800
;gosh> 151200

;反復的
(define (product a b next term)
  (define (iter a b value)
	(if (> a b)
	  value
	  (iter (next a) b (* (term a) value))))
  (iter a b 1))

(product 1 10 inc identity)
(product 5 10 inc identity)
;gosh> 3628800
;gosh> 151200
