; using do loop

(define (sp-do vec1 vec2)
  (if (= (vector-length vec1) (vector-length vec2))
      (let ([acc 0]) ; accumulator = 0;
        (do ((i 0 (+ i 1))) ; initialization: i = 0; iteration: i++
            ((= i (vector-length vec1))) ; terminate when i = length

          ; acc += (vec1[i] * vec2[i])
          (set! acc (+ acc (* (vector-ref vec1 i) (vector-ref vec2 i))))
        )
        (display acc)
      )
      (display "ERROR: Different sizes of vectors!") ; else
   )
)

; using recursion

(define acc 0) ; accumulator: global variable
(define (sp-rec vec1 vec2)
  (if (= (vector-length vec1) (vector-length vec2))
      (if (> (vector-length vec1) 0)
          (begin
            (set! acc (+ acc ; acc += vec[1] * vec[2]
                 (* (first (vector->list vec1))
                    (first (vector->list vec2)))))
            (sp-rec (list->vector (rest (vector->list vec1))) ; recurse
                    (list->vector (rest (vector->list vec2))))
          )
          (begin
            (display acc)
            (set! acc 0)) ; reset global variable to 0
      )
      (display "ERROR: Different sizes of vectors!") ; else
  )
)

#| sample output

> (sp-do '#(1 2 3) '#(2 1 1))
7
> (sp-do '#(1 2 3) '#(1 2 3 4 5))
ERROR: Different sizes of vectors!
> (sp-rec '#(1 2 3) '#(2 1 1))
7
> (sp-rec '#(1 2 3) '#(1 2 3 4 5))
ERROR: Different sizes of vectors!

|#
