
(require-extension srfi-1)
(require-extension srfi-13)
(require-extension utils)
(load-relative "lib/utils.scm")
(load-relative "modules/io/reader.scm")
(load-relative "modules/io/writer.scm")
(load-relative "modules/workers/counter.scm")

(define file "data/leak/leak_subj_201505.txt")
(define tag "tg_r01g01_data")

(define ls (counter (string-split (read-all file))))

(define (where? x ls)
 (if (null? ls)
  0
  (if(equal? x (car (car ls)))
   (cadar ls)
   (where? x (cdr ls)))))

(where? "---" ls)

