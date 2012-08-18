(define (gcd a b)
  (if (= b 0)
	a
	(gcd b (remainder a b))))

(gcd 206 40)

; 正規順序評価
;
; 展開0
;(gcd 206 40)
;
; 展開1
;  (if (= 40 0)
;	206
;	(gcd 40 (remainder 206 40)))
;
; 展開2
;  (if (= 40 0)
;	206
;	(if (= (remainder 206 40) 0)
;	  40
;	  (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))))
;	  
; 展開3
;  (if (= 40 0)
;	206
;	(if (= (remainder 206 40) 0)
;	  40
;	  (if (= (remainder 40 (remainder 206 40)) 0)
;		(remainder 206 40)
;		(gcd (remainder 40 (remainder 206 40)) 
;			 (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;
; 展開4
;(if (= 40 0)
;  206
;  (if (= (remainder 206 40) 0)
;	40
;	(if (= (remainder 40 (remainder 206 40)) 0)
;	  (remainder 206 40)
;	  (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
;		((remainder 40 (remainder 206 40))
;		 (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;			  (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))))))
;
; 展開5
;(if (= 40 0)
;  206
;  (if (= (remainder 206 40) 0)
;	40
;	(if (= (remainder 40 (remainder 206 40)) 0)
;	  (remainder 206 40)
;	  (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
;		((remainder 40 (remainder 206 40))
;		 (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
;		   (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;		   (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))))))))
;
; 評価1 , remainder 0
;  (if (= (remainder 206 40) 0)
;	40
;	(if (= (remainder 40 (remainder 206 40)) 0)
;	  (remainder 206 40)
;	  (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
;		((remainder 40 (remainder 206 40))
;		 (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
;		   (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;		   (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))))))
;
; 評価2 , remainder 1
;	(if (= (remainder 40 (remainder 206 40)) 0)
;	  (remainder 206 40)
;	  (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
;		((remainder 40 (remainder 206 40))
;		 (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
;		   (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;		   (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))))))
;
; 評価3 , remainder 3
;(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
;  ((remainder 40 (remainder 206 40))
;   (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
;	 (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;	 (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))))
;
; 評価4 , remainder 7
;   (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
;	 (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;	 (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;
; 評価5 , remainder 14
;(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;
; 評価6 , remainder 18
;2
;
;よって18回
;
;
;
;作用的順序評価
;
; 展開0
;(gcd 206 40)
;
; 展開1
;  (if (= 40 0)
;	206
;	(gcd 40 (remainder 206 40)))
;
; 評価1 , remainder 1
;	(gcd 40 6))
;
; 展開2
;  (if (= 6 0)
;	40
;	(gcd 6 (remainder 40 6)))
;
; 評価2 , remainder 2
;	(gcd 6 4)
;
; 展開3
;  (if (= 4 0)
;	6
;	(gcd 4 (remainder 6 4)))
;
; 評価3 , remainder 3
;	(gcd 4 2)
;
; 展開4
;  (if (= 2 0)
;	4
;	(gcd 2 (remainder 4 2)))
;
; 評価4 , remainder 4
;	(gcd 2 0)
;
; 展開5
;  (if (= 0 0)
;	2
;	(gcd 0 (remainder 2 0)))
;
; 評価5 , remainder 4
;	2
;
;よって4回

;まとめ
;正規順序評価 : 18回
;作用順序評価 : 4回

;http://www.billthelizard.com/2010/01/sicp-exercise-120-gcd.html
;http://d.hatena.ne.jp/awacio/20100214/1266116580
;とか参考に
