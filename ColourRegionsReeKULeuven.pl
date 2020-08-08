/*You can run ColourRegionsReeKULeuven.pl on https://swish.swi-prolog.org/. Write ColourRegionsReeKULeuven.pl in the search bar and then select.
Q. Assign a colour to each region, so that adjacent regions have different colours.

                                       ____________________________
                                      |       A       |     |      |
                                      |_______________|  E  |      |
                                      |    |  C  |    |     |      |
                                      |    |_____|    |_____|      |
                                      |   B   |   D   |            |
                                      |_______|_______|            |
                                      |                            |
                                      |          F                 |
                                      |____________________________|
 */
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 :-use_module(library(clpfd)).

regions(X):-
    X=[A,B,C,D,E,F], X ins 1..5,
    maplist(#\=(A),[B,C,D,E]),
    maplist(#\=(B),[C,D,F]),
    maplist(#\=(C),[D]),
    maplist(#\=(D),[E,F]),
    maplist(#\=(E),[F]),
    labeling([],X).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Executing the Program:-
?- regions(X).
OUTPUT:
X = [1, 2, 3, 4, 2, 1]
X = [1, 2, 3, 4, 2, 3]
X = [1, 2, 3, 4, 2, 5]
X = [1, 2, 3, 4, 3, 1]
X = [1, 2, 3, 4, 3, 5]
........
*/
