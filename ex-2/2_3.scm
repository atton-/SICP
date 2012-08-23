;2.3な長方形の定義
; 参考 : http://www.serendip.ws/archives/513
; "2点の定義" と "2辺の定義"の方法があるっぽい

; {{{ 2.2な平面上の線分定義
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
; }}}

;周囲の長さを返す
(define (rectangle-perimeter rect)
  (+ (* 2 (width rect))
	 (* 2 (height rect))))

;面積を返す
(define (rectangle-area rect)
  (* (width rect) (height rect)))


;二点を指定する長方形rectangle
(define (rectangle start-point end-point) (cons start-point end-point))

(define (width rect)
  (abs (- (x-point (car rect))
		  (x-point (cdr rect)))))

(define (height rect)
  (abs (- (y-point (car rect))
		  (y-point (cdr rect)))))

(define two-point-rectangle (rectangle (make-point 0 0) (make-point 5 10)))

(rectangle-perimeter two-point-rectangle)
(rectangle-area two-point-rectangle)
;gosh> 50
;gosh> 30


;高さと幅を指定するrectangle
(define (rectangle width height) (cons width height))
(define (width rect) (car rect))
(define (height rect) (cdr rect))

(define two-segment-rectangle (rectangle 5 10))

(rectangle-perimeter two-segment-rectangle)
(rectangle-area two-segment-rectangle)
;gosh> 30
;gosh> 50

;rectangle の構成子と選択子を適切に使えば rectangle-area と rectangle-perimeter は変更してないけど使えるよ、って話みたい
