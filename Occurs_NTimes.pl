/*Write a prolog program that writes how many times an element occurs in a list. Use clpfd.
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-use_module(library(clpfd)).

occur_ntimes(X,[H|T],N):-
    occur_ntimes1(X,[H|T],R),
    sum(R,N).

occur_ntimes1(_,[],[]).
occur_ntimes1(X,[H|T],[N|R]):-
    member(X,[H]),
    N #= 1+0,
    occur_ntimes1(X,T,R).
occur_ntimes1(X,[H|T],R):-
    \+member(X,[H]),
    occur_ntimes1(X,T,R).

sum([],0).
sum([H|T],S):-
    sum(T,S1),
    S #= S1+H.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:-
?-occur_ntimes(4,[2,4,4,4,4,4,3,2,2],N).
OUTPUT:
N = 5
false
?-occur_ntimes(3,[2,4,4,4,4,4,3,2,2],N).
OUTPUT:
N = 1
false
?-occur_ntimes(2,[2,4,4,4,4,4,3,2,2],N).
OUTPUT:
N = 3
false
*/
