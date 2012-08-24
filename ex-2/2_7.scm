;2.7な区間演算

(define (make-interval a b) (cons a b))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
				 (+ (upper-bound x) (upper-bound y))))

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


;0-5の区間と3-7の区間を足してみる
(define interval (add-interval (make-interval 0 5)
							   (make-interval 3 7)))
(upper-bound interval)
(lower-bound interval)
;gosh> 12
;gosh> 3


;0-5の区間と3-7の区間をかけてみる
(define interval (mul-interval (make-interval 0 5)
							   (make-interval 3 7)))
(upper-bound interval)
(lower-bound interval)
;gosh> 35
;gosh> 0


;0-5の区間と3-7の区間を割って
(define interval (div-interval (make-interval 0 5)
							   (make-interval 3 7)))
(upper-bound interval)
(exact->inexact (/ 5 3))
(lower-bound interval)
;gosh> 1.6666666666666665
;gosh> 1.6666666666666667
;gosh> 0.0

;ちょっとズレてるけど 0.0 - 5/3 区間(たぶん)
