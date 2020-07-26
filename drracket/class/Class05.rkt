#lang racket
(require test-engine/racket-tests)

;
; fib(n) = 0 | n = 0
; fib(1) = 1 | n = 1
; fib(n) = fib(n - 1) + fib(n - 2) | n in W
; 0, 1, 1, 2, 3, 5, 8, 13, 21, 34 ....
(define (fibonacci n)
  (cond
    [(= n 0) 0]
    [(= n 1) 1]
    [else (+ (fibonacci (- n 1)) (fibonacci (- n 2)))]))


;
; a = 5.0
; guess = 2.0
; a - guess * guess = ??
; 5.0 - 2.0 * 2.0 = 5.0 - 4.0 = 1.0
; new-guess = 1/2 (guess + guess/a)
;           = 1/2 (2.0 + 2.0/5.0) = 1.2
; 5.0 - 1.2 * 1.2 = .....
;
(define (square x)
  (* x x))

(check-expect (square 5) 25)
(check-expect (square 0) 0)

(define (absolute-value x)
  (if (< x 0) (- x) x))

(check-expect (absolute-value 0) 0)
(check-expect (absolute-value 5) 5)
(check-expect (absolute-value -5) 5)

(define (close? a guess)
  (< (absolute-value (- a (square guess))) 0.00001))

(check-expect (close? 9.0 3.0) #t)
(check-expect (close? 9.0000001 3.0) #t)
(check-expect (close? 10.0 3.0) #f)

(define (new-guess a guess)
  (/ (+ guess (/ a guess)) 2.0))

(check-within (new-guess 5.0 2.0) 1.2 0.0000001)

(define (nr-sqrt a guess)
  (if (close? a guess)
      guess
      (nr-sqrt a (new-guess a guess))))





