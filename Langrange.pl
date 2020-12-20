/* Exam 2017-2018.
Each number can be written as sum of 4 squares (natural numbers) (Langrange's Square). Write predicate to get these 4 squares. Result needs to be ordered list. 
You can solve with CLPFD or normal prolog.
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-use_module(library(clpfd)).

langrange(Number,X1):-
    X=[A,B,C,D],X ins 0..sup,
    (A*A)+(B*B)+(C*C)+(D*D)#=Number,
    labeling([],X),
    quicksort(X,X1).
         
quicksort([], []).
quicksort([X | Tail], Sorted):-
    split(X, Tail, Small, Big),
    quicksort(Small, SortedSmall),
    quicksort(Big, SortedBig),
    concatenate(SortedSmall, [X| SortedBig], Sorted).

split(X, [], [], []).
split(X, [Y| Tail], [Y | Small], Big):-
    X > Y, !,
    split(X, Tail, Small, Big).
split(X, [Y| Tail], Small, [Y | Big]):-
    split(X, Tail, Small, Big).

concatenate([],List,List).
concatenate([Item|List1],List2,[Item|List3]) :-
    concatenate(List1,List2,List3).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-langrange(3,X).
OUTPUT:
X = [0, 1, 1, 1]
X = [0, 1, 1, 1]
X = [0, 1, 1, 1]...

?-langrange(17,X).
OUTPUT:
X = [0, 0, 1, 4]
X = [0, 0, 1, 4]
X = [0, 0, 1, 4]...

?-langrange(317,X).
OUTPUT:
X = [0, 0, 11, 14]
X = [0, 0, 11, 14]
X = [0, 2, 12, 13]
X = [0, 2, 12, 13]...
*/
