#lang rackjure

(require wffi/client
         wffi/markdown)

(provide (all-defined-out))

(define (read-api-key [file (build-path (find-system-path 'home-dir)
                                        ".echonest-api-key")])
  (match (file->string file #:mode 'text)
    [(pregexp "^\\s*API Key\\s*=\\s*(.*?)\\s*\n+?" (list _ k)) k]
    [else (error 'read-api-key "Bad format for ~a" file)]))
(define api-key (make-parameter (read-api-key)))

(define (add-common-parameters h)
  (hash-set* h
             'api_key (api-key)))

(wffi-define-all "echonest.md" add-common-parameters check-response/json)

;; Example uses

;; Artist ----------------------------------------
;; (pretty-print (artist-biographies 'id "ARR8A0N1187B9A255D"))
;; (pretty-print (artist-blogs 'id "ARR8A0N1187B9A255D"))
;; (pretty-print (artist-familiarity 'name "Cee-Lo"))
;; (pretty-print (artist-hotttnesss 'name "Cee-Lo"))
;; (pretty-print (artist-images 'name "Cee-Lo"))
;; (pretty-print (artist-list-genres))
;; (pretty-print (artist-list-terms 'type "style"))
;; (pretty-print (artist-list-terms 'type "mood"))
;; (pretty-print (artist-news 'name "Cee-Lo"))
;; (pretty-print (artist-profile 'name "Cee-Lo"))
;; (pretty-print (artist-reviews 'name "Cee-Lo"))
;; (pretty-print (artist-search 'name "Cee-Lo"))
;; (pretty-print (artist-songs 'id "ARR8A0N1187B9A255D"))
;; (pretty-print (artist-similar 'id "ARR8A0N1187B9A255D"))
;; (pretty-print (artist-suggest 'name "John" 'results 10))
;; (pretty-print (artist-terms 'id "ARR8A0N1187B9A255D"))
;; (pretty-print (artist-top-terms 'results 10))
;; (pretty-print (artist-twitter 'id "ARR8A0N1187B9A255D"))
;; (pretty-print (artist-urls 'id "ARR8A0N1187B9A255D"))
;; (pretty-print (artist-video 'id "ARR8A0N1187B9A255D"))

;; Song ----------------------------------------
;; (pretty-print (song-search 'artist "Frank Zappa"
;;                            'rank_type "familiarity"
;;                            'min_liveness "0.9"))
;; (pretty-print (song-profile 'id "SOCZMFK12AC468668F"))
;; (pretty-print (song-identify 'query #<<EOF
;; {
;;   "metadata": {
;;     "artist": "Michael jackson",
;;     "release": "800 chansons des annes 80",
;;     "title": "Billie jean",
;;     "genre": "",
;;     "bitrate": 192,
;;     "sample_rate": 44100,
;;     "duration": 294,
;;     "filename": "../billie_jean.mp3",
;;     "samples_decoded": 220598,
;;     "given_duration": 20,
;;     "version": 3.13
;;   },
;;   "code": "eJxVlIuNwzAMQ1fxCDL133-xo1rnGqNAEcWy_ERa2aKeZmW9ustWVYrXrl5bthn_laFkzguNWpklEmoTB74JKYZSPlbJ0sy9fQrsrbEaO9W3bsbaWOoK7IhkHFaf_ag2d75oOQSZczbz5CKA7XgTIBIXASvFi0A3W8pMUZ7FZTWTVbujCcADlQ_f_WbdRNJ2vDUwSF0EZmFvAku_CVy440fgiIvArWZZWoJ7GWd-CVTYC5FCFI8GQdECdROE20UQfLoIUmhLC7IiByF1gzbAs3tsSKctyC76MPJlHRsZ5qhSQhu_CJFcKtW4EMrHSIrpTGLFqsdItj1H9JYHQYN7W2nkC6GDPjZTAzL9dx0fS4M1FoROHh9YhLHWdRchQSd_CLTpOHkQQP3xQsA2-sLOUD7CzxU0GmHVdIxh46Oide0NrNEmjghG44Ax_k2AoDHsiV6WsiD6OFm8y-0Lyt8haDBBzeMlAnTuuGYIB4WA2lEPAWbdeOabgFN6TQMs6ctLA5fHyKMBB0veGrjPfP00IAlWNm9n7hEh5PiYYBGKQDP-x4F0CL8HkhoQnRWN997JyEpnHFR7EhLPQMZmgXS68hsHktEVErranvSSR2VwfJhQCnkuwhBUcINNY-xu1pmw3PmBqU9-8xu0kiF1ngOa8vwBSSzzNw=="
;; }                             
;; EOF
;; ))

;; Track ----------------------------------------
;; (pretty-print (track-profile 'id "TRTLKZV12E5AC92E11"
;;                              'bucket "audio_summary"))
;; ;; The preceding, plus dig into the response and get the
;; ;; (very big!) analysis file.
;; (require net/url json)
;; (~> (track-profile 'id "TRNQTJI14117D3DE7A"
;;                    'bucket "audio_summary")
;;     'response 'track 'audio_summary 'analysis_url
;;     string->url
;;     (call/input-url get-pure-port read-json)
;;     pretty-print)

;;(pretty-print (track-upload-url 'url "http://www.example.com/foo.mp3"))

;; (define path (string->path "/Users/greg/Desktop/Fragmnts Sampler/10.InterLaken-Genghis.mp3"))
;; (pretty-print (track-upload-file 'filetype "mp3"
;;                                  ;;'Expect "100-continue"
;;                                  'Content-Length (file-size path)
;;                                  'entity (file->bytes path)))


;; Playlist ----------------------------------------
;; (pretty-print (playlist-basic 'artist "Weezer"
;;                               'results 20
;;                               'type "artist-radio"))
;; (pretty-print (playlist-static 'artist '("Weezer" "radiohead")
;;                                'results 20
;;                                'type "artist"))
;; (pretty-print (playlist-dynamic-create 'artist "weezer"
;;                                        'type "artist-radio"))
;; (pretty-print (playlist-dynamic-restart 'artist "deerhoof"
;;                                         'type "artist-radio"
;;                                         'session_id "7bf982d80ed8421c8c94dbd6de565e9d"))


;; Catalog ----------------------------------------
;; (pretty-print (catalog-create 'name "Test"
;;                               'type "general"))

;; (pretty-print (catalog-update 'id "CAOYCFO1411A886DEA"
;;                               'data #<<EOF
;; [{
;;   "action": "skip",
;;   "item": {"item_id": "1"},
;;   "item_keyvalues": {
;;      "class": ["Primary", "Gold", "Deep Track"],
;;      "sound": ["female", "disco", "pop"],
;;      "mood":  "upbeat",
;;      "rating":  10,
;;      "tempo": ["fast", "fast"]
;;      }
;; }]
;; EOF
;; ))

;; (pretty-print (catalog-keyvalues 'id "CAOYCFO1411A886DEA"))

;; (pretty-print (catalog-list))

;; (pretty-print (catalog-similar 'id "CAOYCFO1411A886DEA"))

;; (pretty-print (catalog-predict 'id "CAOYCFO1411A886DEA"
;;                                'category "diversity"))
