
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

(define (writer-linear-wrapper port files)
        (let loop ((sl files))   
            (if (not (null? sl))
             (begin
              (let ((file (caar sl) ) ( tag (car (cdr (car sl))) ))
                
                ;(write file)
                ;(write tag)

                (display (where? "---" (filter (lambda (x) (> (car (cdr x)) 5))  (counter (filter (lambda (x) (not (member? x excl-words))) (reader file)))) ) port)
                (display "," port)
                (newline port)
              )
              (loop (cdr sl))))))

(define port (open-output-file "report/data/dataLine03.js"))

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
            data: [" port)

(writer-linear-wrapper port files)

(display "]
        }
    ]
};" port)

(close-output-port port)
