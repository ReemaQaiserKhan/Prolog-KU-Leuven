/*Suppose I have a list with 4 elements [0,4,0,2] (Can be any arrangement). Each element in the list will move towards left. If an elements neighbor is zero so it can easily
move towards the left. If the neighbor is a non zero number then it can not move towards left. (Example: [8,0,2,3] will become [8,2,3,0], and [0,4,0,2] will become [4,2,0,0]).
After shifting left, merge the list. [4,4,9,0] will become after merging [8,9,0,0]. Consecutive numbers will get added.

*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold_row([H|T],L):-
    shift_left([H|T],R),
    merge(R,L).

shift_left([],[]).
shift_left([H|T],S):-
    shift_left(T,Q),
    H=0,
    append(Q,[0],S).
shift_left([H|T],S):-
    shift_left(T,Q),
    H\=0,
    S=[H|Q].

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
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:
?-fold_row([4,0,9,9],L).
OUTPUT:
L = [4, 18, 0, 0]
L = [4, 18, 0, 0]
false
?-fold_row([4,0,4,9],L).
OUTPUT:
L = [8, 9, 0, 0]
L = [8, 9, 0, 0]
false
?-fold_row([4,0,8,8],L).
OUTPUT:
L = [4, 16, 0, 0]
L = [4, 16, 0, 0]
false
*/
