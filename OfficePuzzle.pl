/*Hunter, Laura, Jim, Sally, and Jack work in the same building with five adjacent offices. Hunter doesn’t work in the 5th office and Laura doesn’t work in the first office.
Jim doesn’t work in the first or last office, and he is not in an office adjacent to Jack or Laura.Sally works in some office higher than Laura’s. Who works in what offices?*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-use_module(library(clpfd)).

puzzle(Employee,Employee_Office_Room):-
    Employee=[Hunter, Laura, Jim, Sally, Jack], Employee ins 1..5,
    Employee_Office_Room=[First,_Second,_Third,_Fourth,Fifth], Employee_Office_Room ins 1..5,
    all_different(Employee),
    all_different(Employee_Office_Room),
    
    Hunter#\=Fifth,
    Laura#\=First,
    Jim#\=First,
    Jim#\=Fifth,
    not_nextto(Jim,Laura),
    not_nextto(Jim,Jack),
    Sally#=Laura-1,
    labeling([],Employee),labeling([],Employee_Office_Room).
    
    not_nextto(A,B):-abs(A-B)#\=1.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:-
?-puzzle(Employee,Employee_Office_Room).
OUTPUT:
Employee = [1, 4, 2, 3, 5],
Employee_Office_Room = [1, 2, 3, 4, 5]
Employee = [1, 4, 2, 3, 5],
Employee_Office_Room = [1, 2, 3, 5, 4]
Employee = [1, 4, 2, 3, 5],
Employee_Office_Room = [1, 2, 4, 3, 5]
Employee = [1, 4, 2, 3, 5],
Employee_Office_Room = [1, 2, 4, 5, 3]
Employee = [1, 4, 2, 3, 5],
Employee_Office_Room = [1, 2, 5, 3, 4]....
*/
