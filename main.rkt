#lang racket

(require wffi/client)

(provide (all-defined-out))

(define (read-api-key [file (build-path (find-system-path 'home-dir)
                                        ".echonest-api-key")])
  (match (file->string file #:mode 'text)
    [(pregexp "^\\s*API Key\\s*=\\s*(.*?)\\s*\n+?" (list _ k)) k]
    [else (error 'read-api-key "Bad format for ~a" file)]))

(define api-key (make-parameter (read-api-key)))

(define (add-common-parameters d)
  (dict-set* d 'api_key (api-key)))

(wffi-define-all "echonest.md" add-common-parameters check-response/json)
