% You can run FiveSistersReeKULeuven.pl on https://swish.swi-prolog.org/. Write WorkerShiftsReeKULeuven.pl in the search bar and then select.
% Solve the following Prolog program using clpfd.
/*Five sisters all have their birthday in a different month and each on a different day of the week. Using the clues below, determine the month and day of the week each sister's
birthday falls.

1- Paula was born in March but not on Saturday. Abigail's birthday was not on Friday or Wednesday.
2- The girl whose birthday is on Monday was born earlier in the year than Brenda and Mary.
3- Tara wasn't born in February and her birthday was on the weekend.
4- Mary was not born in December nor was her birthday on a weekday. The girl whose birthday was in June was born on Sunday.
5- Tara was born before Brenda, whose birthday wasn't on Friday. Mary wasn't born in July.*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-use_module(library(clpfd)).
puzzel(Sisters,Months,Days):-
Sisters=[Paula, Brenda, Abigail, Mary, Tara], Sisters ins 1..5,
Months=[Feburary, March, June, July, December], Months ins 1..5,
Days=[Monday, Wednesday, Friday, Saturday, Sunday], Days ins 1..5,

Paula#=March,
Paula#\=Saturday,
Abigail#\=Friday #\/ Abigail #\=Wednesday,
Tara#\=Feburary #/\ (Tara#=Saturday #\/ Tara#=Sunday),
Mary#\=December #/\ (Mary#\=Saturday #\/ Mary#\=Sunday),
Tara#=Brenda-1,
Brenda#\=Friday,
Mary#\=July,
June#=Sunday,
Brenda #\=Monday #/\ Mary #\=Monday,

all_different(Sisters),
all_different(Months),
all_different(Days),

labeling([], Sisters), labeling([],Months), labeling([], Days).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Executing Program:
?-puzzel(Sisters,Months,Days).
OUTPUT:
Days = [1, 3, 4, 2, 5],
Months = [3, 1, 5, 2, 4],
Sisters = [1, 3, 4, 5, 2]
Days = [4, 3, 1, 2, 5],
Months = [3, 1, 5, 2, 4],
Sisters = [1, 3, 4, 5, 2]
Days = [1, 3, 4, 2, 5],
Months = [3, 1, 5, 4, 2],
Sisters = [1, 3, 4, 5, 2]
......
*/
