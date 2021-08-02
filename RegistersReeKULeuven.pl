/* You can run RegistersReeKULeuven.pl2 (First Approach),RegistersReeKULeuven.pl (Second Approach) on https://swish.swi-prolog.org/. Write RegistersReeKULeuven.pl in the search bar and then select.
Prolog January Examination 2017 Q5.
5. You have a machine with registers n up to rn, which are organised in a ring, so that you can only copy the contents of a register from 
ri to for 1 < i < n and from rn to ri, with the instruction copy(i) (1 < i < n). Note that copy(i) does not change the contents of register i for 1 < I < n.
And you can also swap the contents of any two registers, with the swap(i,j) instruction where 1 < i < j < n. You are given the initial contents of all the registers 
and the desired final contents of all the registers. We are interested in a sequence of copy/1 and swap/2 instructions that transforms the initial Into the final state, or falls 
if this is impossible. As an example, consider the initial state whore register 1 contains "a", register 2 "b", register 3 'c" and register 4 "d", which we denote by the 
shorthand a b c d, and the final state a d a b. A sequence of instructions that effectuates the transition is as follows: first by copy(2) we obtain a b b d, next by copy(1) we
obtain a a b d, next by swap(2,3) we obtain a b a d, and finally by swap(2,4) we obtain adab.  
1) Define a data structure to represent a set of n registers. Use your representation to represent for the above example with 4 registers, namely a b a d. 
2) How do you represent a sequence of instructions? 
3) Write a predicate that for a given set of registers and a given copy(i) instruction (1 < i < n), computes the resulting set of registers. For example for a b a d and copy(2)
it should compute a b b d.
4) Write a predicate that for a given set of registers and a given swap(i,j) instruction (1 < 1 < j < n), computes the resulting set of registers. 
5) Write a predicate that for a. given set of registers generates all the instruction sequences of a given length I. 
6) Write a predicate that checks whether a given instruction se-quence transforms a given initial set of registers into a given final set of registers.
7) Now suppose that you are Interested in finding the shortest instruction sequence for transforming an initial set into a final set using iterative deepening..
Write a predicate for this. */
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                                   %First Approach
register(1,a).
register(2,b).
register(3,a).
register(4,d).

elementat(X,[X|_],1).
elementat(X,[_|L],K):-
    K>1,
    K1 is K-1,
    elementat(X,L,K1).

replace(I,L,E,K):-
    nth0(I,L,_,R),
    nth0(I,K,E,R).

copy(C,R,P):-
    elementat(X,R,C),
    I is C,
    replace(I,R,X,P).

swap(SI1,SI2,L,L2):-
    elementat(X1,L,SI1),
    SI11 is SI1-1,
    SI is SI2-1,
    replace(SI,L,X1,R1),
    elementat(X2,L,SI2),
    replace(SI11,R1,X2,L2).
    

seqInstructions(C1,C2,S1,S2,S3,S4):-
    findall(Register,register(_,Register),RegisterList),
    copy(C1,RegisterList,P),
    writeln(P),
    copy(C2,P,P2),
    writeln(P2),
    swap(S1,S2,P2,P3),
    writeln(P3),
    swap(S3,S4,P3,P4),
    writeln(P4).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* execute the Program:-
?-seqInstructions(2,1,2,3,2,4).
OUTPUT:
[a, b, b, d]
[a, a, b, d]
[a, b, a, d]
[a, d, a, b]
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                                   %Second Approach
register(a,b,a,d).

% element_at predicate:- Gives element in the list with provided position
% element_at(X,[1,a,r,3],3)
element_at(E,[E|_],1).
element_at(E,[_|L],K):-
    K>1,
    K1 is K-1,
    element_at(E,L,K1).

% replace Predicate:- Replace element at the given Index with the given element.
% replace(0,[[a],[b],[a],[d]],b,K).
replace(I,L,E,K):-
    nth0(I,L,_,R),
    nth0(I,K,E,R).

% copy([register(a,b,a,d)],1,NewList).
copy(RList,B,NewList):-
    B1 is B,
    element_at(X,RList,B),
    replace(B1,RList,X,NewList).

% swap Predicate:- Swaps the two elements with each other.
% swap( [[a], [a], [b], [d]],FinalList,2,3).
swap(List,FinalList,B,C):-
    B1 is B-1,
    C1 is C-1,
    element_at(X1,List,B),
    element_at(X2,List,C),
    replace(B1,List,X2,SwapList),
    replace(C1,SwapList,X1,FinalList).

% sequence_instructions Predicate:- Computes a set of predicates to give a FinalList.
% sequence_instructions([register(a,b,a,d)],1,2,3,4,FinalList).
sequence_instructions(RegisterList,A,B,C,D,FinalList):-
    findall(A1,member(register(A1,_,_,_),RegisterList),R1),
    findall(A2,member(register(_,A2,_,_),RegisterList),R2),
    findall(A3,member(register(_,_,A3,_),RegisterList),R3),
    findall(A4,member(register(_,_,_,A4),RegisterList),R4),
    RList=[R1,R2,R3,R4],
    copy(RList,B,NewList),
    copy(NewList,A,NewList2),
    swap(NewList2,FinalList1,B,C),
    swap(FinalList1,FinalList,B,D).

% same Predicate:- Checks if two Lists are same.
% same([[a],[f]],[[a],[f]]).
same(S1,S2):-
    S1=S2.

% checkInitialFinalRegisters predicate:- Checks that the FinalList generated is same to what is predicted.
% checkInitialFinalRegisters([register(a,b,a,d)],1,2,3,4,FinalList,[[a],[d],[a],[b]])
checkInitialFinalRegisters(RegisterList,A,B,C,D,FinalList,CheckList):-
    sequence_instructions(RegisterList,A,B,C,D,FinalList),
    same(FinalList,CheckList).
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 /*Executing the Program:-
 ?-sequence_instructions([register(a,b,a,d)],1,2,3,4,FinalList).
 OUTPUT:
 FinalList = [[a], [d], [a], [b]]
 false
 ?- checkInitialFinalRegisters([register(a,b,a,d)],1,2,3,4,FinalList,[[a],[d],[a],[b]]).
 OUTPUT:
 FinalList = [[a], [d], [a], [b]]
 false
 */
 
