#lang racket
(provide multiply division fact)

;
; multiply (x, y) = 0 | x = 0 and x, y in W
; multiply (x, y) = y + multiply(x - 1, y) and x, y in W
; e.g.
; multiply (5, 6) = 6 + multiply(4, 6)
; multiply (4, 6) = 6 + multiply(3, 6)
(define (multiply x y)
  (if (zero? x)
      0
      (+ y (multiply (- x 1) y))))

;
; division (x, y) = 0 | x < y
; division (x, y) = 1 + division(x - y, y)
; division (6, 7) = 0 | 6 < 7
; division (12, 7) = 1 + division(12 - 7, 7)
;
; 12 / 7 = 12 - 7
; 15 / 3 = 15 - 3, 12 - 3, 9 - 3, 6 - 3, 3 - 3, 0 = 5
; 16 / 5 = 3, 2, 1, 0
;
(define (division x y)
  (if (< x y)
      0
      (+ 1 (division (- x y) y))))

;
; fact n = 1 {n | n = 0 or n = 1}
; fact n = n * fact(n - 1) { n in W}
;
(define (fact n)
  (if (<= n 0)
      1
      (* n (fact (- n 1)))))


      

      

