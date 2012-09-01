;2.9な区間の幅についての証明
;参考 : http://d.hatena.ne.jp/awacio/20100329/1269869969

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

;2.8な区間の引き算
(define (make-interval a b) (cons a b))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
				 (- (upper-bound x) (lower-bound y))))

(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))


;2.9な証明

; 前提
; lower-x : xの下限
; upper-x : xの上限
; width-x : xの幅 (- upper-x lower-x)
; として


; 加算
(add-interval (make-interval 0 10)
			  (make-interval 100 500))
; (add-interval x y) なら
; (make-interval (+ lower-x lower-y) (+ upper-x upper-y))
; と等価なので
; 幅は
; (-  (+ upper-x upper-y) (+ lower-x lower-y))
; となって、書きかえて
; (+ (- upper-x lower-x) (- upper-y lower-y))
; widthに置きかえて
; (+ width-x width-y)
; となって、幅どうしの加算になる。
; (10 + 500) - (0 + 100) = 410
; 510 - 100 = 410
; と
; (10 - 0) + (500 - 100) = 410
; 10 + 400 = 410 
; 元のxとyの幅である10と400を使って410は作れる


; 減算
(sub-interval (make-interval 0 10)
			  (make-interval 100 500))
; (sub-interval x y) なら
; (make-interval (- lower-x upper-y) (- upper-x lower-y))
; と等価なので
; 幅は
; (- (- upper-x lower-y) (- lower-x upper-y))
; となって、書きかえて
; (- (- (- upper-x lower-x) ) (- upper-y lower-y))
; widthで書くと
; (- (- width-x) width-y)
; となって、幅の符号をマイナスにして加算することなる
; (10 - 100) + (0 - 500) = 410
; -90 + -500 = 410
; と
; - (10 - 0) - (500 - 100) = 410
; - 10 - 400 = 410
; 元のxとyの幅である10と400を使って410は作れる


; 乗算除算は幅の関数にはならない

; 乗算
(mul-interval (make-interval 0 10)
			  (make-interval 100 500))
; x>=0, y>=0 の時
; (mul-interval x y) なら
; (make-interval (* lower-x lower-y) (* upper-x upper-y))
; と等価なので
; 幅は
; (- (* upper-x upper-y) (* lower-x lower-y))
; になって、widthで表現できない
; (500 * 10) - (100 * 0) = 5000
; 5000 - 0 = 5000
; 元のxとyの幅である10と400を使って5000は作れない


; 除算
; 逆数に関しては頭に inverse を付ける
(div-interval (make-interval 0 10)
			  (make-interval 100 500))
; x>=0, y>=0の時
; (div-interval x y) なら
; (mul-interval x inverse-y)
; (make-interval (* lower-x lower-inverse-y) (* upper-y upper-inverse-y))
; と等価なので
; 幅は
; (- (* upper-x upper-inverse-y) (* lower-x lower-inverse-y))
; になって、widthでは表現できない
; (10 * 1/100) - (0 * 1/500) = 0.1
; 0.1 - 0 = 0.1
; 元のxとyの幅である10と400を使って0.1は作れない
