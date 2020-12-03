/* Define yourself the predicate include/3 in Prolog.  E.g.:-

                            ?- include(positive,[1,3,-5,6],L).
                            L = [1, 3, 6]

                            ?- include(integer,[1,3,a,hello,5],K).
                            K = [1, 3, 5].
*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

include1(X,[H|T],L):-
    (   X=='positive' ->  
    positive([H|T],L);
    X=='integer' ->  
    integer1([H|T],L);
    X=='word_character' ->  
    word_character([H|T],L)).

positive([],[]).
positive([H|T],[H|L]):-
         number(H),
         H>0,
    positive(T,L).
positive([H|T],L):-
    number(H),
         H=<0,
    positive(T,L).
positive([H|T],L):-
    \+number(H),
    positive(T,L).

integer1([],[]).
integer1([H|T],[H|L]):-
         number(H),
    integer1(T,L).
integer1([H|T],L):-
         \+number(H),
    integer1(T,L).

word_character([],[]).
word_character([H|T],[H|L]):-
         \+number(H),
    word_character(T,L).
word_character([H|T],L):-
        number(H),
    word_character(T,L).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  /*Execute the Program:-
  ?-include1('positive',[1,-1,a,2,s],L),include1('integer',[1,-1,a,2,s],R),include1('word_character',[1,-1,a,2,s],X).
  OUTPUT:
  L = [1, 2],
  R = [1, -1, 2],
  X = [a, s]
  false
  */
