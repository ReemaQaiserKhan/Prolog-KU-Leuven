/* Write a Prolog predicate stringtonum/2 with two arguments. It takes a string with number"1234" and converts it into a list of individual digits [1,2,3,4]. */

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

stringtonum(A,Y):-
    atom_number(A,K),
    number_codes(K,X1),
    maplist(plus(48),Y,X1).
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 /*Execute the Program:
 ?-stringtonum("1234",P).
 OUTPUT:
 P = [1,2,3,4]
 ?-stringtonum("548765456",P).
 OUTPUT:
 P = [5,4,8,7,6,5,4,5,6]
 */
