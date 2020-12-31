/*Prolog January Examination 2020 Q3.
Consider the following puzzle. Take the twelve numbers on the face of a clock, namely 1, 2, 3, ..., 11, 12. We want to rearrange the numbers (keeping them in a circle) in 
such a way that no triplet of adjacent numbers has a sum higher than 21. Write the predicate clock_round(N, Sum, Xs) that can solve the above puzzle and related ones. 
For the above puzzle the call is ?- clock_round(12, 21, Xs). It finds a lot of solutions for Xs (e.g. [12,2,6,11,4,5,9,7,3,10,8,1] ..., and [12,7,2,11,6,4,10,5,3,9,8,1)). 
If you take the numbers 1 upto 5, the call ?- clock_round(5, 10, Xs) finds [5,2,3,4,1] and [5,3,2,4,1] as solutions for Xs. 
Note that all rotations of [5,2,3,4,1] are also valid solutions e.g [2,3,4,1,5], [3,4,1,5, 2], , as is [5,1,4,3,2] (when you read the numbers anti-clockwise) and its rotations. 
Note also that [5,2,3,1,4] is not a solution, because 4+5+2 is larger than 10. First write a version of clock_round/3 that solves the puzzles. 
In a next step, try to avoid solutions that are just variants (e.g. the rotations and the anti-clockwise readings). 
Indicate clearly whether you are using CLP(R), CLP(FD) or just normal Prolog. 

Note:- The code till check_solution is for Part 1. The remaining covers Part 2. */
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-use_module(library(clpfd)).

clock_round(N,Sum,Xs):-
    S#=1,
    list(N,S,List),
    permutation(List,PList),
    check_solution(PList,Sum,Filter),
    remove_rotations(Filter,RList),
    remove_anticlocks(RList,Xs).
            
list(0,_,[]):-!.
 list(N,S,[S|List]):-
    N1 #= N-1,
    S1 #= S+1,
    list(N1,S1,List).

permutation(Ori,Out):-
    perm1(Ori,[],Out1),
    reverse(Out1,Out).

perm1(Ori,Acc,Ret):-
    perm(Ori,Perm),
    \+ member(Perm,Acc),
    !,
    perm1(Ori,[Perm|Acc],Ret).
perm1(_,L,L).

takeout(X,[X|Y],Y).
takeout(X,[F|R],[F|S]):-
    takeout(X,R,S).

perm([],[]).
perm([X|Y],Z):-
    perm(Y,W),
    takeout(X,Z,W).

check_solution([],_,[]):-!.
check_solution([H|T],Sum,[H|List]):-
    triplets(H,Sum),!,
    check_solution(T,Sum,List).
check_solution([_H|T],Sum,List):-
    check_solution(T,Sum,List).
triplets([],_):-!.
triplets([_H1,_H2],_).
triplets([H1,H2,H3|T],Sum):-
    H1+H2+H3#=<Sum,
    triplets([H2,H3|T],Sum).

remove_rotations([],[]).
remove_rotations([H|T],Xs):-
    remove_rotations1([H|T],[H|T],Xs),!.

remove_rotations1([],_,[]).
remove_rotations1([H|T],[H1|T1],[H|List]):-
    rotation(H,Rot),
        \+member(Rot,[H1|T1]),!,
    remove_rotations1(T,[H1|T1],List).
remove_rotations1([H|T],[H1|T1],List):-
    rotation(H,Rot),
    member(Rot,[H1|T1]),
    remove_rotations1(T,[H1|T1],List).

rotation(L,[H|Tmp]):-
    append(Tmp,[H],L).

remove_anticlocks([],[]).
remove_anticlocks([H|T],Xs):-
    remove_anticlocks1([H|T],[H|T],Xs),!.

remove_anticlocks1([],_,[]).
remove_anticlocks1([H|T],[H1|T1],[H|List]):-
    anticlock(H,Anticlock),
        \+member(Anticlock,[H1|T1]),!,
    remove_anticlocks1(T,[H1|T1],List).
remove_anticlocks1([H|T],[H1|T1],List):-
    anticlock(H,Anticlock),
    member(Anticlock,[H1|T1]),
    remove_anticlocks1(T,[H1|T1],List).

anticlock([H|T],Anticlock):-
    reverse([H|T],Anticlock).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:-
?-clock_round(5,10,L).
OUTPUT:
L = [[3, 4, 1, 2, 5], [3, 4, 2, 1, 5], [2, 4, 1, 3, 5], [2, 4, 3, 1, 5], [4, 2, 3, 1, 5], [4, 3, 2, 1, 5], [4, 5, 1, 2, 3], [4, 5, 1, 3, 2], [3, 5, 1, 2, 4], [3, 5, 2, 1, 4],
[2, 5, 1, 3, 4], [2, 5, 3, 1, 4], [5, 2, 3, 1, 4], [5, 3, 2, 1, 4], [5, 4, 1, 2, 3], [5, 4, 1, 3, 2]]

?-clock_round(3,6,L).
OUTPUT:
L = []
*/
