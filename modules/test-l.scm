
(require-extension srfi-1)
(require-extension srfi-13)
(load-relative "lib/utils.scm")
(load-relative "modules/io/reader.scm")
(load-relative "modules/workers/counter.scm")


(define files ("data/leak/leak_subj_201505.txt" ))


(define data (reader "data/leak/leak_subj_201505.txt"))
(define data (filter (lambda (x) (not (member? x excl-words))) data))
(define data (count-list data))
(define data (filter (lambda (x) (> (car (cdr x)) 5)) data))
;(write data)

(define port (open-output-file "report/data/dataTagData.js"))
;(define tags '("tg_r01g01_data" "tg_r01g02_data" "tg_r01g03_data" "tg_r01g04_data"))
(define tags '("tg_r01g01_data"))
(map (lambda (x) (writer-cloud port data x)) tags)
(close-output-port port)







