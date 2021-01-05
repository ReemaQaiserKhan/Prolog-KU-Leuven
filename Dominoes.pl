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
           getNoVariantsList(GList,X),!.

getGoodConfigurationsList([],[]):-!.
getGoodConfigurationsList([H|T],[H|List]):-
    check_configuration(H),
    getGoodConfigurationsList(T,List).
getGoodConfigurationsList([H|T],List):-
    \+check_configuration(H),
    getGoodConfigurationsList(T,List).

getNoVariantsList([],[]).
getNoVariantsList([H|T],Xs):-
    getNoVariantsList1([H|T],[H|T],Xs),!.

getNoVariantsList1([],_,[]).
getNoVariantsList1([H|T],[H1|T1],[H|List]):-
    \+check_variant(H,H1),!,
    getNoVariantsList1(T,[H1|T1],List).
getNoVariantsList1([H|T],[H1|T1],List):-
    check_variant(H,H1),!,
    getNoVariantsList1(T,[H1|T1],List).
    
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
X = [[0, 1, 2, 0, 1, 0, 2, 1], [0, 1, 2, 0, 1, 1, 1, 2], [0, 1, 2, 1, 0, 1, 2, 1], [0, 1, 2, 1, 0, 2, 1, 2], [0, 2, 1, 0, 2, 0, 1, 2], [0, 2, 1, 1, 1, 0, 2, 1],
[0, 2, 1, 1, 1, 1, 1, 2], [0, 2, 1, 2, 0, 1, 2, 1], [0, 2, 1, 2, 0, 2, 1, 2], [1, 0, 2, 0, 1, 0, 2, 0], [1, 0, 2, 0, 1, 1, 1, 1], [1, 0, 2, 0, 1, 2, 0, 2], 
[1, 0, 2, 1, 0, 2, 1, 1], [1, 1, 1, 0, 2, 0, 1, 1], [1, 1, 1, 0, 2, 1, 0, 2], [1, 1, 1, 1, 1, 0, 2, 0], [1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 2, 0, 2], 
[1, 1, 1, 2, 0, 1, 2, 0], [1, 1, 1, 2, 0, 2, 1, 1], [1, 2, 0, 1, 2, 0, 1, 1], [1, 2, 0, 1, 2, 1, 0, 2], [1, 2, 0, 2, 1, 0, 2, 0], [1, 2, 0, 2, 1, 1, 1, 1], 
[1, 2, 0, 2, 1, 2, 0, 2], [2, 0, 1, 0, 2, 0, 1, 0], [2, 0, 1, 1, 1, 1, 1, 0], [2, 0, 1, 1, 1, 2, 0, 1], [2, 0, 1, 2, 0, 2, 1, 0], [2, 1, 0, 1, 2, 1, 0, 1], 
[2, 1, 0, 2, 1, 1, 1, 0], [2, 1, 0, 2, 1, 2, 0, 1]]
*/
