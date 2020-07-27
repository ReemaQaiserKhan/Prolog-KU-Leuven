/*
You can run QSLDAReeKULeuven.pl on https://swish.swi-prolog.org/. Write QSLDAReeKULeuven.pl in the search bar and then select.
Q. Write a prolog program that performs the following tasks on a list:
1- Quicksorts the list.
2- Lookup an Element if it is present in the new quicksorted list. If it is not in the list, then it should be added to the list.
3- Delete an Element from the new list, and create a new list after deletion.
4- Check if all the elements in the new list are different.
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% quicksort Predicate: It sorts a list in ascending order.
% quicksort([8,3,4,9],[],S).
quicksort([],Sorted,Sorted).
quicksort([X|T],Acc,Sorted):-
    split(X,T,Small,Big),
    quicksort(Big,Acc,NewAcc),
    quicksort(Small,[X|NewAcc],Sorted).

% split Predicate:- It splits a list into small and big numbers.
% It is working here with quicksort.
% split([8],[1,6,3,8,2],Small,Big). [OUTPUT: Big = [8],Small = [1, 6, 3, 2]
split(X,[],[],[]).
split(X,[Y|T],[Y|Small],Big):-
    X>Y,!,
    split(X,T,Small,Big).
split(X,[Y|T],Small,[Y|Big]):-
    split(X,T,Small,Big).

% lookup Predicate:- Checks if an element is in the list, if not it adds the element in the list.
% lookup(3,[44,6,2,8],R).
lookup(E,[],[E]).
lookup(E,[E|T],[E|T]):-
    write('Already in list').
lookup(E,[F|T],[F|T1]):-
    E\=F,
    lookup(E,T,T1).

% del Predicate:- Deletes an element no matter how many times it occurs,
% and creates a new list after deletion.
% del(8,[3,4,2,8,4,2,8],[]).
del(A,[],[]).
del(A,[A|L],M):-!,del(A,L,M).
del(A,[Y|L1],[Y|L2]):-
    del(A,L1,L2).

% all_different Predicate:- Checks all elements in  the list are different.
% all_different([1,2,3,2,4]).
all_different([]).
all_different([H|T]):-
    \+(member(H,T)),
    all_different(T).

% main_Predicate:- It executes quicksort, lookup, del, and all_different predicates.
% main_Predicate([1,2,3,2,1],S,2,R1,8,R2).
main_Predicate([H|T],S,E1,R1,E2,M):-
          quicksort([H|T],[],S),
          write('Quicksorted List:'),
          writeln(S),
          lookup(E2,S,M),
          write('Lookup List:'),
          writeln(M),
          del(E1,M,R1),
          write('New List after Deletion:'),
          writeln(R1),
          all_different(R1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
Executing Program:
?-main_Predicate([1,2,3,2,1],S,2,R1,8,R2).
OUTPUT:
Quicksorted List:[1, 1, 2, 2, 3]
Lookup List:[1, 1, 2, 2, 3, 8]
New List after Deletion:[1, 1, 3, 8]
false
*/
