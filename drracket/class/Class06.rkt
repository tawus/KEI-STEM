#lang racket


; fact(n) = 1 when n = 1
; fact(n) = n * fact(n - 1) when n > 1
(define (fact n)
  (if (= n 1)
      1
      (* n (fact (- n 1)))))

; fact(n) = result
; fact(n) = fact(n - 1, result * n)
;
(define (fact-iter n result)
  (if (= n 1)
      result
      (fact-iter (- n 1) (* result n))))

(define (fact-i n)
  (fact-iter n 1))

;
; mul(x, y) = 0 when y = 0
; mul(x, y) = mul(x, y - 1) + x when y > 0
(define (mul-iter x y result)
  (if (zero? y)
      result
      (mul-iter x (sub1 y) (+ result x))))

(define (mul-i x y)
  (mul-iter x y 0))

