m([luis, ruben, adalid, donald, felix, adalid_jr, edwin, dony, marvin_sr, marvin_jr]).
f([luisa, elba, marina, reyna, maria_e, beatriz, maria, maria_theresa, claudia]).
family([edelberto, esmeralda, [elba]]).
family([felix, elba, [luisa, donald, marina, maria]]).
family([adalid, luisa, [luis, ruben]]).
family([adalid, maria_e, [reyna, adalid_jr]]).
family([donald, beatriz, [dony, edwin]]).
family([marvin_sr, maria, [maria_theresa, claudia, marvin_jr]]).

male(X) :- m(L), member(X, L).
female(X) :- f(L), member(X, L).

father(X, Y) :- family([X,_,L]), member(Y, L).
mother(X, Y) :- family([_,X,L]), member(Y, L).

parent(X, Y) :- father(X, Y); mother(X, Y).

siblings1(X, Y) :- parent(A, X), parent(A, Y), parent(B, X), parent(C, Y), A \= B, B \= C, A \= C, X \= Y.
siblings2(X, Y) :- family([_,_,L]), member(X, L), member(Y, L), X \= Y.

brother1(NAME1, NAME2) :- siblings1(NAME1, NAME2), male(NAME1).
brother2(NAME1, NAME2) :- siblings2(NAME1, NAME2), male(NAME1).

sister1(NAME1, NAME2) :- siblings1(NAME1, NAME2), female(NAME1).
sister2(NAME1, NAME2) :- siblings2(NAME1, NAME2), female(NAME1).

cousins(NAME1, NAME2) :- siblings2(AUNTUNCLE, PARENT), parent(AUNTUNCLE, NAME1), parent(PARENT, NAME2).

uncle(UNCLE, CHILDNAME) :- brother2(UNCLE, PARENT), parent(PARENT, CHILDNAME).
aunt(AUNT, CHILDNAME) :- sister2(AUNT, PARENT), parent(PARENT, CHILDNAME).

grandchild(GRANDCHILD, GRANDPARENT) :- parent(GRANDPARENT, PARENT), parent(PARENT, GRANDCHILD).
grandson(GRANDSON, GRANDPARENT) :- grandchild(GRANDSON, GRANDPARENT), male(GRANDSON).
granddaughter(GRANDDAUGHTER, GRANDPARENT) :- grandchild(GRANDDAUGHTER, GRANDPARENT), female(GRANDDAUGHTER).

greatgrandparent(GREATGRANDPARENT, GREATGRANDCHILD) :- parent(GREATGRANDPARENT, GRANDPARENT), grandchild(GREATGRANDCHILD, GRANDPARENT).

ancestor(ANCESTOR, CHILDNAME) :- parent(ANCESTOR, CHILDNAME). % base case
ancestor(ANCESTOR, CHILDNAME) :- parent(PARENT, CHILDNAME), ancestor(ANCESTOR, PARENT).


/* sample output

29 ?- male(X).
X = luis ;
X = ruben ;
X = adalid ;
X = donald ;
X = felix ;
X = adalid_jr ;
X = edwin ;
X = dony ;
X = marvin_sr ;
X = marvin_jr.

30 ?- female(X).
X = luisa ;
X = elba ;
X = marina ;
X = reyna ;
X = maria_e ;
X = beatriz ;
X = maria ;
X = maria_theresa ;
X = claudia.

31 ?- father(X, luis).
X = adalid ;
false.

32 ?- mother(X, luis).
X = luisa ;
false.

33 ?- parent(X, luis).
X = adalid ;
X = luisa ;
false.

34 ?- siblings1(X, luis).
X = reyna ;
X = adalid_jr ;
false.

36 ?- brother1(X, luis).
X = adalid_jr ;
false.

43 ?- sister1(X, luis).
X = reyna ;
false.

38 ?- siblings2(X, claudia).
X = maria_theresa ;
X = marvin_jr ;
false.

39 ?- brother2(X, claudia).
X = marvin_jr ;
false.

42 ?- sister2(X, claudia).
X = maria_theresa ;
false.

46 ?- cousins(X, luis).
X = dony ;
X = edwin ;
X = maria_theresa ;
X = claudia ;
X = marvin_jr ;
false.

47 ?- uncle(X, luis).
X = donald ;
false.

48 ?- aunt(X, luis).
X = marina ;
X = maria ;
false.

69 ?- grandchild(X, elba).
X = luis ;
X = ruben ;
X = dony ;
X = edwin ;
X = maria_theresa ;
X = claudia ;
X = marvin_jr ;
false.

70 ?- grandson(X, elba).
X = luis ;
X = ruben ;
X = dony ;
X = edwin ;
X = marvin_jr ;
false.

71 ?- granddaughter(X, elba).
X = maria_theresa ;
X = claudia ;
false.

73 ?- greatgrandparent(X, luis).
X = edelberto ;
X = esmeralda ;
false.

74 ?- ancestor(X, luis).
X = adalid ;
X = luisa ;
X = felix ;
X = elba ;
X = edelberto ;
X = esmeralda ;
false.
*/
