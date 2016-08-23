
(require-extension srfi-1)
(require-extension srfi-13)
(load-relative "lib/utils.scm")
;(load-relative "modules/io/reader.scm")
;(load-relative "modules/workers/counter.scm")

;(define txt (reader "data/test/leak_subj_201505.txt"))
;(define txt (reader "modules/io/test.txt"))
;(write txt)
;(define ftxt (excl-list txt))
;(define counted (count-list ftxt))

;(use utils)
;(read-all "report/_models/linear.html")

(define in (open-input-file "report/_models/linear.html"))
(define out (open-output-file "report/linear2.html"))

(display (read-line in) out)
(newline out)

(close-output-port out)
(close-input-port in)

;(string-replace "the #tag# is here" "mayor" 4 9)
;(string-count "mayor" 0 #t)
;(string-inject "the #tag# is here" "#tag#" "mayor")
