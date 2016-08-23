
(require-extension srfi-1)
(require-extension srfi-13)
(load-relative "lib/utils.scm")
(load-relative "modules/io/reader.scm")
(load-relative "modules/io/writer.scm")
(load-relative "modules/workers/counter.scm")

;(define files '("data/leak/leak_subj_201505.txt"
;                "data/leak/leak_subj_201506.txt"
;                "data/leak/leak_subj_201507.txt"
;                "data/leak/leak_subj_201508.txt"))

;(define tags '("tg_r01g01_data"
;               "tg_r01g02_data"
;               "tg_r01g03_data"
;               "tg_r01g04_data"))

(define files '("data/leak/leak_subj_201505.txt"))
(define tags '("tg_r01g01_data"))

(define sets (map (lambda (x) (reader x)) files))

;(define data- (filter (lambda (x) (member? (car (car x)) excl-words)) (car sets)))

(define sets (map (lambda (x) (counter x)) sets))

;(define sets (filter (lambda (x) (> (car (cdr x)) 5)) (car sets)))

;(write sets)
;(member? "that" excl-words)
;(car (car sets))

;(define ls (car sets))
;(write (filter (lambda (x) (not (member? x excl-words))) ls))
;(car sets)

;(exit)

(define port (open-output-file "report/data/dataTagData.js"))

(define (writer-cloud-wrapper port reader tags)
        (let loop ((sl reader) (tl tags))   
            (if (not (null? tl))
             (begin

              ;(writer-cloud port (car sl) (car tl))
             
              (let ( (t (car sl)) )                                    
                   
                   (let ( (u (car (counter (filter (lambda (x) (not (member? x excl-words))) t))) ) )
                     
                     (write u)
                     ;(write (filter (lambda (x) (> (car (cdr x)) 5) ) (car u)))
                   

                  )
                  
                  ;write (filter (lambda (x) (> (car (cdr x)) 5)) (counter (car sl)) )        
              )
              ;(write (car tl))

              ;(writer-cloud port (filter (lambda (x) (> (car (cdr x)) 5)) (car sl)) (car tl))
              ;(define fs (filter (lambda (x) (> (car (cdr x)) 5)) (car sl)))
              ;(writer-cloud port fs (car tl))

              (loop (cdr sl) (cdr tl))
             )
            )))





(writer-cloud-wrapper port sets tags)

;(map (lambda (x) (writer-cloud port sets x)) tags)

;(close-output-port port)





;(define data (filter (lambda (x) (not (member? x excl-words))) data))
;(define data (counter data))
;(define data (filter (lambda (x) (> (car (cdr x)) 5)) data))
;(write data)

;(define port (open-output-file "report/data/dataTagData.js"))
;(define tags '("tg_r01g01_data"))
;(map (lambda (x) (writer-cloud port data x)) tags)
;(close-output-port port)




(define writer-cloud
    (lambda (port values set)
        ;(let ((port (open-output-file path)))
            (display (string-append "var " set " = [") port)
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
