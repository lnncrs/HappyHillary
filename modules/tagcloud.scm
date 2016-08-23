
(require-extension srfi-1)
(require-extension srfi-13)
(load-relative "lib/utils.scm")
(load-relative "modules/io/reader.scm")
(load-relative "modules/io/writer.scm")
(load-relative "modules/workers/counter.scm")

;(define file "data/leak/leak_subj_201505.txt")
;(define tag "tg_r01g01_data")

(define files '(("data/leak/leak_subj_201505.txt" "tg_r01g01_data")
                ("data/leak/leak_subj_201506.txt" "tg_r01g02_data")
                ("data/leak/leak_subj_201507.txt" "tg_r01g03_data")
                ("data/leak/leak_subj_201508.txt" "tg_r01g04_data")
                ))

(define (writer-cloud-wrapper port1 port2 files)
        (let loop ((sl files))   
            (if (not (null? sl))
             (begin
              (let ((file (caar sl) ) ( tag (car (cdr (car sl))) ))
                
                ;(write file)
                ;(write tag)

                ;(define data (filter (lambda (x) (> (car (cdr x)) 5))  (counter (filter (lambda (x) (not (member? x excl-words))) (reader file)))))
                (writer-cloud port1 (filter (lambda (x) (> (car (cdr x)) 5))  (counter (filter (lambda (x) (not (member? x excl-words))) (reader file)))) tag)           
                (display (where? "---" (filter (lambda (x) (> (car (cdr x)) 5))  (counter (filter (lambda (x) (not (member? x excl-words))) (reader file)))) ) port2)
                (display "," port2)
                (newline port2)
              )
              (loop (cdr sl))))))

(define port1 (open-output-file "report/data/dataTagData.js"))
(define port2 (open-output-file "report/data/dataLine03.js"))

(display "var dataLine02 = {
    labels: [

        \"05/15\", \"06/15\", \"07/15\", \"08/15\"

    ],
    datasets: [
        {
            label: \"Emails vazados\",
            pointStyle: \"circle\",
            pointRadius: 3,
            pointHoverRadius: 5,
            backgroundColor: \"rgba(151,187,205,0.2)\",
            data: [" port2)

(writer-cloud-wrapper port1 port2 files)

(display "]
        }
    ]
};" port2)

(close-output-port port1)
(close-output-port port2)







;(exit)
;(define port (open-output-file "report/data/dataTagData.js"))
;(define data01 (reader file))
;(define data02 (filter (lambda (x) (not (member? x excl-words))) data01))
;(define data03 (counter data02))
;(define data04 (filter (lambda (x) (> (car (cdr x)) 5))  data03))
;(define data (filter (lambda (x) (> (car (cdr x)) 5))  (counter (filter (lambda (x) (not (member? x excl-words))) (reader file)))))
;(writer-cloud port data tag)
;(close-output-port port)
;(write data04)
;(exit)
