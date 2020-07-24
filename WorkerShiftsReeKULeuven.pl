% You can run WorkerShiftsReeKULeuven.pl on https://swish.swi-prolog.org/. Write WorkerShiftsReeKULeuven.pl in the search bar and then select.
% Prolog Examination January 2016 Q4
You have to plan the shifts of the take shifts one after another. For imum and maximum number of planning for the next quarter, his the minimum and the maximum. 
workers for the next quarter. They each worker you are given his min-shifts in the next quarter. In the number of shifts has to be between 
1) Represent this information in two different ways: by Prolog facts and by Prolog terms. Use your 2 representaions to represent the information that worker 
danny 'needs to do at least 3 shifts and at most 7. 
2) Define for both a predicate possible that for a given subset of workers determines whether together they can form a team to deal with a sequence of s shifts.
Consider the case that danny needs to do at least 3 shifts and at most 7, and jef needs to do at least 2 shifts and at most 2, and ann needs to do at least 2 shifts 
and at most 4. It is possible to make a plan for 5 shifts with danny and jef: namely danny ,jeff, danny, jeff, danny.
It is not possible to make a plan for 6 shifts with danny and jef. It is possible to make a plan for 6 shifts with danny and ann. namely ann, danny, ann,danny, ann, danny. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Facts
worker(danny,3,7).
worker(jeff,2,2).
worker(ann,2,4).

% between1 predicate:- It stores all the missing numbers between two numbers in a List.
% 2,5 -> [2,3,4,5]
between1([I],[O],[P],[K],L1,L2):-
    findall(X,between(I,P,X),L1),
    findall(X,between(O,K,X),L2).

% check predicate:- Checks if a Sequence of Shifts is possible between two workers.
% Shift, List1 of Worker1 and List2 of Worker2
% Calculating M and P from Shift and then checks if they are a member of List1 and List2

check(Shift,L1,L2):-
Res is Shift//2,
M is Res,
P is Shift-Res,
    % Condition checks if M is a member of L1 AND P a member of L2
    % OR M is a member of L2 AND P a member of L1
    (   (   member(M,L1),member(P,L2);member(M,L2),member(P,L1))
    ->  writeln('Possible');
    writeln('Not Possible')).

% possible_facts predicate:- Checks if a Sequence of Shift is possible between two workers.
% possible(danny, ann, 6).

possible_facts(Name1,Name2,S):-
    findall(Min,worker(Name1,Min,Max),List1),
    findall(Min,worker(Name2,Min,Max),List2),
    findall(Max,worker(Name1,Min,Max),ListMax1),
    findall(Max,worker(Name2,Min,Max),ListMax2),
    between1(List1,List2,ListMax1,ListMax2,R1,R2),
    check(S,R1,R2).

% possible_terms predicate:- Checks if a Sequence of Shift is possible between two workers.
% possible_terms([worker(danny,3,7),worker(jeff,2,2),worker(ann,2,4)],jeff,ann,4).

possible_terms(WorkerList,Name1,Name2,S):-
    findall(Min,member(worker(Name1,Min,Max),WorkerList),List1),
    findall(Min,member(worker(Name2,Min,Max),WorkerList),List2),
    findall(Max,member(worker(Name1,Min,Max),WorkerList),ListMax1),
    findall(Max,member(worker(Name2,Min,Max),WorkerList),ListMax2),
    between1(List1,List2,ListMax1,ListMax2,R1,R2),
    check(S,R1,R2).
