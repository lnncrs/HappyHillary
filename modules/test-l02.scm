
(require-extension srfi-1)
(require-extension srfi-13)
(load-relative "lib/utils.scm")
(load-relative "modules/io/reader.scm")
(load-relative "modules/io/writer.scm")
(load-relative "modules/workers/counter.scm")

(define file "data/leak/leak_subj_201505.txt")
(define tag "tg_r01g01_data")

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

(define (writer-cloud-wrapper port data tags)
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
