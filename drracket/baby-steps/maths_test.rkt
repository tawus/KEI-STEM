#lang racket
(require test-engine/racket-tests)
(require "maths.rkt")

(check-expect (double 5) 10)
(check-expect (double -6) -12)
(check-expect (double 0) 0)

(check-expect (square 5) 25)
(check-expect (square -6) 36)
(check-expect (square 0) 0)

(check-expect (even-number? 5) #f)
(check-expect (even-number? 10) #t)

(check-expect (odd-number? 7) #t)
(check-expect (odd-number? 14) #f)

(check-expect (positive? 0) #f)
(check-expect (positive? 1) #t)
(check-expect (positive? -1) #f)

(check-expect (negative? 0) #f)
(check-expect (negative? 1) #f)
(check-expect (negative? -1) #t)

(check-within (circle-area 5.0) 78.5714 0.001)

(check-expect (minimum 1 2) 1)
(check-expect (minimum 1 1) 1)
(check-expect (minimum -1 0) -1)

(check-expect (maximum 5 6) 6)
(check-expect (maximum 7 6) 7)
(check-expect (maximum -5 10) 10)

(check-within (celsius->fahrenheit 37) 98.6 0.01)
(check-within (fahrenheit->celsius 98.6) 37 0.01)

(check-within (simple-interest 1000 0.10 5) 500.0 0.0001)
(check-expect (simple-interest 200 0.20 0) 0)

(check-within (compound-interest 1000 0.10 5) 1610.51 0.001)

(test)



