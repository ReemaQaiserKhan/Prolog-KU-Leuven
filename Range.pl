/*Write a prolog program that prints a elements within a range.
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

range([H|T],P1,P2,L):-
    range1([H|T],P2,K,_R),
    P3 is P1-1,
    range1(K,P3,_S,L).

range1(L,0,[],L).
range1([H|T],P2,[H|L],R):-
       P3 is P2-1,
       range1(T,P3,L,R).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Exeute the Program:-
?-range([a,b,d,w,s,m,v,c,d,w],2,5,L).
OUTPUT:
L = [b, d, w, s]
false
?-range([a,b,d,w,s,m,v,c,d,w],5,9,L).
OUTPUT:
L = [s, m, v, c, d]
false
?-range([a,b,d,w,s,m,v,c,d,w],1,10,L).
OUTPUT:
L = [a, b, d, w, s, m, v, c, d, w]
false
*/
