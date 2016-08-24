
(require-extension srfi-1)
(require-extension srfi-13)

(load-relative "lib/utils.scm")
(load-relative "modules/io/reader.scm")
(load-relative "modules/io/writer.scm")
(load-relative "modules/workers/counter.scm")

(define files '(("data/leak/leak_subj_201505.txt" "tg_r01g01_data")
                ("data/leak/leak_subj_201506.txt" "tg_r01g02_data")
                ("data/leak/leak_subj_201507.txt" "tg_r01g03_data")
                ("data/leak/leak_subj_201508.txt" "tg_r01g04_data")
                ))

(define (writer-cloud-wrapper port files)
        (let loop ((sl files))   
            (if (not (null? sl))
             (begin
              (let ((file (caar sl) ) ( tag (car (cdr (car sl))) ))
                
                ;(write file)
                ;(write tag)

                ;(define data (filter (lambda (x) (> (car (cdr x)) 5))  (counter (filter (lambda (x) (not (member? x excl-words))) (reader file)))))
                (writer-cloud port (filter (lambda (x) (> (car (cdr x)) 5))  (counter (filter (lambda (x) (not (member? x excl-words))) (reader file)))) tag)           
                ;(display (where? "---" (filter (lambda (x) (> (car (cdr x)) 5))  (counter (filter (lambda (x) (not (member? x excl-words))) (reader file)))) ) port2)
                ;(display "," port2)
                ;(newline port2)
              )
              (loop (cdr sl))))))

(define port (open-output-file "report/data/dataTagData.js"))
;(define port2 (open-output-file "report/data/dataLine03.js"))

(writer-cloud-wrapper port files)

(close-output-port port)
;(close-output-port port2)
