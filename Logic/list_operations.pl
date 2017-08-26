isMember(X, [X|_]).
isMember(X, [_|T]) :- isMember(X, T).

firstElement(X, [X|_]).

lastElement(X, [X]).
lastElement(X, [_|T]) :- lastElement(X, T).

twoAdjacent(X, Y, [X,Y|_]).
twoAdjacent(X, Y, [_|T]) :- twoAdjacent(X, Y, T).

threeAdjacent(X, Y, Z, [X,Y,Z|_]).
threeAdjacent(X, Y, Z, [_|T]) :- threeAdjacent(X, Y, Z, T).

appendList([], L2, L2).
appendList([X|T1], L2, [X|T3]) :- appendList(T1, L2, T3).

deleteElement(X, [X|T], T).
deleteElement(X, [H|T], [H|T1]) :- deleteElement(X, T, T1).

appendElement(X, [], [X]).
appendElement(X, [H|T], [H|TX]) :- appendElement(X, T, TX).

insertElement(X, L, XL) :- deleteElement(X, XL, L).

lengthOf([], 0).
lengthOf([_|T], N) :- lengthOf(T, N1), N is 1 + N1.

% requires empty list [] as third argument, e.g. reverseList([1,2,3], X, []).
reverseList([], L, L).
reverseList([H|T], L, Accumulator) :- reverseList(T, L, [H|Accumulator]).

isPalindrome(L) :- reverseList(L, X, []), L == X.

displayList([]).
displayList([H|T]) :- write(H), displayList(T).



/* sample output

8 ?- isMember(1, [1,2,3]).
true ;
false.

9 ?- firstElement(X, [1,2,3]).
X = 1.

10 ?- lastElement(X, [1,2,3]).
X = 3 ;
false.

17 ?- threeAdjacent(X,Y,Z, [1,2,3,4]).
X = 1,
Y = 2,
Z = 3 ;
X = 2,
Y = 3,
Z = 4 ;
false.

18 ?- appendList([1,2],[3,4],X).
X = [1, 2, 3, 4].

20 ?- deleteElement(3, [1,2,3,4], X).
X = [1, 2, 4] ;
false.

21 ?- appendElement(4, [1,2,3], X).
X = [1, 2, 3, 4] ;
false.

22 ?- insertElement(1, [2,3], X).
X = [1, 2, 3] ;
X = [2, 1, 3] ;
X = [2, 3, 1] ;
false.

23 ?- lengthOf([1,2,3], X).
X = 3.

24 ?- reverseList([1,2,3], X, []).
X = [3, 2, 1].

25 ?- isPalindrome([1,2,3]).
false.

26 ?- isPalindrome([1,2,1]).
true.

27 ?- displayList([1,2,3]).
123
true.
*/
