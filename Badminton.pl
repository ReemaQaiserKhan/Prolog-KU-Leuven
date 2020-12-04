/* Prolog exam Jan 2016 Q.5.
*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
match(p1,p2,p1).
match(p3,p4,p4).
match(p5,p6,p5).
match(p7,p8,p8).
match(p1,p4,p4).
match(p5,p8,p8).
match(p4,p8,p8).

onematch([H|T],Winner):-
   onematch2([H|T],Winner).
onematch2([],[]).
onematch2([[H1,H2]|T],[H3|L]):-
    match(H1,H2,H3),
    onematch2(T,L).

winner([H|T],W):-
    winner2([H|T],W).
winner2([],[]).
winner2([H|T],[H|L]):-
    findall(H,match(_,_,H),SList),
    length(SList,N),
    N=3,
    winner2(T,L).
winner2([H|T],L):-
    findall(H,match(_,_,H),SList),
    length(SList,N),
    N\=3,
    winner2(T,L).

numberwins(H,NumberWins):-
    findall(H,match(_,_,H),Wins),
    length(Wins,NumberWins).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:-
?-onematch([[p1,p2],[p5,p6],[p7,p8]],Winners).
OUTPUT:
Winners = [p1, p5, p8]
false
?-winner([p1,p5,p3,p7],Winners).
OUTPUT:
Winners = []
?-winner([p1,p5,p8,p7],Winners).
OUTPUT:
Winners = [p8]
false
?-numberwins(p5,NumberWins).
OUTPUT:
NumberWins = 1
?-numberwins(p8,NumberWins).
OUTPUT:
NumberWins = 3
*/
