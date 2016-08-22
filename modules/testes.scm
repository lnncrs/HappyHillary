
(define a (cons 'la (cons 'la (cons 'b (cons 'c '())))))
(define b (cons 'a (cons 'c (cons 'e (cons 'a (cons 'a (cons 'a (cons 'b (cons 'c (cons 'd (cons 'd (cons 'c (cons 'c (cons 'e (cons 'e '())))))))))))))))

(load-relative "lib/utils.scm")

(load-relative "modules/io/reader.scm")
(load-relative "modules/workers/counter.scm")

(define txt (reader "data/test/leak_subj_201505-utf8.txt"))
(define ftxt (excl-list txt))

(define counted (count-list ftxt))

(display ftxt)

;(load "/home/gmurayama/HappyHillary/modules/io/write-file.scm")
;(writer "/home/gmurayama/HappyHillary/report/data.js" counted)
;(require-extension srfi-1)
;(define chrs '(#\& #\b #\? #\: #\&))
;(display (char? (car chrs)))

