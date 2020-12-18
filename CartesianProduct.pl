/* Write a prolog code of Cartesian product:-

A={1,2,3}, B={2,3}
AxB= {(1,2),(1,3),(2,2),(2,3),(3,2),(3,3)}
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cartesian_product([],_,[]).
cartesian_product([H|T],[H2|T2],[W|List]):-
    cartesian_product2(H,[H2|T2],W),
    cartesian_product(T,[H2|T2],List).

cartesian_product2(_,[],[]).
cartesian_product2(H1,[H2|T2],[(H1,H2)|List]):-
    cartesian_product2(H1,T2,List).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:
?-cartesian_product([1,2,3],[2,3],List).
OUTPUT:
List = [[(1,2), (1,3)], [(2,2), (2,3)], [(3,2), (3,3)]]
false

?-cartesian_product([4,5],[2,3,6],List).
OUTPUT:
List = [[(4,2), (4,3), (4,6)], [(5,2), (5,3), (5,6)]]
false
*/