;2.12 な中央値とパーセント相対許容誤差をとって区間を返す make-center-percent

(define (make-interval lower upper) (cons lower upper))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (center interval)
  (/ (+ (lower-bound interval) (upper-bound interval)) 2))
(define (width interval)
  (/ (- (lower-bound interval) (upper-bound interval)) 2))

; center が正か負かで分ける
(define (make-center-percent center percent)
  (if (> center 0)
	(make-interval (- center (* center percent))
				   (+ center (* center percent)))
	(make-interval (+ center (* center percent))
				   (- center (* center percent)))))

; (ある端の値 - 中央値)の絶対値がどれだけ中央値と離れているか
(define (percent interval)
  (/ (abs (- (upper-bound interval) (center interval)))
	 (center interval)))


(make-center-percent 100 0.2)
(make-center-percent -100 0.2)
;gosh> (80.0 . 120.0)
;gosh> (-120.0 . -80.0)

(percent (make-center-percent 100 0.2))
(percent (make-center-percent -100 0.2))
;gosh> 0.2
;gosh> -0.2
