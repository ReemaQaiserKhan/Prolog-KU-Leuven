/*
Write a prolog program to manipulate  arithmetic operations based on precedence. E.g. [4,5,6], [+, * ] --> 4+5*6=34
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
arithmetic_operations([H1|T1],[H2|T2],Total):-
    arithmetic_operations1([H1|T1],[H2|T2],Z),
    last_value(Z,Total),!.

arithmetic_operations1([],[],[]).
arithmetic_operations1([_X],[],[]).
arithmetic_operations1([H1,H2|T],[W|L],[Z|P]) :- 
      (   W='*' ->       
    Z is H1 * H2,
    arithmetic_operations1([Z|T],L,P);
          W='+' ->      
          Z is H1 + H2,
    arithmetic_operations1([Z|T],L,P);
      W='/' ->      
          Z is H1 / H2,
    arithmetic_operations1([Z|T],L,P);
      W='-' ->      
          Z is H1 - H2,
    arithmetic_operations1([Z|T],L,P)).

last_value([X],X).
last_value([_|T],X):-
    last_value(T,X).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Executing the Program:-
?-arithmetic_operations([5,4,6,7],[*,-,/],Z).
OUTPUT:
Z = 2

?-arithmetic_operations([5,4,6],[*,+],Z).
OUTPUT:
Z = 26

?-arithmetic_operations([5,4,6,7],[*,+,/],Z).
OUTPUT:
Z = 3.7142857142857144
*/
