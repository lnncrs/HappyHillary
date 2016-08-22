
(require-extension srfi-1)
(require-extension srfi-13)

;(define a (cons 'la (cons 'la (cons 'b (cons 'c '())))))
;(define b (cons 'a (cons 'c (cons 'e (cons 'a (cons 'a (cons 'a (cons 'b (cons 'c (cons 'd (cons 'd (cons 'c (cons 'c (cons 'e (cons 'e '())))))))))))))))

(load-relative "lib/utils.scm")
(load-relative "modules/io/reader.scm")
(load-relative "modules/workers/counter.scm")

(define txt (reader "data/test/leak_subj_201505.txt"))
(define ftxt (excl-list txt))

(define counted (count-list ftxt))
(display counted)

;(string-replace "the #tag# is here" "mayor" 4 9)
;(string-count "mayor" 0 #t)
;(string-inject "the #tag# is here" "#tag#" "mayor")
