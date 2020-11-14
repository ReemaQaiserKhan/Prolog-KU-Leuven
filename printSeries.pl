/* Write a Prolog Program that prints a series of numbers till a certain limit. Take as input the starting number, increment it by 1, keep going till the limit is reached. 
By limit it means how many times it needs to get incremeted. Print the final answer in a list.
*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

printSeries(_,[],0):-!.
printSeries(S,[S|T],C):-
    S1 is S+1,
    C1 is C-1,
    printSeries(S1,T,C1).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:
?- printSeries(7,L,5).
OUTPUT:
L = [7, 8, 9, 10, 11]
?-printSeries(1,L,10).
OUTPUT:
L = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
*/
