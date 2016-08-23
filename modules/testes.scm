
(require-extension srfi-1)
(require-extension srfi-13)
(load-relative "lib/utils.scm")
(load-relative "modules/io/reader.scm")
(load-relative "modules/workers/counter.scm")
;(load-relative "modules/io/writer-cloud.scm")

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

(define port (open-output-file "report/data/dataTagData.js"))

;(define ls '((apple 1) (orange 3) (uva 7) (ameixa 1) (abacaxi 3)))

(define fs (filter (lambda (x) (> (car (cdr x)) 1)) ls))

(writer-cloud port fs "tg_r01g01_data")
(close-output-port port)

;(writer-cloud "report/linear2.html" fs "tg_r01g01_data")

;(define x '(apple 1))
;(car (cdr (car ls)))
;(car (cdr x))
;(equal? (car (cdr x)) (car (cdr (car ls))) )
;(equal? (cons 'apple (cons 1 '())) (cons 'apple (cons 1 '())))

;(car ls)
;(cdr ls)
;(car (car ls))
;(car (cdr (car ls)))
;(caar ls)
;(cadar ls)

;(use utils)
;(read-all "report/_models/linear.html")
;(string-inject (read-all "report/_models/cloud.html") "##r01_title##" "Palavras no assunto do email (data do vazamento)")

;(define in (open-input-file "report/_models/linear.html"))
;(define out (open-output-file "report/linear2.html"))

;(display (read-line in) out)
;(newline out)

;(close-output-port out)
;(close-input-port in)

;(string-replace "the #tag# is here" "mayor" 4 9)
;(string-count "mayor" 0 #t)
;(string-inject "the #tag# is here" "#tag#" "mayor")
