; print list
(define (wl lst)
  (cond
    [(null? lst) (display "")]
    [else (display (car lst)) (display " ") (wl (cdr lst))]))

; print args
(define w (lambda x (wl x)))

; convert string of numbers into vector of numbers
(define (conv s) ; input is string
  (let ([vec '#()]) ; initial vector
    (do ((i 0 (+ i 1)))
        ((= i (string-length s))) ; end when i = length of string
      (cond [(not (eqv? (string-ref s i) #\space)) ; ignore whitespace
          (set!
            vec
            (vector-append
              vec
              (vector (string->number (string (string-ref s i))))))])
    )
    vec))

; creates matrix from filename
(define (make filename)
  (define in (open-input-file filename)) ; filename is input port
  (let ([row-col (read-line in)]) ; first line of file = row & col
    (let ([row (string->number (substring row-col 0 1))] ; extract row
          [col (string->number (substring row-col 2 3))]) ; extract col
      (begin
        (define v (make-vector row)) ; vector to return
        (do ((i 0 (+ i 1))) ; i = 0, i++
            ((= i (magnitude row))) ; terminate if i = row
          (vector-set! v i (conv (string-trim (read-line in))))
        )
        v ; return vector of vectors (matrix)
      ))))

; print row of matrix
(define (row filename index)
  (apply w (vector->list (vector-ref (make filename) (- index 1)))))

; print column of matrix
(define (col filename index)
  (let ([column '#()])
    (do ((i 0 (+ i 1)))
        ((= i (vector-length (make filename)))) ; column size = # of rows
      (set! column
        (vector-append
         column
         (vector (vector-ref (vector-ref (make filename) i) (- index 1)))))
    )
    (apply w (vector->list column))))

#| sample output

> (row "/absolute_path/matrix2.dat" 2)
1 2 3
> (col "/absolute_path/matrix2.dat" 2)
2 2 2
> (row "/absolute_path/matrix1.dat" 1)
1 2 3
> (col "/absolute_path/matrix1.dat" 3)
3 6

|#
