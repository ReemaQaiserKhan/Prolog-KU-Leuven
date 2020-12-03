/* Write a prolog program that gives the disjoint elements of two lists.

*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disjoint([H1|T],[H2|L],P):-
    disjoint1( [H1|T],[H2|L],R),
    disjoint1([H2|L],[H1|T],X),
    append(R,X,P).

disjoint1([H1|T],[H2|L],[H1|R]):-
    \+member(H1,[H2|L]),
    disjoint1(T,[H2|L],R).

disjoint1([],_,[]).
disjoint1([H1|T],[H2|L],R):-
    member(H1,[H2|L]), !,
    disjoint1(T,[H2|L],R).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:-
?-disjoint([2,6,3,4],[1,2,3,5],L).
OUTPUT:
L = [6, 4, 1, 5]
false
?-disjoint([1,1,1,4],[1,1,1,5],L).
OUTPUT:
L = [4, 5]
false
?-disjoint([2,3,4],[2,3,4],L).
OUTPUT:
L = []
*/
