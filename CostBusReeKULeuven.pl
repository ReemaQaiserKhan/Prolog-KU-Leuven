/*You can run CostBusReeKULeuven.pl on https://swish.swi-prolog.org/. Write CostBusReeKULeuven2.pl (First Approach) in the search bar and then select.
Write CostBusReeKULeuven.pl (Second Approach) in the search bar and then select.
Prolog August Examination 2016 Q5.
The local school has n number of busses. Each bus makes a tour: it stops nt a sequence of stops and picks up all the children assigned to a stop. 
Your Prolog predicates are intended to help with the planning of these tours. Some practicalities: • All the stops have mums given by Prolog atoms: 
examples are heverlee, leuven-station, leuven-city-center, a, b, c. 
• The distances between the stops are given by Prolog facts for the predicate distance/3, for example: 
distance(heverlee,leuven-city-center,10). 
distance(leuven-station,leuven-city-center,8).
distance(a,b,2). 
distance(c,b,4).
......
• The number of children to be picked up at the stops is given by Prolog facts: 
stop(heverlee,4). 
stop(leuven-station,10). 
stop(leuven-city-center,10).
stop(a,1). stop(c,1). 
If a stop is not mentioned as a Prolog stop/2 fact, you may assume no children have to he picked up at that stop (For example: as stop b is not in the above list, it. implies 
that no stop is needed there). 
Knowing this, 
1) Define a data structure to represent the tour of a bus, namely the sequence of the stops of the bus. Use this representation to represent that a bus stops 
first at leuven-station then at leuven-city-center and finally in heverlee. 
2) Write a predicate costBus that for a given tour determines the cost of the tour. We use a simple cost function: we add up the distances between the stops of the tour. 
in the previous example this would give: 8 + 10 = 18. (we do not take into account the distance of the school to the first and last stop). */
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                                            [Updated: 5/1/2021]
tour(leuven-station,leuven-city-center,heverlee).
tour(a,b,c).

distance(heverlee, leuven-city-center,10).
distance(leuven-station, leuven-city-center,8).
distance(a,b,2).
distance(c,b,4).

costBus(tour(A,B,C),TotalCost):-
    distance(A,B,Cost1),
    distance(C,B,Cost2),
    TotalCost is Cost1+Cost2.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:-
?-costBus(tour(leuven-station,leuven-city-center,heverlee),TotalCost).
OUTPUT:
TotalCost = 18

?-costBus(tour(a,b,c),TotalCost).
OUTPUT:
TotalCost = 6

*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                                         %Fisrt Approach
distance(heverlee, leuven-city-center,10).
distance(leuven-station, leuven-city-center,8).
distance(a,b,2).
distance(c,b,4).
distance(heverlee,a,7).
distance(heverlee,b,20).
distance(leuven-city-center,a,5).
distance(c,a,15).
distance(leuven-city-center,c,33).
distance(leuven-station,c,14).
distance(c,leuven-city-center,33).

costBus([],0).
costBus([X],0).
costBus([H1,H2|Tail],Cost):-
    distance(H1,H2,C1),
    costBus([H2|Tail],C2),
    Cost is C1+C2.
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Executing the program:-
OUTPUT:
?-costBus([leuven-station,leuven-city-center],C).
C=8
?- costBus([heverlee, leuven-city-center],C).
C=10
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                                         %Second Approach
distance(heverlee, leuven-city-center,10).
distance(leuven-station, leuven-city-center,8).
distance(a,b,2).
distance(c,b,4).
distance(heverlee,a,7).
distance(heverlee,b,20).
distance(leuven-city-center,a,5).
distance(c,a,15).
distance(leuven-city-center,c,33).
distance(leuven-station,c,14).
distance(c,leuven-city-center,33).


stop(heverlee,4).
stop(leuven-station,10).
stop(leuven-city-center,10).
stop(a,1).
stop(b,0).
stop(c,1).


costBus(X,Y,Z):-
    findall(X,stop(X,_),X1),
    X1=[D1],
    findall(Y,stop(Y,_),Y1),
    Y1=[D2],
    findall(Z,stop(Z,_),Z1),
    Z1=[D3],
    (findall(C1,distance(D1,D2,C1),S1),findall(C2,distance(D3,D2,C2),S2)->  
     (  S1=[]|S2=[]->  
        write('Can not be computed as distance cost for path not provided.');    
        SW is S1+S2,
        write('Cost is: '),
        write(SW)
        )).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Executing the Program:-
?-costBus(heverlee, leuven-city-center,leuven-station).
OUTPUT:
Cost is: 18
1true
?-costBus(leuven-station,leuven-city-center,c).
OUTPUT:
Cost is: 41
1true
?-costBus(heverlee,b,c).
OUTPUT:
Cost is: 24
1true
?-costBus(leuven-city-center,c,leuven-station).
OUTPUT:
Cost is: 47
1true
?-costBus(leuven-city-center,a,b).
OUTPUT:
Can not be computed as distance cost not provided.
1true
*/
