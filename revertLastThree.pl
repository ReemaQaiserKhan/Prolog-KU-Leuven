/*Write a prolog program that reverts the last three elements of a list.

*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

revertLastThree([H|T],List):-
    length([H|T],N),
    N1 is N-3,
    revertLastThree2([H|T],N1,L,Rest),
   reverse(Rest,R1),
    append(L,R1,List).

revertLastThree2(L,0,[],L).
revertLastThree2([H|T],N,[H|L],Rest):-
    N1 is N-1,
    revertLastThree2(T,N1,L,Rest).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:
?-rrevertLastThree([a,b,c,d,e,f],List).
OUTPUT:
List = [a, b, c, f, e, d]
false

?-revertLastThree([55,84,36,9,77,96,66],List).
OUTPUT:
List = [55, 84, 36, 9, 66, 96, 77]
false

?-revertLastThree([55,84,36],List).
OUTPUT:
List = [36, 84, 55]
false

?-revertLastThree([55,84],List).
OUTPUT:
false
