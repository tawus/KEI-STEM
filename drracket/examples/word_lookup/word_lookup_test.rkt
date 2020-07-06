#lang racket

(require rackunit
         rackunit/text-ui
         "word_lookup.rkt")

(require/expose "word_lookup.rkt" (load-config creds->headers describe))

(define CONFIG_FILE "config.json")

(define word-lookup-tests
  (test-suite
   "Tests for word lookup"
   (test-case
    "Configuration file is read"
    (check-not-exn (lambda () (load-config CONFIG_FILE))))

   (test-case
    "Credentials loaded from configuration file can be used to create request headers"
    (let* ([config  (load-config CONFIG_FILE)]
           [headers (creds->headers (app-config-credentials config))])
      (check = (length headers) 2)
      (check-true (string-prefix? (car headers) "app_id: "))
      (check-true (string-prefix? (car (cdr headers)) "app_key: "))))

   (test-case
    "The json is described as string"
    (check-equal? (describe 'x) "x")
    (check-equal? (describe "x") "x")
    (check-equal? (describe (list 1 2)) "\n1\n2")
    (check-equal? (describe (hash-set (make-immutable-hash) 'one 1)) "\none: 1"))
   
   (test-case
    "Words can be lookup"
    (let* ([config (load-config CONFIG_FILE)])
      (check-not-exn (lambda () (lookup-word "ingenious" config)))))))
      

(run-tests word-lookup-tests)
