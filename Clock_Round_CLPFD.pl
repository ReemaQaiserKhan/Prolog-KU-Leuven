


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
        \+member(Rot,[H1|T1]),
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
        \+member(Anticlock,[H1|T1]),
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
