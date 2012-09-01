;2.10な0を跨ぐ区間の除算

;2.7な区間演算
(define (make-interval a b) (cons a b))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
		(p2 (* (lower-bound x) (upper-bound y)))
		(p3 (* (upper-bound x) (lower-bound y)))
		(p4 (* (upper-bound x) (upper-bound y))))
	(make-interval (min p1 p2 p3 p4)
				   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
				(make-interval (/ 1.0 (upper-bound y))
							   (/ 1.0 (lower-bound y)))))

(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))



;2.10な0を跨がる区間を含む場合の問題点

; interval は (lower-boud upper-bound) の形式。
; div-interval は割る数の逆数をmul-intervalすることで実装している
; 逆数を取ると、元の値が大きいほどに小さくなるので
; (make-interval (/ 1.0 upper-bound) (/ 1.0 lower-boud))
; となる。
; 両方正や負だと問題無いが、ゼロを跨ぐ(それぞれの値が正と負)だと、上下関係が逆転してしまう

; 逆数を返す
(define (inverse-interval interval)
  (make-interval (/ 1.0 (upper-bound interval))
				 (/ 1.0 (lower-bound interval))))

(define plus-plus (inverse-interval (make-interval 5 15)))
(define minus-minus (inverse-interval (make-interval -15 -5)))
(define minus-plus (inverse-interval (make-interval -5 5)))

(> (upper-bound plus-plus) (lower-bound plus-plus))
(> (upper-bound minus-minus) (lower-bound minus-minus))
(> (upper-bound minus-plus) (lower-bound minus-plus))
;gosh> #t
;gosh> #t
;gosh> #f

; ゼロを跨ぐ場合、intervalの上下関係がおかしくなる場合がある
