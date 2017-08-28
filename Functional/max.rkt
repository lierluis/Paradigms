(define (max f x1 x2)
  (let ([a (+ x1 (/ (- x2 x1) 3))]
        [b (- x2 (/ (- x2 x1) 3))])
    (display "x1: ") (display (exact->inexact x1)) (display ", x2: ")
    (display (exact->inexact x2)) (display "\n")
    (if (< (f a) (f b))
        (set! x1 a)
        (set! x2 b)
    )
    (if (not (< (- x2 x1) 0.001))
        (max f x1 x2)
        (if (> (string-length (number->string (exact->inexact x1))) 7)
            (display (substring (number->string (exact->inexact x1)) 0 7))
            (display (exact->inexact x1)))
    )
  )
)

#| sample output

> (max abs 2 4)
x1: 2.0, x2: 4.0
x1: 2.6666666666666665, x2: 4.0
x1: 3.111111111111111, x2: 4.0
x1: 3.4074074074074074, x2: 4.0
x1: 3.6049382716049383, x2: 4.0
x1: 3.736625514403292, x2: 4.0
x1: 3.824417009602195, x2: 4.0
x1: 3.88294467306813, x2: 4.0
x1: 3.921963115378753, x2: 4.0
x1: 3.947975410252502, x2: 4.0
x1: 3.965316940168335, x2: 4.0
x1: 3.976877960112223, x2: 4.0
x1: 3.984585306741482, x2: 4.0
x1: 3.9897235378276545, x2: 4.0
x1: 3.9931490252184365, x2: 4.0
x1: 3.9954326834789575, x2: 4.0
x1: 3.996955122319305, x2: 4.0
x1: 3.9979700815462036, x2: 4.0
x1: 3.998646721030802, x2: 4.0
3.99909

|#
