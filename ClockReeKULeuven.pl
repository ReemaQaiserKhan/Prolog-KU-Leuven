/*You can run ClockReeKULeuven.pl on https://swish.swi-prolog.org/. Write ClockReeKULeuven.pl in the search bar and then select.
Prolog January Examination 2020 Q3.
Consider the following puzzle. Take the twelve numbers on the face of a clock, namely 1, 2, 3, ..., 11, 12. We want to rearrange the numbers (keeping them in a circle) in 
such a way that no triplet of adjacent numbers has a sum higher than 21. Write the predicate clock_round(N, Sum, Xs) that can solve the above puzzle and related ones. 
For the above puzzle the call is ?- clock_round(12, 21, Xs). It finds a lot of solutions for Xs (e.g. [12,2,6,11,4,5,9,7,3,10,8,1] ..., and [12,7,2,11,6,4,10,5,3,9,8,1)). 
If you take the numbers 1 upto 5, the call ?- clock_round(5, 10, Xs) finds [5,2,3,4,1] and [5,3,2,4,1] as solutions for Xs. 
Note that all rotations of [5,2,3,4,1] are also valid solutions e.g [2,3,4,1,5], [3,4,1,5, 2], , as is [5,1,4,3,2] (when you read the numbers anti-clockwise) and its rotations. 
Note also that [5,2,3,1,4] is not a solution, because 4+5+2 is larger than 10. First write a version of clock_round/3 that solves the puzzles. 
In a next step, try to avoid solutions that are just variants (e.g. the rotations and the anti-clockwise readings). 
Indicate clearly whether you are using CLP(R), CLP(FD) or just nor-mal Prolog. */
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-use_module(library(clpfd)).
% clock Predicate:- The main predicate.
% clock(12,21,S).
clock(N,SUM,S):-
    Xs=[X,Y,Z],Xs ins 1..N,
    triplets(X,Y,Z,SUM,N),
    findall(Xs, labeling([],Xs), S).

% triplets Predicate:- Setting condition for X,Y,Z.     
triplets(X,Y,Z,SUM,N):-
    findall(X1,between(0,N,X1),L),
    member(X,L),
    member(Y,L),
    member(Z,L),
    X\==Y,Y\==Z,X\==Z,
    checkvariant(X,Y,Z,SUM).
    
% checkvariant Predicate:- Gives answer that are not variants i.e. anti-clockwise and rotations.
checkvariant(X,Y,Z,SUM):-
    X #=< Y, Y #=<Z, X #=<Z,
    X+Y+Z#=SUM.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Executing Program:-
?- clock(12,21,S).
OUTPUT:
S = [[1, 8, 12]]
S = [[1, 9, 11]]
S = [[2, 7, 12]]
S = [[2, 8, 11]]
S = [[2, 9, 10]]
S = [[3, 6, 12]]
S = [[3, 7, 11]]
......
?- clock(5,10,S).
OUTPUT:
S = [[1, 4, 5]]
S = [[2, 3, 5]]
false
*/
