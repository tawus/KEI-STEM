#lang racket

;
; count(n) = 0 when n = 0, () = 0
; count(n) = count(n - 1) + 1, count '(1 2 3) = (count '(2 3)) + 1
; 
(define (k-count xs)
  (if (empty? xs)
      0
      (+ (k-count (cdr xs)) 1)))

; sum(xs) = 0 when xs is empty
; sum(xs) = sum(rest(xs)) + (first xs)
; sum (5 6 7) = sum (6 7) + 5
;             = sum (7) + 6 + 5
;             = sum () + 7 + 6 + 5
;             = 0 + 7 + 6 + 5.
(define (k-sum xs)
  (if (empty? xs)
      0
      (+ (car xs) (k-sum (cdr xs)))))

; product(xs) = 1 when xs is empty
; product(xs) = product(rest(xs)) * (first xs)
(define (k-product xs)
  (if (empty? xs)
      1
      (* (car xs) (k-product (cdr xs)))))

(define (k-fold-right init fn xs)
  (if (empty? xs)
      init
      (fn (car xs) (k-fold-right init fn (cdr xs)))))

(define (k-count-iter xs result)
  (if (empty? xs)
      result
      (k-count-iter (cdr xs) (+ result 1))))

(define (k-count-i xs)
  (k-count-iter xs 0))

(define (k-sum-i xs)
  (let iter ([xs xs]
             [result 0])
    (if (empty? xs)
        result
        (iter (cdr xs) (+ result (car xs))))))

(define (k-product-i xs)
  (let iter ([ys xs]
             [result 1])
    (if (empty? ys)
        result
        (iter (cdr ys) (* result (car ys))))))

(define (k-reduce init fn xs)
  (let iter ([ys xs]
             [result init])
    (if (empty? ys)
        result
        (iter (cdr ys) (fn result (car ys))))))

(define k-fold-left k-reduce)





