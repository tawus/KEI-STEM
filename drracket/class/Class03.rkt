#lang racket

(provide minimum maximum vowel? grade-simple)

(define (square x)
  (* x x))

(define (quadruple x)
  (square (square x)))

(define (odd-number? x)
  (= (remainder x 2) 1))

(define (even-number? x)
  (not (odd-number? x)))

(define (minimum x y)
  (if (< x y) x y))

(define (maximum x y)
  (if (> x y) x y))

(define (vowel? x)
  (or (eqv? x #\a) (eqv? x #\A)
      (eqv? x #\e) (eqv? x #\E)
      (eqv? x #\i) (eqv? x #\I)
      (eqv? x #\o) (eqv? x #\O)
      (eqv? x #\u) (eqv? x #\U)))

(define (consonant? x)
  (not (vowel? x)))

(define (discount-if-your-name-starts-with-a-vowel name)
  (if (vowel? (string-ref name 0))
      0.2
      0.0))

(define (grade percentage)
  (if (< percentage 50)
      #\F
      (if (< percentage 60)
          #\C
          (if (< percentage 70)
              #\B
              #\A))))

(define (absolute-value x)
  (if (>= x 0)
      x
      (- x)))

(define (absolute-value-2 x)
  (cond
    [(>= x 0) x]
    [else     (- x)]))

(define (grade-simple percentage)
  (cond
    [(< percentage 50) #\F]
    [(< percentage 60) #\C]
    [(< percentage 70) #\B]
    [else #\A]))

(define (discount amount)
  (cond
    [(< amount 1000) 0.0]
    [(< amount 5000) 0.2]
    [else 0.3]))

(define (bill amount)
  (- amount (* amount (discount amount))))

(define (bp-status systolic diastolic)
  (cond
    [(or (< systolic 70) (< diastolic 110)) -1]
    [(or (> systolic 85) (> diastolic 125)) 1]
    [else 0]))


  





