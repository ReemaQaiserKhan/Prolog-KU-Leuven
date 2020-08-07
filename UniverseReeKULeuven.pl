/*You can run UniverseReeKULeuven.pl on https://swish.swi-prolog.org/. Write UniverseReeKULeuven.pl in the search bar and then select.
Prolog January Examination 2020 Q5.
5. We have to solve the exact covering problem. In this problem there is a given universe of items and a given set of options. Each option is a set items from the universe. 
Consider an example with as universe the 7 items a,b,c,d,e,f, and g and 6 options, namely option (1) consisting of c and e, option
(2) consisting of a, d, and g, option (3) consisting of b, c, and f, option (4) consisting of a, d, and f, option (5) consisting of b and g, option 
(6) consisting of d, e, and g. The goal of an exact covering problem is to find disjoint options that cover all items in the universe. 
In the above example, option (1), (4) and (5) are disjoint and their union give us each item exactly once. 
Every tentative choice we make leaves us with a residual exact cover problem that is smaller. Suppose we try to cover item a by choosing the option 
(2) consisting of a, d, and g: The residual problem has only two options, namely (1) with c and e and (3) with b, c, and f because the other four involve the 
already-covered items. Now it is easy to see that options (1) and (3) have no solution (that covers b,c,e, and f): option (1) and (3) are not disjoint 
as they both contain item c. Therefore, we can remove option (2). That leaves us with only one option for item a, namely (4) with a, d, and f and its residual
consisting of options (1) and (5) to cover b,c,e, and g. 
1) How do you represent in Prolog the universe of items to be covered? What is your representation for the universe in the example?
2) How do you represent in Prolog the set of options? What is your representation for the options in the example? 
3) An item is covered by an option if that option contains the item. Given a set of options Os and an item I to be covered write a predicate iscovered (I , Os , 0). 
This predicate fails if I can not be covered by the options in Os and succeeds with 0 being a covering option. 
4) Given a set of items Is including I  and given a set of options Os including a covering option O for I, write a predicate residual to determine the residual items and options 
while using 0 to cover I. 
5) Write a predicate findexactcovering that determines for a given universe of items and a given set of options an exact covering (as a subset of options). 
It fails if no exact covering can be found.  
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
universe(a,b,c,d,e,f,g).

option(c,e).
option(a,d,g).
option(b,c,f).
option(a,d,f).
option(b,g).
option(d,e,g).

% iscoveredoption3elements Predicate:- Checks item ibelongs to which option with 3 elements. 
% iscoveredoption3elements(a,[option(a,d,g),option(b,c,f),option(a,d,f)],O).
iscoveredoption3elements(I,Os,O):-
 findall(A,member(option(A,_,_),Os),X1),
  findall(B,member(option(_,B,_),Os),X2),
   findall(C,member(option(_,_,C),Os),X3),
 
    X1=[A1,A2,A3],
    X2=[B1,B2,B3],
    X3=[C1,C2,C3],
    X4=[A1,B1,C1],
    X5=[A2,B2,C2],
    X6=[A3,B3,C3],

     checkitem(I,X4,X5,X6,O).
           
% checkitem Predicate:- Checks item ibelongs to which option.         
checkitem(I,X4,X5,X6,O):-
 (( member(I,X4),O=1,write(O))|(member(I,X5),O=2,write(O))|(member(I,X6),O=3,write(O))).

% iscoveredoption2elements(e,[option(c,e),option(b,g),option(d,e)],O).
% iscoveredoption2elements Predicate:- Checks item ibelongs to which option with 2 elements.
iscoveredoption2elements(I,Os,O):-
 findall(A,member(option(A,_),Os),X1),
  findall(B,member(option(_,B),Os),X2),
    
    X1=[A1,A2,A3],
    X2=[B1,B2,B3],
    X4=[A1,B1],
    X5=[A2,B2],
    X6=[A3,B3],

     checkitem(I,X4,X5,X6,O).

% del Predicate:- Deletes an element from the List.
del(A,[],[]).
del(A,[A|L],M):-!,del(A,L,M).
del(A,[Y|L1],[Y|L2]):-
    del(A,L1,L2).

% overlap Predicate:- Checks if 2 lists have elements that overlap.
overlap(S1,S2):-
    member(X,S1),
    member(X,S2).
% disjoint Predicate:- Checks that 2 list's elements don't overlap.
disjoint(S1,S2):-
    \+overlap(S1,S2).
 
% residual_option3elements(a,[a,b,c,d,e,f,g],[option(a,d,g),option(b,c,f),option(d,e,g)]).
% residual_option3elements Predicate:- Checks the residual items and residual options for an item.
residual_option3elements(Item, Itemset,Os):-
    del(Item,Itemset,Acc),
    write('The residual items are: '),
    writeln(Acc),
    findall(A,member(option(A,_,_),Os),X1),
    findall(B,member(option(_,B,_),Os),X2),
    findall(C,member(option(_,_,C),Os),X3),
 
    X1=[A1,A2,A3],
    X2=[B1,B2,B3],
    X3=[C1,C2,C3],
    X4=[A1,B1,C1],
    X5=[A2,B2,C2],
    X6=[A3,B3,C3],

    (( member(Item,X4), writeln('Option1 is the covering option.'))|
    ( member(Item,X5), writeln('Option2 is the covering option.'))|
    (member(Item,X6), writeln('Option3 is the covering option.'))),
    
    
    ( (\+member(Item,X4),(disjoint(X4,X5),disjoint(X4,X6)),writeln('Option1 is a residual Option.'))|
    ( \+member(Item,X5),(disjoint(X5,X4),disjoint(X5,X6)),writeln('Option2 is a residual Option.'))|
    (\+member(Item,X6),(disjoint(X6,X5),disjoint(X6,X4)),write('Option3 is a residual Option.'))).

% residual_option2elements(a,[a,b,c,d,e,f,g],[option(a,d),option(b,c),option(e,g)]).   
% residual_option2elements Predicate:- Checks the residual items and residual options for an item.    
residual_option2elements(Item, Itemset,Os):-
    del(Item,Itemset,Acc),
    write('The residual items are: '),
    writeln(Acc),
    findall(A,member(option(A,_),Os),X1),
    findall(B,member(option(_,B),Os),X2),
 
    X1=[A1,A2,A3],
    X2=[B1,B2,B3],
    X4=[A1,B1],
    X5=[A2,B2],
    X6=[A3,B3],

    (( member(Item,X4), writeln('Option1 is the covering option.'))|
    ( member(Item,X5), writeln('Option2 is the covering option.'))|
    (member(Item,X6), writeln('Option3 is the covering option.'))),
    
    
    ( (\+member(Item,X4),(disjoint(X4,X5),disjoint(X4,X6)),writeln('Option1 is a residual Option.'))|
    ( \+member(Item,X5),(disjoint(X5,X4),disjoint(X5,X6)),writeln('Option2 is a residual Option.'))|
    (\+member(Item,X6),(disjoint(X6,X5),disjoint(X6,X4)),write('Option3 is a residual Option.'))).
    
% findexactcovering_option3element([a,b,c,d,e,f,g],[option(a,d,g),option(b,c,f),option(a,e,g)]).
% findexactxovering_option3elements Predicate:- For a given set of universe of items,checks for each item their covering option.
findexactcovering_option3element(Itemset,Os):-
    
   findall(A,member(option(A,_,_),Os),X1),
    findall(B,member(option(_,B,_),Os),X2),
    findall(C,member(option(_,_,C),Os),X3),
 
    Itemset=[I1,I2,I3,I4,I5,I6,I7],
   X1=[A1,A2,A3],
    X2=[B1,B2,B3],
    X3=[C1,C2,C3],
    X4=[A1,B1,C1],
    X5=[A2,B2,C2],
    X6=[A3,B3,C3],

    (( member(I1,X4),write(I1), write(' '),writeln('Option1 is the covering option.'))|
    ( member(I1,X5),write(I1),write(' '),  writeln('Option2 is the covering option.'))|
    (member(I1,X6),write(I1),write(' '),  writeln('Option3 is the covering option.'))|
    ( member(I2,X4), write(I2),write(' '), writeln('Option1 is the covering option.'))|
    ( member(I2,X5), write(I2),write(' '), writeln('Option2 is the covering option.'))|
    (member(I2,X6), write(I2),write(' '), writeln('Option3 is the covering option.'))|
    ( member(I3,X4), write(I3),write(' '),writeln('Option1 is the covering option.'))|
    ( member(I3,X5), write(I3),write(' '),writeln('Option2 is the covering option.'))|
    (member(I3,X6), write(I3),write(' '),writeln('Option3 is the covering option.'))|
    ( member(I4,X4), write(I4),write(' '),writeln('Option1 is the covering option.'))|
    ( member(I4,X5), write(I4),write(' '),writeln('Option2 is the covering option.'))|
    (member(I4,X6), write(I4),write(' '),writeln('Option3 is the covering option.'))|
    ( member(I5,X4), write(I5),write(' '),writeln('Option1 is the covering option.'))|
    ( member(I5,X5), write(I5),write(' '),writeln('Option2 is the covering option.'))|
    (member(I5,X6), write(I5),write(' '),writeln('Option3 is the covering option.'))|
    ( member(I6,X4), write(I6),write(' '),writeln('Option1 is the covering option.'))|
    ( member(I6,X5), write(I6),write(' '),writeln('Option2 is the covering option.'))|
    (member(I6,X6), write(I6),write(' '),writeln('Option3 is the covering option.'))|
    ( member(I7,X4), write(I7),write(' '),writeln('Option1 is the covering option.'))|
    ( member(I7,X5), write(I7),write(' '),writeln('Option2 is the covering option.'))|
    (member(I7,X6), write(I7),write(' '),writeln('Option3 is the covering option.'))).

% findexactcovering_option2element([a,b,c,d,e,f,g],[option(a,d),option(b,c),option(e,g)]).
% % findexactxovering_option2elements Predicate:- For a given set of universe of items,checks for each item their covering option.
findexactcovering_option2element(Itemset,Os):-
    
   findall(A,member(option(A,_),Os),X1),
    findall(B,member(option(_,B),Os),X2),

    Itemset=[I1,I2,I3,I4,I5,I6,I7],
    X1=[A1,A2,A3],
    X2=[B1,B2,B3],
    X4=[A1,B1],
    X5=[A2,B2],
    X6=[A3,B3],

    (( member(I1,X4),write(I1), write(' '),writeln('Option1 is the covering option.'))|
    ( member(I1,X5),write(I1),write(' '),  writeln('Option2 is the covering option.'))|
    (member(I1,X6),write(I1),write(' '),  writeln('Option3 is the covering option.'))|
    ( member(I2,X4), write(I2),write(' '), writeln('Option1 is the covering option.'))|
    ( member(I2,X5), write(I2),write(' '), writeln('Option2 is the covering option.'))|
    (member(I2,X6), write(I2),write(' '), writeln('Option3 is the covering option.'))|
    ( member(I3,X4), write(I3),write(' '),writeln('Option1 is the covering option.'))|
    ( member(I3,X5), write(I3),write(' '),writeln('Option2 is the covering option.'))|
    (member(I3,X6), write(I3),write(' '),writeln('Option3 is the covering option.'))|
    ( member(I4,X4), write(I4),write(' '),writeln('Option1 is the covering option.'))|
    ( member(I4,X5), write(I4),write(' '),writeln('Option2 is the covering option.'))|
    (member(I4,X6), write(I4),write(' '),writeln('Option3 is the covering option.'))|
    ( member(I5,X4), write(I5),write(' '),writeln('Option1 is the covering option.'))|
    ( member(I5,X5), write(I5),write(' '),writeln('Option2 is the covering option.'))|
    (member(I5,X6), write(I5),write(' '),writeln('Option3 is the covering option.'))|
    ( member(I6,X4), write(I6),write(' '),writeln('Option1 is the covering option.'))|
    ( member(I6,X5), write(I6),write(' '),writeln('Option2 is the covering option.'))|
    (member(I6,X6), write(I6),write(' '),writeln('Option3 is the covering option.'))|
    ( member(I7,X4), write(I7),write(' '),writeln('Option1 is the covering option.'))|
    ( member(I7,X5), write(I7),write(' '),writeln('Option2 is the covering option.'))|
    (member(I7,X6), write(I7),write(' '),writeln('Option3 is the covering option.'))).
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   /*Executing The Program:-
   ?-iscoveredoption3elements(a,[option(a,d,g),option(b,c,f),option(a,d,f)],O).
   OUTPUT:
   1
   O = 1
   3
   O = 3
   false
   ?-iscoveredoption2elements(e,[option(c,e),option(b,g),option(d,e)],O).
   OUTPUT:
   1
   O = 1
   3
   O = 3
   ?-residual_option3elements(a,[a,b,c,d,e,f,g],[option(a,d,g),option(b,c,f),option(d,e,g)]).
   OUTPUT:
   The residual items are: [b, c, d, e, f, g]
   Option1 is the covering option.
   Option2 is a residual Option.
   1true
   false
   ?-residual_option2elements(a,[a,b,c,d,e,f,g],[option(a,d),option(b,c),option(e,g)]).
   OUTPUT:
   The residual items are: [b, c, d, e, f, g]
   Option1 is the covering option.
   Option2 is a residual Option.
   1true
   Option3 is a residual Option.
   2true
   false
   ?-findexactcovering_option3element([a,b,c,d,e,f,g],[option(a,d,g),option(b,c,f),option(a,e,g)]).
   OUTPUT:
   a Option1 is the covering option.
   1true
   a Option3 is the covering option.
   2true
   b Option2 is the covering option.
   3true
   c Option2 is the covering option.
   4true
   d Option1 is the covering option.
   5true
   e Option3 is the covering option.
   6true
   f Option2 is the covering option.
   7true
   g Option1 is the covering option.
   8true
   g Option3 is the covering option.
   9true
   ?-findexactcovering_option2element([a,b,c,d,e,f,g],[option(a,d),option(b,c),option(e,g)]).
   OUTPUT:
   a Option1 is the covering option.
   1true
   b Option2 is the covering option.
   2true
   c Option2 is the covering option.
   3true
   d Option1 is the covering option.
   4true
   e Option3 is the covering option.
   5true
   g Option3 is the covering option.
   6true
   */
