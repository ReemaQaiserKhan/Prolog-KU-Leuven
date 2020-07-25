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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
