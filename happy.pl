/* Exam-2017-2018
Q4. tom has friends jessa, piet. Piet has friends tom,..(Person X can have 0, 1 or
multiple friends). Represent as facts and as terms. How can we retrieve friends of tom, piet?
Write predicate happy that succeeds if friendship is reciprocal (eg. tom has friend piet, piet
has friend tom).
*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%facts
friend(tom,jessa).
friend(tom,peit).
friend(peit,tom).
friend(jessa,tom).

%terms
[friend(tom,jessa),friend(tom,peit),friend(peit,tom),friend(jessa,tom)]

happy(X):-
    findfriends(X,List),
    checkreciprocal(List,X,Friend),
    write(Friend).

findfriends(X,Xlist):-
    findall(X2,friend(X,X2),Xlist).

checkreciprocal([],_,[]).
checkreciprocal([H|T],X,[H|Friend]):-
    friend(H,X),
    checkreciprocal(T,X,Friend).
checkreciprocal([H|T],X,Friend):-
   \+ friend(H,X),
    checkreciprocal(T,X,Friend).
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 /*Execute the program:-
 ?-happy(tom).
 OUTPUT:
 [jessa, peit]
 1true
 false
 */
