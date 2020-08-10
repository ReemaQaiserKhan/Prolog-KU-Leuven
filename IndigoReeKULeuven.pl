/*You can run IndigoReeKULeuven.pl on https://swish.swi-prolog.org/. Write IndigoReeKULeuven.pl in the search bar and then select.
Q Write a Prolog program that solves the cryptarithmetic puzzle.

                                                             GREEN
                                                             VIOLET
                                                           +---------
                                                             INDIGO
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-use_module(library(clpfd)).

puzzle(X):-
    X=([G,R,E,E,N]+[V,I,O,L,E,T]=[I,N,D,I,G,O]),
    Vars=[G,R,E,N,V,I,D,O,L,T], Vars ins 0..9,
    all_different(Vars),
    
    G*10000 + R*1000 + E*100 + E*10 + N +
     V*100000 + I*10000 + O*1000 + L*100 + E*10 + T#=
    I*100000 + N*10000 + D*1000 + I*100 + G*10 + O,
   
 
    
    G#\=0, V#\=0, I#\=0,
   
    labeling([],Vars).
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 /* Executing the Program:-
 ?-puzzle(X).
 OUTPUT:
 X = ([8, 0, 4, 4, 1]+[2, 3, 6, 9, 4, 5]=[3, 1, 7, 3, 8, 6])                 2.122 seconds cpu time
 */
