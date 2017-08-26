teaches(souza, 210).
teaches(wong, 220).
teaches(okada, 230).
teaches(sosnick, 256).
teaches(tomasevich, 300).
teaches(potter, 340).
teaches(souza, 412).
teaches(yoon, 413).
teaches(potter, 415).
teaches(wall, 510).
teaches(sosnick, 520).
teaches(dujmovic, 600).
teaches(dujmovic, 641).
teaches(sosnick, 648).
teaches(yue, 650).
freshman(210).
freshman(220).
freshman(230).
sophomore(256).
sophomore(300).
sophomore(340).
sophomore(412).
junior(413).
junior(415).
junior(510).
junior(520).
senior(600).
senior(641).
senior(648).
senior(650).
morning(210).
morning(220).
morning(340).
morning(412).
morning(413).
morning(510).
afternoon(230).
afternoon(256).
afternoon(300).
afternoon(415).
afternoon(520).
afternoon(600).
afternoon(641).
afternoon(648).
afternoon(650).
tth(230).
tth(412).
tth(413).
tth(648).
tth(650).
mwf(210).
mwf(220).
mwf(256).
mwf(300).
mwf(340).
mwf(415).
mwf(510).
mwf(520).
mwf(600).
mwf(641).

teaches_freshman(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS),
    freshman(CLASS).
teaches_sophomore(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS),
    sophomore(CLASS).
teaches_junior(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS),
    junior(CLASS).
teaches_senior(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS),
    senior(CLASS).
teaches_morning(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS),
    morning(CLASS).
teaches_afternoon(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS),
    afternoon(CLASS).
works_mwf(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS), mwf(CLASS).
works_tth(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS), tth(CLASS).

teaches_three_classes(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS1),
    teaches(INSTRUCTOR, CLASS2), teaches(INSTRUCTOR, CLASS3),
CLASS1 \= CLASS2, CLASS1 \= CLASS3, CLASS2 \= CLASS3.

/* sample output

1 ?- teaches_freshman(X).
X = souza ;
X = wong ;
X = okada ;
false.

2 ?- teaches_sophomore(X).
X = sosnick ;
X = tomasevich ;
X = potter ;
X = souza ;
false.

3 ?- teaches_junior(X).
X = yoon ;
X = potter ;
X = wall ;
X = sosnick ;
false.

4 ?- teaches_senior(X).
X = dujmovic ;
X = dujmovic ;
X = sosnick ;
X = yue.

5 ?- teaches_morning(X).
X = souza ;
X = wong ;
X = potter ;
X = souza ;
X = yoon ;
X = wall ;
false.

6 ?- teaches_afternoon(X).
X = okada ;
X = sosnick ;
X = tomasevich ;
X = potter ;
X = sosnick ;
X = dujmovic ;
X = dujmovic ;
X = sosnick ;
X = yue.

7 ?- works_mwf(X).
X = souza ;
X = wong ;
X = sosnick ;
X = tomasevich ;
X = potter ;
X = potter ;
X = wall ;
X = sosnick ;
X = dujmovic ;
X = dujmovic ;
false.

8 ?- works_tth(X).
X = okada ;
X = souza ;
X = yoon ;
X = sosnick ;
X = yue.

9 ?- teaches_three_classes(X).
X = sosnick .
*/
