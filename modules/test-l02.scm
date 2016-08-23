
(require-extension srfi-1)
(require-extension srfi-13)
(load-relative "lib/utils.scm")
(load-relative "modules/io/reader.scm")
;(load-relative "modules/io/writer.scm")
(load-relative "modules/workers/counter.scm")

(define file "data/leak/leak_subj_201505.txt")
(define tag "tg_r01g01_data")

(define writer-cloud
    (lambda (port values name)
        ;(let ((port (open-output-file path)))
            (display (string-append "var " name " = [") port)
            (newline port)
            (let f ((ls values))
                (if (null? (cdr ls))
                    (if (not (equal? (caar ls) ""))
                        (begin
                            (display "{ text: " port)
                            (write (caar ls) port)
                            (display ", weight: " port)
                            (display (+ (cadar ls) 3) port)
                            (display "}" port)
                            (newline port)))
                    (if (equal? (caadr ls) "")
                        (begin
                            (display "{ text: " port)
                            (write (caar ls) port)
                            (display ", weight: " port)
                            (display (+ 3 (cadar ls)) port)
                            (display " }" port)
                            (newline port)
                            (f (cdr ls)))
                        (if (not (or (or (or (or (or (or (equal? (caar ls) "the") (equal? (caar ls) "these")) (equal? (caar ls) "or")) (equal? (caar ls) "and")) (equal? (caar ls) "for")) (equal? (caar ls) "to")) (equal? (caar ls) "---")))
                            (begin
                                (display "{ text: " port)
                                (write (caar ls) port)
                                (display ", weight: " port)
                                (display (+ 3 (cadar ls)) port)
                                (display " }," port)
                                (newline port)
                                (f (cdr ls)))))))
            (display "];" port)
            (newline port)
            ;(close-output-port port)
            ;)
            ))

;(define data01 (reader file))
;(define data02 (filter (lambda (x) (not (member? x excl-words))) data01))
;(define data03 (counter data02))
;(define data04 (filter (lambda (x) (> (car (cdr x)) 5))  data03))

(define data (filter (lambda (x) (> (car (cdr x)) 5))  (counter (filter (lambda (x) (not (member? x excl-words))) (reader file)))))

(define port (open-output-file "report/data/dataTagData.js"))

(writer-cloud port data tag)

(close-output-port port)

;(write data04)
;(exit)

