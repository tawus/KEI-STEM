#lang racket
(provide square double
         even-number? odd-number?
         positive? negative?
         circle-area
         minimum maximum
         simple-interest compound-interest)

(define (square x)
  (* x x))

(define (double x)
  (+ x x))

(define (even-number? x)
  (= (remainder x 2) 0))

(define (odd-number? x)
  (= (remainder x 2) 1))

(define (positive? x)
  (> x 0))

(define (negative? x)
  (< x 0))

(define (circle-area r)
  (* (/ 22.0 7) (square r)))

(define (minimum x y)
  (if (< x y) x y))

(define (maximum x y)
  (if (> x y) x y))

(define (simple-interest principal rate time)
  (* principal time rate))

(define (compound-interest principal rate time)
  (* principal (expt (+ 1 rate) time)))


  