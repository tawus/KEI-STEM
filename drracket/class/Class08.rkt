#lang racket


; (fold-right 0 + '(1, 2, 3, 4, 5))
; [1 2 3 4 5] (+ 1 14)
; [2 3 4 5] (+ 2 12)
; [3 4 5] (+ 3 9)
; [4 5] (+ 4 5)
; [5] 0 (+ 5 0)
; 0
(define (fold-right init fn xs)
  (if (empty? xs)
      init
      (fn (car xs) (fold-right init fn (cdr xs)))))

(define (square x) (* x x))

;
; [x1, x2, x3, ...] = (cons square(x) (square-all [x2, x3, ...]))
; [1, 2, 3] = (cons 1 (cons 4 (cons 9 '())))
(define (square-all xs)
  (if (empty? xs)
      '()
      (cons (square (car xs)) (square-all (cdr xs)))))

(define (double x) (+ x x))

(define (double-all xs)
  (if (empty? xs)
      '()
      (cons (double (car xs)) (double-all (cdr xs)))))

(define (square-and-double-all xs)
  (if (empty? xs)
      '()
      (cons (double (square (car xs))) (square-and-double-all (cdr xs)))))

(define (k-map f xs)
  (if (empty? xs)
      '()
      (cons (f (car xs)) (k-map (cdr xs)))))

(define (square-all-2 xs)
  (k-map square xs))

(define (double-all-2 xs)
  (k-map double xs))

(define (map-using-foldr f xs)
  (foldr (lambda (x acc) (cons (f x) acc)) '() xs))







      