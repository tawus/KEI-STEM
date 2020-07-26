#lang racket
(require test-engine/racket-tests "Class04.rkt")

(check-expect (division 5 6) 0)
(check-expect (division 10 2) 5)
(check-expect (division 15 2) 7)
(check-expect (division 5 1) 5)

(test)
