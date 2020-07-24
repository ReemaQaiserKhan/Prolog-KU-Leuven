%% You can run ReverseAndElementPositionReeKULeuven.pll on https://swish.swi-prolog.org/. Write ReverseAndElementPositionReeKULeuven.pl in the search bar and then select.
Q. Create a program that first reverses a list and then gives element in the list with provided position.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% reverse predicate:- reverse a list
% reverse([1,2,3],Z,[]).
reverse([],Z,Z).
reverse([H|T],Z,Acc):-
   reverse(T,Z,[H|Acc]).

% element_at predicate:- Gives element in the list with provided position
% element_at(X,[1,a,r,3],3)
element_at(X,[X|_],1). % base case with one element 
element_at(X,[_|L],K):-
       K>1,
       K1 is K-1,
       element_at(X,L,K1).

% main_predicate:- Executes the reverse and element_at predicate
% main_predicate(E,[1,e,3,s,5],O,4]
 main_predicate(E,[H|T],O,P):-
 reverse([H|T],O,[]),
 element_at(E,O,P).
 
Executing Program:
?- main_predicate(E,[1,e,3,s,5],O,4)
OUTPUT:- 
E = e,
O = [5, s, 3, e, 1]
false
       
