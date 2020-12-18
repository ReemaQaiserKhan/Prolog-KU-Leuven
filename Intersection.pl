/*Write a prolog program that give the intersection elements between two elements.
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

intersection([H|T],[H2|T2],List):-
    intersection1([H|T],[H2|T2],R),
    flatten(R,List).
intersection1([],_,[]).
intersection1([H|T],[H2|T2],[R|List]):-
    intersection2(H,[H2|T2],R),
    intersection1(T,[H2|T2],List).

intersection2(_,[],[]).
intersection2(H1,[H2|T2],[H1|L]):-
    H1=H2,
    intersection2(H1,T2,L).
intersection2(H1,[H2|T2],L):-
    H1\=H2,
    intersection2(H1,T2,L).
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 /* Execute the Program:-
 ?-intersection([2,3,4],[5,3,6,4],L).
 OUTPUT:
 L = [3, 4]
false

?-intersectionb([2,3,4],[5,6,4],L).
OUTPUT:
L = [4]
false

?-intersection([2,3,4],[5,33,6,45],L).
OUTPUT:
L = []
false
*/
