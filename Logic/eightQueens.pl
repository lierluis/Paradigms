nocheck(_, []).
nocheck(X/Y, [X1/Y1 | Rest]) :-
    Y =\= Y1,
    abs(Y1-Y) =\= abs(X1-X),
    nocheck(X/Y, Rest).
legal([]).
legal([X/Y | Rest]) :-
    legal(Rest),
    member(Y, [1,2,3,4,5,6,7,8]),
    nocheck(X/Y, Rest).
eightQueens(X) :-
    X=[1/_,2/_,3/_,4/_,5/_,6/_,7/_,8/_], legal(X).


/* sample output

33 ?- eightQueens(X).
X = [1/4, 2/2, 3/7, 4/3, 5/6, 6/8, 7/5, 8/1] ;
X = [1/5, 2/2, 3/4, 4/7, 5/3, 6/8, 7/6, 8/1] ;
X = [1/3, 2/5, 3/2, 4/8, 5/6, 6/4, 7/7, 8/1] ;
X = [1/3, 2/6, 3/4, 4/2, 5/8, 6/5, 7/7, 8/1] ;
X = [1/5, 2/7, 3/1, 4/3, 5/8, 6/6, 7/4, 8/2] ;
X = [1/4, 2/6, 3/8, 4/3, 5/1, 6/7, 7/5, 8/2] ;
X = [1/3, 2/6, 3/8, 4/1, 5/4, 6/7, 7/5, 8/2] ;
X = [1/5, 2/3, 3/8, 4/4, 5/7, 6/1, 7/6, 8/2] ;
X = [1/5, 2/7, 3/4, 4/1, 5/3, 6/8, 7/6, 8/2] ;
X = [1/4, 2/1, 3/5, 4/8, 5/6, 6/3, 7/7, 8/2] .

etc.
*/
