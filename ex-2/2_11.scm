;2.11 な九つの場合の mul-interval

; 区間の乗算
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (make-interval lower upper) (cons lower upper))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
		(p2 (* (lower-bound x) (upper-bound y)))
		(p3 (* (upper-bound x) (lower-bound y)))
		(p4 (* (upper-bound x) (upper-bound y))))
	(make-interval (min p1 p2 p3 p4)
				   (max p1 p2 p3 p4))))

; 題意がよく分からないのだけど、minとかmaxとか使わずにmul-intervalを再定義しよう、ってこと？
; 参考 : http://www.billthelizard.com/2010/12/sicp-27-211-extended-exercise-interval.html

; 区間は大小関係があるので[+,+]と[-,+]と[-,-]のみ。([+,-]はありえない)
; を2つ演算するので3x3で9パターン
; 0は例外状態。投げるとundefが返ってくる。

(define (new-mul-interval x y)
  (let ((upper-x (upper-bound x))
		(lower-x (lower-bound x))
		(upper-y (upper-bound y))
		(lower-y (lower-bound y)))
	(cond
	  ; [+,+] x [?,?]
	  ((and (> lower-x 0) (> upper-x 0))
	   (cond 
		 ; [+,+] x [+,+]
		 ((and (> lower-y 0) (> upper-y 0))
		  (make-interval (* lower-x lower-y) (* upper-x upper-y)))
		 ; [+,+] x [-,+]
		 ((and (< lower-y 0) (> upper-y 0))
		  (make-interval (* upper-x lower-y) (* upper-x upper-y)))
		 ; [+,+] x [-,-]
		 ((and (< lower-y 0) (< upper-y 0))
		  (make-interval (* upper-x lower-y) (* lower-x upper-y)))))
	  (else (display "not implemented")))))

(define plus-plus (make-interval 5 10))
(define minus-plus (make-interval -5 10))
(define minus-minus (make-interval -10 -5))

(mul-interval plus-plus plus-plus)
(mul-interval plus-plus minus-plus)
(mul-interval plus-plus minus-minus)

(new-mul-interval plus-plus plus-plus)
(new-mul-interval plus-plus minus-plus)
(new-mul-interval plus-plus minus-minus)
