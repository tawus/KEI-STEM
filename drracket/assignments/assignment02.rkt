#lang racket
(provide ackermann fx)
(require test-engine/racket-tests)

;; Please make sure you have written tests for all the functions below.
;;

;;
;; Calculate Ackermann function for a given value `n` and `m`
;; https://en.wikipedia.org/wiki/Ackermann_function
;;Ackermann is  a function with two arguments each of which can be assigned any non-negative integer.
;;(ackermann n m) = (+ m 1) | n = 0
;;(ackermann n m) = (ackermann (- n 1) 1)| (n != 0) and (m = 0)
;;(ackermann n m)=(ackermann (- n 1) (ackermann n (- m 1)))| (n != 0) and (m != 0)
(define (ackermann n m)
 (cond
   [(= n 0) (+ m 1)]
   [(and (not (= n 0))(= m 0))(ackermann(- n 1) 1)]
   [else (and (not (= n 0)) (not(= m 0))) (ackermann (- n 1) (ackermann n (- m 1)))]))             
     
(check-expect (ackermann 0 3) 4)        
(check-expect (ackermann 2 0) 3)
(check-expect (ackermann 1 3) 5)
(check-expect (ackermann 4 0) 13)


;; Write a function for the mathematical function
;; f(n) = n if n < 3
;; f(n) = f(n - 1) + 2 * f(n - 2) + 3 * f(n - 3) if n >= 3
;;
(define (fx n)
  (cond
    [(< n 3) n ]
    [else (+ (fx (- n 1)) (* 2 (fx (- n 2))) (* 3 (fx (- n 3)))
                          )]
    )
  )

(check-expect (fx 3) 4)
(check-expect (fx 4) 11)
(check-expect (fx 5) 25)
(test)
