% Convert String into ASCII codes, and convert ASCII codes into String.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
string_codes1(X,List):-
    atom_chars(X,XChar),
    string_codes2(XChar,List).

string_codes4(X,List):-
    string_codes3(Char,List),
    atomic_list_concat(Char,X).

string_codes2([],[]).
string_codes2([H|T],[Code|List]):-
    char_code(H,Code),
    string_codes2(T,List).

string_codes3([],[]).
string_codes3([Char|T],[H|List]):-
    char_code(Char,H),
    string_codes3(T,List).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:
?- string_codes1('Hello',List).
OUTPUT:
List = [72, 101, 108, 108, 111]

?- string_codes4(Text,[72, 101, 108, 108, 111]).
OUTPUT:
Text = 'Hello'
*/
