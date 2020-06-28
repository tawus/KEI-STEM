#lang racket
(provide hello goodbye greeting bold-message formal-sentence)

(define (hello name)
  (string-append "Hello, " name))

(define (goodbye name)
  (string-append "Goodbye, " name))

(define (greeting message name)
  (string-append message ", " name))

(define (bold-message message)
  (string-upcase message))

(define (formal-sentence message)
  (string-titlecase message))
