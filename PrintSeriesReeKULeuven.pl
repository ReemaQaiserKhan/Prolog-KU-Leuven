/* You can run PrintSeriesReeKULeuven.pl on https://swish.swi-prolog.org/. Write PrintSeriesReeKULeuven.pl in the search bar and then select.
   Write a prolog program that when given Row and Column prints the series. For Example:

                                                            ?- printseries(3,4).
                                                            
                                                             OUTPUT:
                                                             [1, 2, 3, 4]
                                                             [5, 6, 7, 8]
                                                             [9, 10, 11, 12]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% printseries Predicate:- Print the series based on rows and columns.
% printseries(4,2).
printseries(R,C):-
    B1 is 1,
    A1 is 1,
    J is 2,
    O is C,
    loop(A1,B1,C,J,O,R).

% loop Predicate:- Prints the series using loop. 
loop(A1,B1,C,J,O,R):-  
      
    (  B1=<R->  
       findall(X,between(A1,C,X),L1),
        writeln(L1),
        K1 is C+1,
        C1 is O*J,
        J1 is J+1,
        B2 is B1+1,
        loop(K1,B2,C1,J1,O,R)).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
Executing Program:-
?-printseries(2,4).
OUTPUT:
[1, 2, 3, 4]
[5, 6, 7, 8]
false
?-printseries(3,4).
OUTPUT:
[1, 2, 3, 4]
[5, 6, 7, 8]
[9, 10, 11, 12]
false
*/
