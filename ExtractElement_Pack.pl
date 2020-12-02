/*Extract the list containing the given element. First pack all the same elements in the same list, then extract.
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
extract(E,[H|T],Y,L):-
    pack([H|T],Y),
    extract2(E,Y,L).

extract2(_,[],[]).
extract2(E,[H|T],[H|L]):-
    member(E,H),!,
    extract2(E,T,L).
extract2(E,[H|T],L):-
    \+member(E,H),
    extract2(E,T,L).

pack([], []).       % packing empty is empty
pack([X], [[X]]).   % packing a single element
pack([X,X|T], [[X|PH]|PT]):- % rule for packing when next two terms are the same
    pack([X|T], [PH|PT]).
pack([X,Y|T], [[X]|PT]):-    % rule for different term
    dif(X, Y),
    pack([Y|T], PT).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:-
?-extract(b,[a,a,a,b,b,c,d,d],Packed_List,Extracted_List).
OUTPUT:
Extracted_List = [[b, b]],
Packed_List = [[a, a, a], [b, b], [c], [d, d]]
false
?-extract(c,[a,a,a,b,b,c,d,d],Packed_List,Extracted_List).
OUTPUT:
Extracted_List = [[c]],
Packed_List = [[a, a, a], [b, b], [c], [d, d]]
?-extract(m,[a,a,a,b,b,c,d,d,m,m,m,m,o,o,o,o,n,p,p],Packed_List,Extracted_List).
OUTPUT:
extract(m,[a,a,a,b,b,c,d,d,m,m,m,m,o,o,o,o,n,p,p],Packed_List,Extracted_List).
*/
