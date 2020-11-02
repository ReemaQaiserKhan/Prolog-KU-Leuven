/*You can run ItemSubsetReeKULeuven.pl on https://swish.swi-prolog.org/. Write ItemSubsetReeKULeuven3.pl (First Approach) in the search bar and then select. 
Write ItemSubsetReeKULeuven2.pl (Second Approach) in the search bar and then select. Write ItemSubsetReeKULeuven.pl (Third Approach) in the search bar and then select.
Prolog January Examination 2020 Q4.
You are given a set of items. Each item has a name, a weight and a value. For example, you have the following 4 items: an ax with weight 50 and value 40, a book of Norvig 
with weight 50 and value 50, a box of cookies with weight 10 and value 5, and a laptop with weight 99 and value 60. 
1) Represent the given information in two different ways: by Prolog facts and by Prolog terms. Use your 2 representations to represent the above set of 4 items. 
2) You have to compute all subsets of items (containing at least one element) such that their total weight is strictly smaller than a given weight W and their total value
is strictly higher than a given V. In the case of our example there are 3 possible subsets that have a weight strictly smaller than 90 and value strictly higher than 40.
namely 1) ax and box of cookies, 2) book of Norvig and box of cookies and 3) book of Norvig. Choose one of the 2 representations and define the predicate subset to compute such 
subsets. Note that in general there can a finite number n of such items.
3) Write a predicate highest to find the list of all items with the highest value. You can again chose one of the representations.*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                                        %Latest Update [Copy and paste code in swish]
item(ax,50,40).
item(book, 50,501).
item(cookies,10,5).
item(laptop,99,60).

%For checking single items
check_singleitem(W,V,L):-
     item(L,W1,V1),
     W1 =< W,
     V1 > V,
     write(L).

%checksubset(200,20,I,P).
checksubset(W,V,L,P):-
    check_singleitem(W,V,L),
    item(L,WL,VL),
    item(P,WP,VP),
    P \= L,
    WR is WL+WP,
    VR is VL+VP,
    WR =< W,
    VR > V.

max([],0).
max([H|T],Max):-
    max(T,Tailmax),
    H>Tailmax,
    Max is H.
max([H|T],Max):-
    max(T,Tailmax),
    H=<Tailmax,
    Max is Tailmax.

%Return item with highest weight and volume in List 
%highest(HighestItemWeight,HighestItemVolume).
highest(S,R):-
    findall(Weight,item(_,Weight,_),WeightList),
    findall(Volume,item(_,_,Volume),VolumeList),
    max(WeightList,A1),
    item(S,A1,_),
    max(VolumeList,A2),
    item(R,_,A2).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Execute the Program:-
?-checksubset(200,20,L,P).
OUTPUT:-
ax
L = ax,
P = book
L = ax,
P = cookies
L = ax,
P = laptop
book
L = book,
P = ax
L = book,
P = cookies
L = book,
P = laptop
laptop
L = laptop,
P = ax
L = laptop,
P = book
L = laptop,
P = cookies
?-highest(HighestItemWeight,HighestItemVolume).
OUTPUT:
HighestItemVolume = book,
HighestItemWeight = laptop
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                                            %First Approach
item(ax,50,40).
item(book, 50,50).
item(cookies,10,5).
item(laptop,99,60).

subset(W,V):-
    %For checking single items
     item(L,W1,V1),
     W1=<W,
     V1>V,
     writeln([L]),
    %For checking pair of items
    item(G,O1,O2),
    item(P,A1,A2),
    G\=P,
    R1 is O1+A1,
    R2 is O2+A2,
    R1=<W,
    R2>V,
    append([G],[P],List),
    writeln(List).

highest(V):-
    item(Li,_,V1i),
    V1i>V,
    findall(Li,item(Li,_,_),L3),
     writeln(L3).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-subset(90,40).
OUTPUT:
[book]
[ax, cookies]
1true
[book, cookies]
2true
[cookies, ax]
3true
[cookies, book]
4true
false
?-subset(101,56).
[laptop]
[ax, book]
1true
[book, ax]
2true
false
?-highest(30).
OUTPUT:
[ax]
1true
[book]
2true
[laptop]
3true
?-highest(55).
OUTPUT:
[laptop]
1true
*/                                                                    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                                    %Second Approach
item(ax,50,40).
item(book, 50,50).
item(cookies,10,5).
item(laptop,99,60).

subset(W,V):-
    subsetsingle(W,V),
    subset1stItem(W,V),
    subset2ndItem(W,V),
    subset3rdItem(W,V),
    subset4thItem(W,V).

subsetsingle(W,V):-
     item(L,W1,V1),
     W1=<W,
     V1>V,
     writeln(L),
     writeln('_____').

subset1stItem(W,V):-
    findall(WI1,item(ax,WI1,_),A1),
    findall(VI1,item(ax,_,VI1),A2),
    item(L,W1,V1),
    L\='ax',
    W2 is W1+A1,
    V2 is V1+A2,
    W2=<W,
    V2>V,
    writeln('ax'),
    writeln(L),
    writeln('_____').
    
subset2ndItem(W,V):-
    findall(WI1,item(book,WI1,_),A1),
    findall(VI1,item(book,_,VI1),A2),
    item(L,W1,V1),
    L\='book',
    W2 is W1+A1,
    V2 is V1+A2,
    W2=<W,
    V2>V,
    writeln('book'),
    writeln(L),
    writeln('_____').
    
subset3rdItem(W,V):-
    findall(WI1,item(cookies,WI1,_),A1),
    findall(VI1,item(cookies,_,VI1),A2),
    item(L,W1,V1),
    L\='cookies',
    W2 is W1+A1,
    V2 is V1+A2,
    W2=<W,
    V2>V,
    writeln('cookies'),
    writeln(L),
    writeln('_____').
    
subset4thItem(W,V):-
    findall(WI1,item(laptop,WI1,_),A1),
    findall(VI1,item(laptop,_,VI1),A2),
    item(L,W1,V1),
    L\='laptop',
    W2 is W1+A1,
    V2 is V1+A2,
    W2=<W,
    V2>V,
    writeln('laptop'),
    writeln(L).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Execute the Program:-
?-subset(90,40).
OUTPUT:
book
_____
ax
cookies
_____
book
cookies
_____
cookies
ax
_____
cookies
book
_____
false
?-subset(101,56).
laptop
_____
ax
book
_____
book
ax
_____
false
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                                    %Third Approach
% facts
item(ax,50,40).
item(book, 50,50).
item(cookies,10,5).
item(laptop,99,60).

% terms
% [item(ax,50,40),item(book, 50,50),item(cookies,10,5),item(laptop,99,60)]

% subset_terms Predicate:- Generates subsets.
% subset_terms([item(ax,50,40),item(book, 50,50),item(cookies,10,5),item(laptop,99,60)],160,30)
subset_terms(TermList,W,V):-
    findall(Object,member(item(Object,Weight,Value),TermList),ObjectList),
    findall(Weight,member(item(Object,Weight,Value),TermList),WeightList),
    findall(Value,member(item(Object,Weight,Value),TermList),ValueList),
    
    ObjectList=[O1,O2,O3,O4],
    WeightList=[W1,W2,W3,W4],
    ValueList=[V1,V2,V3,V4],
    generate_subsets(O1,O2,O3,O4,W1,W2,W3,W4,V1,V2,V3,V4,W,V).

% generate_subsets Predicate:- Generates the different subsets.
% Note that switch has been used here instead of if-else. This is because we have more than one true conditions
% in many cases. If we used if-else it would stop after giving the first true condition and would not
% explore the remaining true conditions.
generate_subsets(O1,O2,O3,O4,W1,W2,W3,W4,V1,V2,V3,V4,W,V):- 
  ((W1<W , V1>V, writeln(O1))|(W2<W , V2>V, writeln(O2))|(W3<W , V3>V,writeln(O3))|
   (W4<W , V4>V,writeln(O4))|(A1 is W1+W2,A2 is V1+V2,A1<W, A2>V, write(O1),write(' '),writeln(O2))|
   (B1 is W1+W3,B2 is V1+V3,B1<W, B2>V,write(O1),write(' '),writeln(O3))|(C1 is W1+W4,C2 is V1+V4,
    C1<W, C2>V,write(O1),write(' '),writeln(O4))|(D1 is W2+W3,D2 is V2+V3,D1<W, D2>V,write(O2),
    write(' '),writeln(O3))|(E1 is W2+W4,E2 is V2+V4,E1<W, E2>V,write(O2),write(' '),writeln(O4))|
   (F1 is W3+W4,F2 is V3+V4,F1<W, F2>V,write(O3),write(' '),write(O4))).

% subset_facts Predicate:- Generates subsets.
% subset_facts(ax,book,cookies,laptop,90,40).
subset_facts(Object1,Object2,Object3,Object4,W,V):-
    findall(Object1,item(Object1,Weight,Value),O1),
    findall(Object2,item(Object2,Weight,Value),O2),
    findall(Object3,item(Object3,Weight,Value),O3),
    findall(Object4,item(Object4,Weight,Value),O4),
    findall(Weight,item(Object1,Weight,Value),W1),
    findall(Weight,item(Object2,Weight,Value),W2),
    findall(Weight,item(Object3,Weight,Value),W3),
    findall(Weight,item(Object4,Weight,Value),W4),
    findall(Value,item(Object1,Weight,Value),V1),
    findall(Value,item(Object2,Weight,Value),V2),
    findall(Value,item(Object3,Weight,Value),V3),
    findall(Value,item(Object4,Weight,Value),V4),
    
generate_subsets(O1,O2,O3,O4,W1,W2,W3,W4,V1,V2,V3,V4,W,V).

% maxList Predicate:- Checks maximum value in the list and returns it.
maxList([],0).
maxList([H|T],Max):-
    maxList(T,TailMax),
    H>TailMax,
    Max is H.
maxList([H|T],Max):-
    maxList(T,TailMax),
    H=<TailMax,
    Max is TailMax. 

% highest_terms Predicate:- Finds the list of all items with the highest value.
% highest_terms([item(ax,50,40),item(book, 50,50),item(cookies,10,5),item(laptop,99,60)])
% highest_terms([item(ax,50,60),item(book, 50,50),item(cookies,10,5),item(laptop,99,60)])
highest_terms(TermList):-
    findall(Value,member(item(Object,Weight,Value),TermList),L1),
    findall(Object,member(item(Object,Weight,Value),TermList),ObjectList),
    L1=[V1,V2,V3,V4],
    ObjectList=[O1,O2,O3,O4],
    maxList(L1,M),
     
   ((M= V1,write([O1]))|
   (M= V2,write([O2]))|
   (M= V3,write([O3]))|
   (M= V4,write([O4]))|
   (M=V1,M=V2,write([O1,O2]))|
   (M=V1,M=V3,write([O1,O3]))|
   (M=V1,M=V4,write([O1,O4]))|
   (M=V2,M=V3,write([O2,O3]))|
   (M=V2,M=V4,write([O2,O4]))|
   (M=V3,M=V4,write([O3,O4]))).

% highest_facts Predicate:- Finds the list of all items with the highest value.
% highest_facts(ax,book,cookies,laptop).
highest_facts(O1,O2,O3,O4):-
    findall(Value,item(O1,Weight,Value),V1),
    findall(Value,item(O2,Weight,Value),V2),
    findall(Value,item(O3,Weight,Value),V3),
    findall(Value,item(O4,Weight,Value),V4),
    L1=[V1,V2,V3,V4],
    maxList(L1,M),
       
   (([M]= V1,write([O1]))|
   ([M]= V2,write([O2]))|
   ([M]= V3,write([O3]))|
   ([M]= V4,write([O4]))|
   ([M]=V1,[M]=V2,write([O1,O2]))|
   ([M]=V1,[M]=V3,write([O1,O3]))|
   ([M]=V1,[M]=V4,write([O1,O4]))|
   ([M]=V2,[M]=V3,write([O2,O3]))|
   ([M]=V2,[M]=V4,write([O2,O4]))|
   ([M]=V3,[M]=V4,write([O3,O4]))).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Executing Program:
?- subset_terms([item(ax,50,40),item(book, 50,50),item(cookies,10,5),item(laptop,99,60)],90,40)
OUTPUT:
book
1true
ax cookies
2true
book cookies
3true
false
?-subset_facts(ax,book,cookies,laptop,90,40).
OUTPUT:
[book]
1true
[ax] [cookies]
2true
[book] [cookies]
3true
false
?-highest_terms([item(ax,50,60),item(book, 50,50),item(cookies,10,5),item(laptop,99,60)]).
OUTPUT:
[ax]
1true
[laptop]
2true
[ax, laptop]
3true
false
?-highest_facts(ax,book,cookies,laptop).
OUTPUT:
[laptop]
1true
false
*/

