#lang racket
(require test-engine/racket-tests)
(require "strings.rkt")

(check-expect (hello "Ahmad") "Hello, Ahmad")
(check-expect (hello "") "Hello, ")

(check-expect (goodbye "Fatima") "Goodbye, Fatima")

(check-expect (greeting "Hello" "John") "Hello, John")
(check-expect (greeting "Eid Mubarak" "Ahmad") "Eid Mubarak, Ahmad")

(check-expect (bold-message "one") "ONE")
(check-expect (bold-message "I am waiting!") "I AM WAITING!")
(check-expect (bold-message (greeting "Happy Birthday" "Mary")) "HAPPY BIRTHDAY, MARY")

(test)
