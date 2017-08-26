is_male(luis).
is_male(ruben).
is_male(adalid).
is_male(donald).
is_male(felix_sr).
is_male(marvin_jr).
is_male(marvin).
is_male(felix).
is_male(joshua).
is_male(dony).
is_male(edwin).
is_male(adalid_jr).
is_male(edelberto).
is_female(luisa).
is_female(reyna).
is_female(maria_e).
is_female(elba).
is_female(marina).
is_female(angelica).
is_female(maria).
is_female(claudia).
is_female(maria_theresa).
is_female(tamara).
is_female(marinita).
is_female(teo).
is_female(beatriz).
is_female(esmeralda).
is_parent_of(adalid, luis).
is_parent_of(luisa, luis).
is_parent_of(adalid, ruben).
is_parent_of(luisa, ruben).
is_parent_of(adalid, reyna).
is_parent_of(maria_e, reyna).
is_parent_of(adalid, adalid_jr).
is_parent_of(maria_e, adalid_jr).
is_parent_of(felix_sr, donald).
is_parent_of(elba, donald).
is_parent_of(felix_sr, luisa).
is_parent_of(elba, luisa).
is_parent_of(felix_sr, marina).
is_parent_of(elba, marina).
is_parent_of(felix_sr, maria).
is_parent_of(elba, maria).
is_parent_of(felix_sr, felix).
is_parent_of(elba, felix).
is_parent_of(marina, angelica).
is_parent_of(marvin, maria_theresa).
is_parent_of(maria, maria_theresa).
is_parent_of(marvin, claudia).
is_parent_of(maria, claudia).
is_parent_of(marvin, marvin_jr).
is_parent_of(maria, marvin_jr).
is_parent_of(felix, joshua).
is_parent_of(teo, joshua).
is_parent_of(felix, tamara).
is_parent_of(teo, tamara).
is_parent_of(felix, marinita).
is_parent_of(teo, marinita).
is_parent_of(donald, dony).
is_parent_of(beatriz, dony).
is_parent_of(donald, edwin).
is_parent_of(beatriz, edwin).
is_parent_of(edelberto, elba).
is_parent_of(esmeralda, elba).

mother(MOTHER, CHILD) :- is_parent_of(MOTHER, CHILD), is_female(MOTHER).
father(FATHER, CHILD) :- is_parent_of(FATHER, CHILD), is_male(FATHER).
sibling1(NAME1, NAME2) :- is_parent_of(PARENT1, NAME1), is_parent_of(PARENT1, NAME2),
    is_parent_of(PARENT2, NAME1), is_parent_of(PARENT3, NAME2),
    PARENT1 \= PARENT2, PARENT1 \= PARENT3, PARENT2 \= PARENT3, NAME1 \= NAME2.
brother1(NAME1, NAME2) :- sibling1(NAME1, NAME2), is_male(NAME1).
sister1(NAME1, NAME2) :- sibling1(NAME1, NAME2), is_female(NAME1).
sibling2(NAME1, NAME2) :- mother(MOTHER, NAME1), mother(MOTHER, NAME2),
    father(FATHER, NAME1), father(FATHER, NAME2), MOTHER \= FATHER, NAME1 \= NAME2.
brother2(NAME1, NAME2) :- sibling2(NAME1, NAME2), is_male(NAME1).
sister2(NAME1, NAME2) :- sibling2(NAME1, NAME2), is_female(NAME1).

cousin(NAME1, NAME2) :- sibling2(AUNTUNCLE, PARENT),
    is_parent_of(AUNTUNCLE, NAME1), is_parent_of(PARENT, NAME2).
uncle(UNCLE, CHILDNAME) :- brother2(UNCLE, PARENT), is_parent_of(PARENT, CHILDNAME).
aunt(AUNT, CHILDNAME) :- sister2(AUNT, PARENT), is_parent_of(PARENT, CHILDNAME).
grandparent(GRANDPARENT, GRANDCHILD) :- is_parent_of(GRANDPARENT, PARENT),
    is_parent_of(PARENT, GRANDCHILD).
grandmother(GRANDMOTHER, GRANDCHILD) :- grandparent(GRANDMOTHER, GRANDCHILD), is_female(GRANDMOTHER).
grandfather(GRANDFATHER, GRANDCHILD) :- grandparent(GRANDFATHER, GRANDCHILD), is_male(GRANDFATHER).
grandchild(GRANDCHILD, GRANDPARENT) :- grandparent(GRANDPARENT, GRANDCHILD).

greatgrandparent(GREATGRANDPARENT, GREATGRANDCHILD) :- grandparent(GREATGRANDPARENT, PARENT),
    is_parent_of(PARENT, GREATGRANDCHILD).
ancestor(ANCESTOR, CHILDNAME) :- is_parent_of(ANCESTOR, CHILDNAME). % base case
ancestor(ANCESTOR, CHILDNAME) :- is_parent_of(PARENT, CHILDNAME), ancestor(ANCESTOR, PARENT).

/* Queries
1 ?- consult(family).
true.

2 ?- mother(X, luis).
X = luisa.

3 ?- father(X, luis).
X = adalid .

4 ?- sibling1(luis, X).
X = reyna ;
X = adalid_jr ;
false.

5 ?- brother1(luis, X).
X = reyna ;
X = adalid_jr ;
false.

6 ?- brother1(X, luis).
X = adalid_jr ;
false.

7 ?- sister1(X, luis).
X = reyna ;
false.

8 ?- sibling2(X, marvin_jr).
X = maria_theresa ;
X = claudia ;
false.

10 ?- brother2(marvin_jr, X).
X = maria_theresa ;
X = claudia ;
false.

11 ?- sister2(X, marvin_jr).
X = maria_theresa ;
X = claudia ;
false.

12 ?- cousin(luis, X).
X = dony ;
X = edwin ;
X = angelica ;
X = maria_theresa ;
X = claudia ;
X = marvin_jr ;
X = joshua ;
X = tamara ;
X = marinita ;
false.

14 ?- uncle(X, luis).
X = donald ;
X = felix ;
false.

15 ?- aunt(X, luis).
X = marina ;
X = maria ;
false.

16 ?- grandparent(X, luis).
X = felix_sr ;
X = elba ;
false.

35 ?- grandmother(elba, luis).
true ;
false.

36 ?- grandfather(felix_sr, luis).
true ;
false.

19 ?- grandchild(luis, X).
X = felix_sr ;
X = elba ;
false.

20 ?- greatgrandparent(X, luis).
X = edelberto ;
X = esmeralda ;
false.

21 ?- ancestor(X, luis).
X = adalid ;
X = luisa ;
X = felix_sr ;
X = elba ;
X = edelberto ;
X = esmeralda ;
false.

22 ?- ancestor(X, marvin_jr).
X = marvin ;
X = maria ;
X = felix_sr ;
X = elba ;
X = edelberto ;
X = esmeralda ;
false.
*/
