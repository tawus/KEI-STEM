#lang racket
;; 
;; This is a simple dictionary lookup utility.
;; It uses rest api's from https://developer.oxforddictionaries.com to lookup
;; a word.
;;
(require net/url
         json
         racket/port)

(provide lookup-word (struct-out app-config) (struct-out oxford-credentials))

(struct oxford-credentials (app-id app-key))

(struct app-config (credentials))

(define CONFIG_FILE "config.json")

;;
;; Checkout the example of the offical website of oxford dictionary to see
;; how the link has been created
;;
;; https://developer.oxforddictionaries.com/documentation/getting_started
;;
(define (create-url word language)
  (string->url
   (string-append
    "https://od-api.oxforddictionaries.com:443/api/v2/entries/" language "/"
    (string-downcase word))))

(define (creds->headers creds)
  (list (string-append "app_id: " (oxford-credentials-app-id creds))
        (string-append "app_key: " (oxford-credentials-app-key creds))))

(define (get-json url creds)
  (call/input-url url get-pure-port (compose string->jsexpr port->string) (creds->headers creds)))

(define (load-config file-name)
  (let* ([config-data (call-with-input-file file-name (compose string->jsexpr port->string))]
         [creds (hash-ref config-data 'credentials)])
    (app-config (oxford-credentials (hash-ref creds 'app-id) (hash-ref creds 'app-key)))))

(define (string-indent s indent)
  (string-append (make-string indent #\space) s))

(define (describe x [indent 0] [indent-by 2])
  (let* ([desc-deep (lambda (x) (describe x (+ indent indent-by) indent-by))]
         [desc-hash-entry (lambda (k v) (string-append (describe k indent) ": " (desc-deep v)))])
    (cond
      [(symbol? x) (string-indent (symbol->string x) indent)]
      [(hash? x)   (string-append "\n" (string-join (hash-map x desc-hash-entry) "\n"))]
      [(list? x)   (string-append "\n" (string-join (map desc-deep x) "\n"))]
      [(string? x) x]
      [else        (format "~v" x)])))

(define (lookup-word word [config null] [language "en-gb"])
  (let* ([url  (create-url word language)]
         [config (if (null? config) (load-config CONFIG_FILE) config)]
         [json (get-json url (app-config-credentials config))])
    json))

