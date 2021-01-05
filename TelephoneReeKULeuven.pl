% You can run TelephoneReeKULeuven.pl on https://swish.swi-prolog.org/. Write TelephoneReeKULeuven.pl in the search bar and then select.
% Prolog Sample Examination Q4.
/*Suppose you have to represent a collection of (person, phone number) pairs. Let us assume that such a pair is represented by a Prolog term with functor tel and arity 2,
e.g. tel(maria, 2654). Note that you can use the builtin predicates @< , @=< , @> , and @>= to compare Prolog terms alphabetically,
e.g.: ?- jean @< maria. succeeds. 
?- tel(jean,2111) @< tel(maria,1111). succeeds. 
?- tel(jean,1000) @< tel(jean,1020). succeeds. 
?- tel(maria,1000) @< tel(jean,1020). fails. 
(a) Give two different data structures that can be used in Prolog to represent sets of the above tel/2 terms. You may assume that every person has only one phone number. 
(b) Discuss their advantages and disadvantages. 
(c) Define for both cases the predicate possadd that for a given set S and for a ground tel/2 term X checks whether X is already in the set S and if not the predicate 
should add X to S. */
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                                        [Updated:5/1/2021]
tel(jean,2111).
tel(maria,1020).
tel(jean,1000).

posadd_facts(tel(X1,X2),NewSet):-
    D=[X1,X2],D1=tel(X1,X2),
    findall([I1,I2],tel(I1,I2),SList),
    (   checkXinSet(D,SList)->
    join(SList,TelList),
    append(TelList,[D1],NewSet);writeln('X present in Set')).

posadd_term(Term,tel(X1,X2),NewSet):-
    D=[X1,X2],D1=tel(X1,X2),
    findall([I1,I2],member(tel(I1,I2),Term),SList),
    (   checkXinSet(D,SList)->
    join(SList,TelList),
    append(TelList,[D1],NewSet);writeln('X present in Set')).


checkXinSet(_,[]).
checkXinSet([H1,H2],[W|T]):-
    W=[W1,W2],
    [H1,H2]\=[W1,W2],
    checkXinSet([H1,H2],T).

join([],[]).
join([H|T],[tel(W1,W2)|List]):-
    H=[W1,W2],
    join(T,List).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:-
?-posadd_facts(tel(jalex,1000),NewSet).
OUTPUT:
NewSet = [tel(jean, 2111), tel(maria, 1020), tel(jean, 1000), tel(jalex, 1000)]

?-posadd_facts(tel(jean,1000),NewSet).
OUTPUT:
X present in Set
1true

?-posadd_term([tel(jean, 2111), tel(maria, 1020), tel(jean, 1000)],tel(jean,1000),NewSet).
OUTPUT:
X present in Set
1true

?-posadd_term([tel(jean, 2111), tel(maria, 1020), tel(jean, 1000)],tel(alex,1000),NewSet).
OUTPUT:
NewSet = [tel(jean, 2111), tel(maria, 1020), tel(jean, 1000), tel(alex, 1000)]
*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Facts                                                                     %Update:9/12/2020
tel(jack,1234).
tel(john,3432).
tel(mary,4444).

possadd_facts(A,X):-
    findall(P1,tel(P1,_),NameList),
    findall(P2,tel(_,P2),NumList),
    join(NameList,NumList,List),
    possadd2(List,A,NameList,NumList,X).

join([],[],[]).
join([H1|T1],[H2|T2],[K|L]):-
    K=tel(H1,H2),
    join(T1,T2,L).

%Terms
possadd_term(List,A,X):-
    findall(P1,member(tel(P1,_),List),NameList),
    findall(P2,member(tel(_,P2),List),NumList),
    possadd2(List,A,NameList,NumList,X).
 
possadd2(_,[],_,_,[]).
possadd2(List,[A|L],NameList,NumList,[X|O]):-
    A=tel(Z1,Z2),
    \+member(Z1,NameList),
    \+member(Z2,NumList),
    append(List, [A], X),
    possadd2(List,L,NameList,NumList,O).
possadd2(List,[A|L],NameList,NumList,O):-
    A=tel(Z1,Z2),
    member(Z1,NameList),
    member(Z2,NumList),
    possadd2(List,L,NameList,NumList,O).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:-
?-possadd_facts([tel(jack,1234), tel(gorge,5555)],Q).
OUTPUT:
Q = [[tel(jack, 1234), tel(john, 3432), tel(mary, 4444), tel(gorge, 5555)]]
false
?-possadd_term([tel(jack,1234),tel(john,3432),tel(mary,4444)],[tel(jack,1234), tel(gorge,5555)],Q).
OUTPUT:
Q = [[tel(jack, 1234), tel(john, 3432), tel(mary, 4444), tel(gorge, 5555)]]
false
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Facts
tel(maria,2654).
tel(jean,2111).
tel(jean,2345).

% Terms
% [tel(maria,2654), tel(jean,2111), tel(jaila,2345)]

%checkSet_Terms Predicate:- Checks if a tel(X,Y) is present in a Set.
checkSet_Terms(Q,W,E,R,T,U):-
   (member(E,T), member(R,U)->  
   writeln('Already present in the set. Do re-esure that the data is not overlapping. i.e.([maria,2111], [jean,2654]..)');
   \+member(E,T), member(R,U)->  
   writeln('Two people can not have the same number');
   writeln('Not present in the set'),
   append(Q,W,P),    
   writeln(P)).

% Checks if a tel(X,Y) is present in a Set.
% If not then it will add it to the Set.
% Note having same name but different number represents a different person, 
% therefore it will be addded to Set if not present.  
% possadd_terms([tel(aaria,2111)],[tel(maria,2654), tel(jean,2111), tel(jaila,2345)]).
possadd_terms(X,Y):-
   findall(Name,member(tel(Name,_),Y),L1), %[maria, jean, jalia]
   findall(Num,member(tel(_,Num),Y),L2),   %[2654, 2111, 2345]
   X=[tel(G,H)],
   checkSet_Terms(X,Y,G,H,L1,L2).

%checkSet Predicate:- Checks if a tel(X,Y) is present in a Set.
checkSet(A,S,D,F,Z1,Z2,Z3,H1,H2,H3):-
  ( member(A,D),member(S,F)  ->  
    writeln('Already present in the set. Do re-esure that the data is not overlapping. i.e.([maria,2111], [jean,2654]..)');
    \+member(A,D), member(S,F) ->  
    writeln('Two people can not have the same number');
    writeln('Not present in the set'),
    write('New Set:'),
    write(tel(A,S)','tel(Z1,H1)','tel(Z2,H2)','tel(Z3,H3))).

% Checks if a tel(X,Y) is present in a Set.
% If not then it will add it to the Set.
% Note having same name but different number represents a different person, 
% therefore it will be addded to Set if not present. 
%possadd_facts([tel(jean,2111)],2654,2111,2345).
possadd_facts(X,Num1,Num2,Num3):- 
   findall(Name1,tel(Name1,Num1),L1),
   findall(Name2,tel(Name2,Num2),L2),
   findall(Name3,tel(Name3,Num3),L3),
   findall(Num1,tel(Name1,Num1),N1),
   findall(Num2,tel(Name2,Num2),N2),
   findall(Num3,tel(Name3,Num3),N3),
   append(L1,L2,L4),
   append(L4,L3,L5), %[maria, jean,jean]
   append(N1,N2,N4),
   append(N4,N3,NumList), %[2654, 2111, 2345]
   X=[tel(V,B)],
   checkSet(V,B,L5,NumList,L1,L2,L3,Num1,Num2,Num3).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   /*
Executing Program:
?- possadd_facts([tel(jean,21110)],2654,2111,2345).
OUTPUT:
Not present in the set
New Set:tel(jean, 21110),tel([maria], 2654),tel([jean], 2111),tel([jean], 2345)
true
?-possadd_facts([tel(jean,2111)],2654,2111,2345).
OUTPUT:
Already present in the set. Do re-esure that the data is not overlapping. i.e.([maria,2111], [jean,2654]..)
true
?-possadd_facts([tel(park,2111)],2654,2111,2345).
Two people can not have the same number
true
?-possadd_terms([tel(aaria,2111)],[tel(maria,2654), tel(jean,2111), tel(jaila,2345)]).
OUTPUT:
Two people can not have the same number
true
?-possadd_terms([tel(kim,9999)],[tel(maria,2654), tel(jean,2111), tel(jaila,2345)]).
OUTPUT:
Not present in the set
[tel(kim, 9999), tel(maria, 2654), tel(jean, 2111), tel(jaila, 2345)]
true
?-possadd_terms([tel(jaila,2345)],[tel(maria,2654), tel(jean,2111), tel(jaila,2345)]).
OUTPUT:
Already present in the set. Do re-esure that the data is not overlapping. i.e.([maria,2111], [jean,2654]..)
true
*/
