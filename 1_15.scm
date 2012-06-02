(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
	angle
	(p (sine (/ angle 3.0)))))

(use slib)
(require 'trace)
(trace p)
(sine 12.15)

;a : (sine 12.15) で手続きpは何回作用させられたか
;pはangleの絶対値が0.1以下になるまで繰り返すので
; 1 : 4.05
; 2 : 1.35
; 3 : 0.45
; 4 : 0.15
; 5 : 0.05
;ので5回
;sineではsineを2回呼ぶので、高さが5の二分木になるので2^5で32回

;b : (sine a)の計算量は？
;2^nくらい？
;sineはsineを2回呼ぶので。2^nくらい
;pは(a / (** 3 k))くらいの回数呼ばれる
;pを呼ぶ回数は少ないけど、一応nに比例してる、と思う
;sine = 2sine
;2sine = 2*2sine
;2*2sine = 2*2*2sine
;ってなるので。繰り返しの回数は(a/(** 3 k))回くらい。
;
;b : (sine a)の必要スペースは？
;2^nくらい
;sine は sine を2回呼ぶので、呼ばれる回数分くらい必要そう
