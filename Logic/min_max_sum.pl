min([X], X).
min([H,K|T], X) :- H =< K, min([H|T], X).
min([H,K|T], X) :- H > K, min([K|T], X).

max([X], X).
max([H,K|T], X) :- H > K, max([H|T], X).
max([H,K|T], X) :- H =< K, max([K|T], X).

sum(L, MinPlusMax) :- min(L, X), max(L, Y), MinPlusMax is X+Y.

/* sample output:

?- sum([3,4,1,2],X).
X = 5 ;
false.
*/
