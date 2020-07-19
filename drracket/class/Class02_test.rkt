#lang racket
(require test-engine/racket-tests
         "Class02.rkt")

(check-expect (square 2) 4)
(check-expect (square -2) 4)
(check-within (square 5.2) 27.04 0.00001) 

(test)

