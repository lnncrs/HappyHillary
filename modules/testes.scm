
(require-extension srfi-1)
(require-extension srfi-13)
(load-relative "lib/utils.scm")
(load-relative "modules/io/reader.scm")
(load-relative "modules/workers/counter.scm")

(define writer-cloud
    (lambda (port values set)
        ;(let ((port (open-output-file path)))
            (display (string-append "var " set " = [") port)
            (newline port)
            (let f ((ls values))
                (if (null? (cdr ls))
                    (if (not (equal? (caar ls) ""))
                        (begin
                            (display "{ text: \"" port)
                            (write (caar ls) port)
                            (display "\", weight: " port)
                            (display (+ (cadar ls) 3) port)
                            (display "}" port)
                            (newline port)))
                    (if (equal? (caadr ls) "")
                        (begin
                            (display "{ text: \"" port)
                            (write (caar ls) port)
                            (display "\", weight: " port)
                            (display (+ 3 (cadar ls)) port)
                            (display " }" port)
                            (newline port)
                            (f (cdr ls)))
                        (if (not (or (or (or (or (or (or (equal? (caar ls) "the") (equal? (caar ls) "these")) (equal? (caar ls) "or")) (equal? (caar ls) "and")) (equal? (caar ls) "for")) (equal? (caar ls) "to")) (equal? (caar ls) "are")))
                            (begin
                                (display "{ text: \"" port)
                                (write (caar ls) port)
                                (display "\", weight: " port)
                                (display (+ 3 (cadar ls)) port)
                                (display " }," port)
                                (newline port)
                                (f (cdr ls)))))))
            (display "];" port)
            (newline port)
            ;(close-output-port port)
            ;)
            ))


(define data (reader "data/leak/leak_subj_201505.txt"))
(define data (filter (lambda (x) (not (member? x excl-words))) data))
(define data (count-list data))
(define data (filter (lambda (x) (> (car (cdr x)) 3)) data))

(write data)

;(define ch #\:)
;(display (member? ch excl-chars))



;(define port (open-output-file "report/data/dataTagData.js"))

;(define ls '((apple 1) (orange 3) (uva 7) (ameixa 1) (abacaxi 3)))
;(define fs (filter (lambda (x) (> (car (cdr x)) 1)) ls))

;(define tags '("tg_r01g01_data" "tg_r01g02_data" "tg_r01g03_data" "tg_r01g04_data"))

;(map (lambda (x) (writer-cloud port fs x)) tags)

;(close-output-port port)


;(define ch '(#\a #\b #\c #\:))
;(filter (lambda (x) (member? excl-words x)) ch)



