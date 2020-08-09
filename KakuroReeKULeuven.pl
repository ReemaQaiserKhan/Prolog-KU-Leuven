/*You can run KakuroReeKULeuven.pl on https://swish.swi-prolog.org/. Write KakuroReeKULeuven.pl in the search bar and then select.
Kakuro is a game. The goal is to fill in the white squares of the Kakuro grids using only the numbers 1 to 9. Each Kakuro is made up of several blocks arranged in 
rows and columns, limited by black boxes, in the same way as crossword. These boxes must be filled in with figures whose sum corresponds to the number indicated in the 
black box (at the bottom, for the vertical block, at the top for the horizontal). No number must appear twice in the same block. Consider it following grid:
                                               
                                               ____________________________________________
                                              |_____|________|__11V__|_4V____|_______|_____|
                                              |_____|5H,14V__|___W___|__W____|_10V___|_____|
                                              |_17H_|___W____|__W____|__W____|__W____|__3V_|
                                              |__6H_|___W____|__W____|_3V,4H_|__W____|__W__|
                                              |_____|_10H____|___W___|__W____|__W____|__W__|
                                              |_____|________|__3H__|___W____|__W____|_____|
                                              
                                              • W - White Boxes.
                                              • The Empty Boxes and the one with values (e.g.5H,14V) are the Black Boxes.
                                              • H - Horizontal Sum
                                              • V - Vertical Sum

• Model the problem as a constraint satisfaction problem (variables, their domains, constraints).
• Write a program in PROLOG which solves this grid.*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-use_module(library(clpfd)).

kakuro(X):-
    
    X=[W1,W2,W3,W4,W5,W6,W7,W8,W9,W10,W11,W12,W13,W14,W15,W16], X ins 1..9,
    % Vertical Black (bottom) Boxes          % Horizontal Black (top) Boxes
    BV1#=11,                                 BH1#=5,
    BV2#=4,                                  BH2#=17,
    BV3#=14,                                 BH3#=6,
    BV4#=10,                                 BH4#=4,
    BV5#=3,                                  BH5#=10,   
    BV6#=3,                                  BH6#=3,
    
    % White Boxes Calculation
    W1+W2#=BH1,
    W1+W4+W8+W11#=BV1,
    W2+W5#=BV2,
    W3+W4+W5+W6#=BH2,
    W3+W7#=BV3,
    W7+W8#=BH3,
    W6+W9+W13+W16#=BV4,
    W9+W10#=BH4,
    W10+W14#=BV5,
    W11+W12+W13+W14#=BH5,
    W12+W15#=BV6,
    W15+W16#=BH6,
    
    labeling([],X).
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  /* Executing the Program:-
  ?- kakuro(X).
  OUTPUT:
  X = [2, 3, 9, 1, 1, 6, 5, 1, 2, 2, 7, 1, 1, 1, 2, 1]
  X = [2, 3, 9, 2, 1, 5, 5, 1, 2, 2, 6, 1, 2, 1, 2, 1]
  X = [2, 3, 9, 2, 1, 5, 5, 1, 2, 2, 6, 2, 1, 1, 1, 2]
  X = [2, 3, 9, 2, 1, 5, 5, 1, 3, 1, 6, 1, 1, 2, 2, 1]
  X = [2, 3, 9, 3, 1, 4, 5, 1, 2, 2, 5, 1, 3, 1, 2, 1]
  X = [2, 3, 9, 3, 1, 4, 5, 1, 2, 2, 5, 2, 2, 1, 1, 2]
  ...................
  */
