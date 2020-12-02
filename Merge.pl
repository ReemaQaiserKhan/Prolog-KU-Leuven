/* Merge: Merge a list in a way that if 2 consecutive numbers in a list are a same number they should merge into one (i,e, [4,4,0,0] -> [8,0,0,0].*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
merge([H|T],L):-
   merge2([H|T],J),
    (
    length(J,2)->  
    append(J,[0,0],L);
    length(J,3)->  
    append(J,[0],L);length(J,4)-> J=L).

merge2(_,[]).
merge2([X],[X|_]).
merge2([H1,H2|T],[W|L]):-
    H1=H2,
    W is H1+H2,
    merge2(T,L).
merge2([H1,H2|T],[H1|L]):-
    H1\=H2,
    merge2([H2|T],L).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:

?-merge([4,4,0,2],L).
OUTPUT:
L = [8, 0, 0, 0]
L = [8, 0, 2, 0]
false
?-merge([4,4,4,4],L).
OUTPUT:
L = [8, 8, 0, 0]
false
?-merge([4,9,9,2],L).
OUTPUT:
L = [4, 18, 0, 0]
L = [4, 18, 2, 0]
false

*/
