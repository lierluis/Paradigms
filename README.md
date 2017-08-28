# Paradigms

## Procedural (C++)

#### 1. Plateau program (max sequence length)

This program finds the longest sequence of identical numbers in a sorted array.

#### 2. Parabolic Approximation

This program reads 3 points on a curve: (x1, y1), (x2, y2), (x3, y3)
and computes y values for n=40 equidistant x values such that
x1 <= x <= x3 using Cramer's rule and Lagrange interpolation.

#### 3. Array Processing (array reduction)

This program reduces an array by eliminating from it all
values that are equal to the three highest unique integers.

#### 4. Integer Plot Function

This program displays an arbitrary positive
integer n using big characters of size 7x7.

#### 5. Iteration vs Recursion

This program searches through an array and finds a number using
a binary search algorithm both iteratively and recursively.

#### 6. Polynomials

This program performs addition, multiplication,
derivatives, and integrals of polynomials.

## Logic (Prolog)

#### 1. Family tree

This program showcases the use of facts and
inference rules in Prolog using a family tree.

#### 2. CS class schedule

Same as previous program, but with the schedule
of CS classes for the SFSU Fall 2015 semester.

#### 3. Family tree 2

This program investigates family relationships using lists in Prolog.

#### 4. List operations

This program showcases the use of list processing in Prolog.

#### 5. 8 queens problem

This program solves the 8 queens problem (location of 8 queens
on a chess board such that no queens have each other in check,
i.e., are not located in the same row/column/diagonal).

#### 6. List min & max sum

This program finds the sum of the min and max of a list in Prolog.

#### 7. Findall

This program uses the findall predicate in Prolog
to find the youngest grandchildren of a person P.

## Functional (Racket/Scheme)

#### 1. Sigma

This program computes the standard deviation of any number of arguments.

#### 2. Histogram

This program recursively prints a histogram of stars for a list of integers.

#### 3. Max of function

This program computes the maximum max(f x1 x2) of a function f within the
interval [x1, x2]. It uses the trisection method and finds the coordinates
of maximum xmax with an accuracy of 6 significant decimal digits.

#### 4. Scalar product of two vectors

This program computes the scalar product of two vectors
both iteratively (using the DO loop) and recursively.

#### 5. Matrix row & col

The files "matrix1.dat" and "matrix2.dat" contain two rectangular matrices.
In both cases the first row contains the number of rows and columns in the
matrix. The remaining rows contain the elements within the matrix.

This program reads from a file containing a matrix and
outputs any one its rows or columns. The matrices are
stored in memory as vectors whose components are vectors.

## Object-Oriented (Ruby)

#### 1. Mean & sigma

This program calculates and returns the mean value
and standard deviation of numbers stored in an array.

#### 2. Sort array

This program sorts an array v without changing it and returns the sorted array.

#### 3. Triangle

This program computes the perimeter and the area of
arbitrary triangles and classifies them as being either
equilateral, isosceles, scalene, right, or not a triangle.

#### 4. Recognizer methods

This program implements the recognizer methods `limited?` and `sorted?` that
expand the Ruby class Array.

* The expression `array.limited?(amin,amax)` returns
`true` if amin <= a[i] <= amax for all values of i.

* The expression `array.sorted?` returns
    * 0 if the array is not sorted
    * +1 if a[0] <= a[1] <= a[2] <= ... (increasing sequence)
    * -1 if a[0] >= a[1] >= a[2] >= ... (decreasing sequence)

## Extra: BNF (Backus-Naur form)

#### 1. numbers.txt

BNF syntax definitions of the following objects:

1. Natural number (1, 2, 3, ...)
2. Unsigned integer (0, 1, 2, 3, ...)
3. Integer (..., -2, -1, 0, 1, 2, ...)
4. Odd number (..., -3, -1, 1, 3, ...)
5. Even number (..., -4, -2, 0, 2, 4, ...)
6. Integer divisible by five (..., -10, -5, 0, 5, 10, ...)

#### 2. input_output.txt

BNF definition of the syntax of (all possible)
input and output statements in C++.

Example input statement:

```c++
cin >> sclr >> vec[2*i-1] >> mat[f(i)][j+k] >> t[i/3][j][k];
```

Example output statement:

```c++
cout    << 12.34*a/rate << " " << 43.21 << " "
        << alpha + x[2*i-1] << " " << (p && q) << " "
        << pow(t[i][j], 1.2) << " string " << 's'
        << " " << myfun(x, sin(x+y), third_argument);
```

Note:
* Variables may have any number of indices and
indices can be arbitrary arithmetic expressions.
* Theoretically, I/O statements can reach rather high
levels of complexity; therefore, options beyond those
presented in the above examples are not included.
