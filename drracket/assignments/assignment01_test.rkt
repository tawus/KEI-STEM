#lang racket

(require test-engine/racket-tests)
(require "assignment01.rkt")

(check-expect (cube 0) 0)
(check-expect (cube 5) 125)
(check-expect (cube 10) 1000)

(check-expect (triple 0) 0)
(check-expect (triple 1) 3)
(check-expect (triple 5) 15)

(check-expect (rectangle-area 6 8) 48)
(check-expect (rectangle-area 5 9) 45)

(test)
