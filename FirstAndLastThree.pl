/* Write a prolog progra that deletes the first three elements from a list and the last three elements from a list.
*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

del([H|T],W):-
    del2([H|T],0,Y),
    length(Y,N),
    N1 is N-1,
    nth0(N1,Y,K),
    del_first(K,0,S),
    length(S,T2),
    T3 is T2-1,
    nth0(T3,S,W).

del2([],3,[]).
del2(_,3,[]):-!.
del2([H|T],C,[H2|L]):-
    remove_last([H|T],H2),
    C1 is C+1,
    del2(H2,C1,L).

remove_last([_],[]).
remove_last([X|T],[X|WithoutLast]):-
    remove_last(T,WithoutLast).

del_first(_,3,[]).
del_first([H|T],C,[H2|L]):-
    remove_first([H|T],H2),
    C1 is C+1,
    del_first(T,C1,L).

remove_first([_|T],T).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:-
?-del([d,c,s,w,e,n,l,i,b,v,m,n],W).
OUTPUT:
W = [w, e, n, l, i, b]
false
?-del([1,3,e,d,s,w,a,3,2,5,4,3,g,f],W).
OUTPUT:-
W = [d, s, w, a, 3, 2, 5, 4]
false
?-del([],W).
OUTPUT:-
false
*/
