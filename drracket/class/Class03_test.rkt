#lang racket
(require "Class03.rkt"
         test-engine/racket-tests)


(check-expect (minimum 5 10) 5)
(check-expect (minimum 10 6) 6)
(check-expect (minimum -1 -5) -5)

(check-expect (maximum 5 10) 10)
(check-expect (maximum 10 6) 10)
(check-expect (maximum -1 -5) -1)

(check-expect (vowel? #\a) #t)
(check-expect (vowel? #\x) #f)
(check-expect (vowel? #\A) #t)


(check-expect (grade-simple 49) #\F)
(check-expect (grade-simple 55) #\C)
(check-expect (grade-simple 67) #\B)
(check-expect (grade-simple 70) #\A)
(check-expect (grade-simple 95) #\A)


(test)
