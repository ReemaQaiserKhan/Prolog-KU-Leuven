/* Write a prolog program that deletes the middle number of an odd list.
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

delMidNumber(K,L):-
    len(K,N),
    (N mod 2 =:= 1 ->  
    N1 is N//2,
    nth0(N1,K,E1),
    del(E1,K,L); write('List has even length'),!).

len([],0).
len([_|T],N):-
    len(T,N1),
    N is N1+1.

del(E,[E|T],T).
del(E,[H|T],[H|T1]):-
    del(E,T,T1).
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 /*Execute the Program:
 ?-delMidNumber([1,3,4,7,9,8,5],L).
 OUTPUT:
 L = [1, 3, 4, 9, 8, 5]
 ?-delMidNumber([1,3,9],L).
 L = [1,9]
 ?-delMidNumber([1,3,4,7,8,5],L).
 OUTPUT:
 List has even length
 */
