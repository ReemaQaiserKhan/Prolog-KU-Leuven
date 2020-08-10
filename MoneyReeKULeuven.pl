/*You can run MoneyReeKULeuven.pl on https://swish.swi-prolog.org/. Write MoneyReeKULeuven.pl in the search bar and then select.
Q Write a Prolog program that solves the cryptarithmetic puzzle.

                                             SEND
                                             MORE
                                          + -------
                                             MONEY
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
:-use_module(library(clpfd)).

puzzle(X):-
    X=([G,I,V,E]+[M,O,R,E]=[M,O,N,E,Y]), 
    
    Vars=[G,I,V,E,M,O,R,N,Y],Vars ins 0..9,
    
    G*1000 + I*100 + V*10 + E +
    M*1000 + O*100 + R*10 + E #=
    M*1000 + O*1000 + N*100 + E*10 + Y,
    
    G#\=0, M#\=0,
    all_different(Vars),
    labeling([],Vars).
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 /* Executing the Program:-
 
 ?- puzzle(X).
 OUTPUT:
 X = ([1, 7, 4, 3]+[5, 2, 9, 3]=[5, 2, 0, 3, 6])
 X = ([1, 7, 4, 3]+[8, 2, 9, 3]=[8, 2, 0, 3, 6])
 X = ([1, 7, 5, 3]+[4, 2, 8, 3]=[4, 2, 0, 3, 6])
 X = ([1, 7, 5, 3]+[9, 2, 8, 3]=[9, 2, 0, 3, 6])
 .......
 
 */
