age(luis, 23).
age(ruben, 25).
age(marvin, 23).
age(claudia, 31).
parent(luisa, luis).
parent(luisa, ruben).
parent(maria, marvin).
parent(maria, claudia).
parent(elba, luisa).
parent(elba, maria).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y), X \= Y.
youngest(X) :- age(X, Y), \+ (age(_, Z), Z < Y).
youngestGrandchild(X, Y) :- grandparent(Y, X), youngest(X).

/* sample output

?- consult('/filepath/findall').
true.

?- findall(P, youngestGrandchild(P, elba), Xlist).
Xlist = [luis, marvin].

*/
