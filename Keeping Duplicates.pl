/* Write a Prolog Program that finds all duplicate elements in a list.
*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

keep_duplicates([],[]).
keep_duplicates([H | T], List) :- 
      \+member(H, T),
      keep_duplicates( T, List).
keep_duplicates([H | T], [H|T1]) :- 
      member(H, T),
      keep_duplicates( T, T1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:
?-keep_duplicates([a,f,g,d,a,j,s,g],L).
OUTPUT:-
L = [a, g]
*/
