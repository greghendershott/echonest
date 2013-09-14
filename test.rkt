#lang rackjure

(require "main.rkt")

;; These unit tests:
;; 1. Require an API key in ~/.echonest-api-key
;; 2. Actually connect to the Echonest server and do I/O.
;; 3. Might fail for your API key due to rate limiting.
(module+ test
  (require rackunit net/url json racket/runtime-path)
  (define-syntax-rule (ok v)
    (~> v 'response 'status 'message
        (equal? "Success")))

  ;; Artist ----------------------------------------
  (check-true (ok (artist-biographies 'id "ARR8A0N1187B9A255D")))
  (check-true (ok (artist-blogs 'id "ARR8A0N1187B9A255D")))
  (check-true (ok (artist-familiarity 'name "Cee-Lo")))
  (check-true (ok (artist-hotttnesss 'name "Cee-Lo")))
  (check-true (ok (artist-images 'name "Cee-Lo")))
  (check-true (ok (artist-list-genres)))
  (check-true (ok (artist-list-terms 'type "style")))
  (check-true (ok (artist-list-terms 'type "mood")))
  (check-true (ok (artist-news 'name "Cee-Lo")))
  (check-true (ok (artist-profile 'name "Cee-Lo")))
  (check-true (ok (artist-reviews 'name "Cee-Lo")))
  (check-true (ok (artist-search 'name "Cee-Lo")))
  (check-true (ok (artist-songs 'id "ARR8A0N1187B9A255D")))
  (check-true (ok (artist-similar 'id "ARR8A0N1187B9A255D")))
  (check-true (ok (artist-suggest 'name "John" 'results 10)))
  (check-true (ok (artist-terms 'id "ARR8A0N1187B9A255D")))
  (check-true (ok (artist-top-terms 'results 10)))
  (check-true (ok (artist-twitter 'id "ARR8A0N1187B9A255D")))
  (check-true (ok (artist-urls 'id "ARR8A0N1187B9A255D")))
  (check-true (ok (artist-video 'id "ARR8A0N1187B9A255D")))

  ;;Song ----------------------------------------
  (check-true (ok (song-search 'artist "Frank Zappa"
                               'rank_type "familiarity"
                               'min_liveness "0.9")))
  (check-true (ok (song-profile 'id "SOCZMFK12AC468668F")))
  (check-true (ok (song-identify 'query #<<EOF
                      {
                       "metadata": {
                         "artist": "Michael jackson",
                         "release": "800 chansons des annes 80",
                         "title": "Billie jean",
                         "genre": "",
                         "bitrate": 192,
                         "sample_rate": 44100,
                         "duration": 294,
                         "filename": "../billie_jean.mp3",
                         "samples_decoded": 220598,
                         "given_duration": 20,
                         "version": 3.13
                         },
                       "code": "eJxVlIuNwzAMQ1fxCDL133-xo1rnGqNAEcWy_ERa2aKeZmW9ustWVYrXrl5bthn_laFkzguNWpklEmoTB74JKYZSPlbJ0sy9fQrsrbEaO9W3bsbaWOoK7IhkHFaf_ag2d75oOQSZczbz5CKA7XgTIBIXASvFi0A3W8pMUZ7FZTWTVbujCcADlQ_f_WbdRNJ2vDUwSF0EZmFvAku_CVy440fgiIvArWZZWoJ7GWd-CVTYC5FCFI8GQdECdROE20UQfLoIUmhLC7IiByF1gzbAs3tsSKctyC76MPJlHRsZ5qhSQhu_CJFcKtW4EMrHSIrpTGLFqsdItj1H9JYHQYN7W2nkC6GDPjZTAzL9dx0fS4M1FoROHh9YhLHWdRchQSd_CLTpOHkQQP3xQsA2-sLOUD7CzxU0GmHVdIxh46Oide0NrNEmjghG44Ax_k2AoDHsiV6WsiD6OFm8y-0Lyt8haDBBzeMlAnTuuGYIB4WA2lEPAWbdeOabgFN6TQMs6ctLA5fHyKMBB0veGrjPfP00IAlWNm9n7hEh5PiYYBGKQDP-x4F0CL8HkhoQnRWN997JyEpnHFR7EhLPQMZmgXS68hsHktEVErranvSSR2VwfJhQCnkuwhBUcINNY-xu1pmw3PmBqU9-8xu0kiF1ngOa8vwBSSzzNw=="
                       }                             
EOF
                      )))

  ;; Track ----------------------------------------
  (check-true (ok (track-profile 'id "TRTLKZV12E5AC92E11"
                                 'bucket "audio_summary")))
  (check-true (ok (track-upload-url 'url "https://upload.wikimedia.org/wikipedia/commons/6/62/Meow.ogg")))
  ;; Attribution (CC license): https://en.wikipedia.org/wiki/File:Meow.ogg
  (define-runtime-path meow.ogg "meow.ogg")
  (check-true (ok (track-upload-file 'filetype "ogg"
                                     ;;'Expect "100-continue"
                                     'Content-Length (file-size meow.ogg)
                                     'entity (file->bytes meow.ogg))))

  ;; Playlist ----------------------------------------
  (check-true (ok (playlist-basic 'artist "Weezer"
                                  'results 20
                                  'type "artist-radio")))
  (check-true (ok (playlist-static 'artist '("Weezer" "radiohead")
                                   'results 20
                                   'type "artist")))
  (check-true (ok (playlist-dynamic-create 'artist "weezer"
                                           'type "artist-radio")))
  (let ([session-id (~> (playlist-dynamic-create 'artist "weezer"
                                                 'type "artist-radio")
                        'response 'session_id)])
    (check-true (ok (playlist-dynamic-restart 'artist "deerhoof"
                                              'type "artist-radio"
                                              'session_id session-id)))
    (check-true (ok (playlist-dynamic-delete 'session_id session-id))))

  ;; Catalog ----------------------------------------
  (let ([catalog-id (~> (catalog-create 'name "Test" 'type "general")
                        'response 'id)])
    (check-true (ok (catalog-update 'id catalog-id
                         'data #<<EOF
                         [{
                           "action": "skip",
                           "item": {"item_id": "1"},
                           "item_keyvalues": {
                             "class": ["Primary", "Gold", "Deep Track"],
                             "sound": ["female", "disco", "pop"],
                             "mood":  "upbeat",
                             "rating":  10,
                             "tempo": ["fast", "fast"]
                             }
                           }]
EOF
                         )))
    (check-true (ok (catalog-keyvalues 'id catalog-id)))
    (check-true (ok (catalog-list)))
    (check-true (ok (catalog-similar 'id catalog-id)))
    (check-true (ok (catalog-predict 'id catalog-id 'category "diversity")))
    (check-true (ok (catalog-delete 'id catalog-id))))

  ) ;; module+ test
