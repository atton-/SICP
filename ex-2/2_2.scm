;2.2な平面上の線分表示

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;点
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

;線
(define (make-segment start-segment end-segment)
  (cons start-segment end-segment))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

;線から中間点を返す
(define (midpoint-segment segment)
  (define (average x y) (/ (+ x y) 2))
  (make-point (average (x-point (start-segment segment))
					   (x-point (end-segment segment)))
			  (average (y-point (start-segment segment))
					   (y-point (end-segment segment)))))

;テスト
(print-point (midpoint-segment (make-segment (make-point 1 10) (make-point -1 -10))))
(print-point (midpoint-segment (make-segment (make-point 5 10) (make-point 7 12))))
;gosh> 
;(0,0)#<undef>
;gosh> 
;(6,11)#<undef>
;gosh> 
