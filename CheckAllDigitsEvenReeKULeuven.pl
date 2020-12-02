/*You can run CheckAllDigitsEvenReeKULeuven.pl on https://swish.swi-prolog.org/. Write CheckAllDigitsEvenReeKULeuven.pl in the search bar and then select.
Q. Write a predicate checkAllDigitsEven taking as input a number. The predicate should succeed if all digits in that number are even, otherwise it should fail.
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c([]).
c([H|T]):-
    length([H|T],C),
    C>=0,
    H mod 2=:=0,
    c(T).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:-
?-c([2,4,8,8,10]).
OUTPUT:
true
?-c([1,2,8]).
OUTPUT:
false
?-c([126,588,600]).
OUTPUT:
true
*/
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
even(N):-
    A is mod(N,2),
    A=0.

checkAllDigitsEven(N):-
    number_chars(N,X),format('~s',[X]),nl,
    X=[X1,X2,X3],
    atom_number(X1,X11),
    atom_number(X2,X22),
    atom_number(X3,X33),
    write(X11),
    write(X22),
    write(X33),
    (   (even(X11),  even(X22),     even(X33))->  
    writeln('All digits are even.');
    writeln('All digits are not even.')).
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 /*Executing the Program:-
 ?-checkAllDigitsEven(222).
 OUTPUT:-
 222
 222
 All digits are even.
 ?-checkAllDigitsEven(332).
 OUTPUT:-
 332
 332
 All digits are not even.
 1true
 
 */
