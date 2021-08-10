/* Prolog Exam Sample Q5.
Consider a set of dominoes. Each domino is a rectangle consisting of two parts and each part has a number of spots on it. The number of spots can go from 0 to 6.
There are 28 different dominoes. Using four dominoes we can make a configuration as in Figure 1. Note that we used 4 different dominoes and that for each row and column the 
sum of the spots on the relevant parts of the dominoes is exactly 3, except for the center row and column. 

  _________________________
 |       |  o o   |   o    |
 |_______|________|________|
 |   o   |        |   o    |
 |_______|________|________|
 |  o o  |        |   o    |
 |_______|________|________|
 
Figure 1: A configuration of dominoes [There are four dominoes, each with 2 parts; starting from the upperleft corner and going clockwise]

(a) Define a data structure that represents a domino and a data struc-ture that represents such a configuration of 4 dominoes. 
(b) Write a predicate that checks whether a given configuration is a good one.
(c) Write a predicate that succeeds when two given configurations are variants. Note that if we turn the configuration of Figure 1 over 
for example 180 degrees we get its variant in Figure 2. These kinds of variants should be recognised. Note that you can also turn over 90 and 270 degrees.
(d) Write a predicate that searches all possible good configurations of 4 dominoes, that eliminates the variants and that prints the configurations out in 
the form 0 2 1 1 1 0 2 1 (i.e. giving the number of spots on the parts of the dominoes starting in the up ward left corner and going clockwise). 

  _________________________
 |   o   |        |   o o  |
 |_______|________|________|
 |   o   |        |    o   |
 |_______|________|________|
 |   o   |   o o  |        |
 |_______|________|________|
 
Figure 2: A variant configuration of dominoes
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Swish: DominoExamSample

domino([0,1]). %single domino
domino([0, 2, 1, 1, 1, 0, 2, 1]). %configuration of 4 dominoes

%good_confriguration([0,2,1,1,1,0,2,1]).
good_confriguration(Config):-
    Config=[A1,A2,A3,A4,A5,A6,A7,A8],
    3 is A1+A2+A3,
    3 is A3+A4+A5,
    3 is A5+A6+A7,
    3 is A7+A8+A1.

%check_variant([0,2,1,1,1,0,2,1],[1,1,1,0,2,1,0,2]).
check_variant(Config1, Config2):-
    ninety(Config1,V1),
    one_eigthy(Config1,V2),
    two_seventy(Config1,V3),
    
    (V1=Config2;
    V2=Config2;
    V3=Config2).

ninety([H1,H2|T],Rot):-
    append(T,[H1,H2],Rot).

one_eigthy([H1,H2,H3,H4|T],Rot):-
    append(T,[H1,H2,H3,H4],Rot).

two_seventy([H1,H2,H3,H4,H5,H6|T],Rot):-
    append(T,[H1,H2,H3,H4,H5,H6],Rot).    

%possible_good_confrigurations([0,2,1,1,1,0,2,1],L).
% Note: Time limit exceeded
possible_good_confrigurations(DList,FList):-
    findall(S,permute(S,DList),SList),
    lengthFilter(SList,S1), % Gives back List with permutations of length 8
    c1(S1,S1,FList).

%Creates Permutations
permute([], []).
permute([X|Rest], L) :-
    permute(Rest, L1),
    select(X, L, L1).

select(H,[H|T],T).
select(H,[N|T],[N|L]):-
    select(H,T,L).

lengthFilter([],[]).
lengthFilter([H|T],[H|L]):-
    length(H,8),
    lengthFilter(T,L).
lengthFilter([H|T],L):-
    \+length(H,8),
    lengthFilter(T,L).

c1([],_,[]).
c1([H|T],[H2|T2],[H|L]):-
    good_confriguration(H),
    c2(H,[H2|T2]),
    c1(T,[H2|T2],L).
c1([H|T],[H2|T2],L):-
    \+good_confriguration(H),
    c1(T,[H2|T2],L).

c2(_,[]).
c2(H,[H2|T2]):-
    \+check_variant(H,H2),
    c2(H,T2).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
domino([0,1]). %single domino
domino([0, 2, 1, 1, 1, 0, 2, 1]). %configuration of 4 dominoes

check_configuration([H1,H2,H3,H4,H5,H6,H7,H8]):-
    3 is H1+H2+H3,
    3 is H3+H4+H5,
    3 is H5+H6+H7,
    3 is H7+H8+H1.

check_variant([H1,H2,H3,H4,H5,H6,H7,H8],W):-
    (   R1=[H3,H4,H5,H6,H7,H8,H1,H2],R1=W;
    R2=[H5,H6,H7,H8,H1,H2,H3,H4],R2=W;
    R3=[H7,H8,H1,H2,H3,H4,H5,H6],R3=W),!.

possible_good_configurations(X):-
   length(L,8),
   findall(L,(maplist([I]>>(member(I,[0,1,2])),L)),List),
            getGoodConfigurationsList(List,GList),
           getNoVariantsList(GList,X1),last(X,X1),!.

getGoodConfigurationsList([],[]):-!.
getGoodConfigurationsList([H|T],[H|List]):-
    check_configuration(H),
    getGoodConfigurationsList(T,List).
getGoodConfigurationsList([H|T],List):-
    \+check_configuration(H),
    getGoodConfigurationsList(T,List).

getNoVariantsList([H|T],L):-
    getNoVariantsList1([H|T],[H|T],L),!.
getNoVariantsList1([],_,[]).
getNoVariantsList1([_X],[],[]).
getNoVariantsList1([],[],[]).
getNoVariantsList1(_X,[],[]).
getNoVariantsList1([H|T],[H1|T1],[L1|List]):-
    getNoVariantsList2(H,[H1|T1],L1),
    getNoVariantsList1(T,L1,List).

getNoVariantsList2(_,[],[]).
getNoVariantsList2(H,[H1|T1],[H1|List]):-
    \+check_variant(H,H1),
    getNoVariantsList2(H,T1,List).
getNoVariantsList2(H,[H1|T1],List):-
    check_variant(H,H1),
    getNoVariantsList2(H,T1,List).

last(X,[X]).
last(X,[_|T]):-
    last(X,T).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?- check_configuration([0, 2, 1, 1, 1, 0, 2, 1]).
OUTPUT:
true

?- check_variant([0, 2, 1, 1, 1, 0, 2, 1], [1, 1, 1, 0, 2, 1, 0, 2]).
OUTPUT:
true

?- possible_good_configurations(X).
OUTPUT:
X = []
*/
