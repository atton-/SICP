;2.8な区間の引き算
(define (make-interval a b) (cons a b))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
				 (- (upper-bound x) (lower-bound y))))

(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))


;0-5の区間と3-7の区間を引いてみる
(define interval (sub-interval (make-interval 0 5)
							   (make-interval 3 7)))

(upper-bound interval)
(lower-bound interval)
