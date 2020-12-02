/*Remove element at Kth postion, then return new list without the element.

*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
remove(X,[H|T],P,L):-
    P1 is P-1,
    remove1([H|T],P1,K,[_|R]),
    nth0(P1,[H|T],X),
    append(K,R,L).
remove1(L,0,[],L).
remove1([H|T],P,[H|L],R):-
    P1 is P-1,
    remove1(T,P1,L,R).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:-
?-remove(X,[w,f,d,s,e,r,m],3,L).
OUTPUT:
L = [w, f, s, e, r, m],
X = d
false
?-remove(X,[w,f,d,s,e,r,m],5,L).
OUTPUT:
L = [w, f, d, s, r, m],
X = e
false
?-remove(X,[w,f,d,s,e,r,m],6,L).
OUTPUT:
L = [w, f, d, s, e, m],
X = r
false
*/
