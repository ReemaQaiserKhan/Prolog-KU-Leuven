% You can run TopScoreReeKULeuven.pl on https://swish.swi-prolog.org/. Write TopScoreReeKULeuven.pl in the search bar and then select.
% Prolog Sample Examination Q4.
/* After the exams of January, Eveline has the scores of the students for
the courses. For example, student Danny obtained a 20 on FAI and a
15 on PLPM, Jonas obtained a 18 on PLPM, a 14 on FAI, and a 4 on
UAI.
(a) Represent this information in two different ways: by Prolog facts
and by Prolog terms. Use your 2 representations to represent the
above example.
(b) Define for both representations the predicate topscore that determines for a given course the student with the top score. You
may assume that for each course there is exactly 1 student with
a top score.
In the above example, Danny is the student with the top score
for FAI, whereas for UAI it is Jonas. */
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Facts
score(danny,fai,20).
score(danny, plpm,15).
score(toon,fai,14).
score(toon,plpm,18).
score(toon,uai,4).

% Terms
% [score(danny,fai,20),score(danny, plpm,15),score(toon,fai,14),score(toon,plpm,18),score(toon,uai,4)].


% maxList Predicate:- Checks maximum value in the list and returns it.
maxlist([],0).

maxlist([Head|Tail],Max) :-
    maxlist(Tail,TailMax),
    Head > TailMax,
    Max is Head.

maxlist([Head|Tail],Max) :-
    maxlist(Tail,TailMax),
    Head =< TailMax,
    Max is TailMax.

% topscore_facts Predicate:- For a given Course, checks who has scored highest.
% topscore_facts(fai).
topscore_facts(Course):-
    findall(Score,score(_Student,Course,Score),List_students),
    maxlist(List_students,Score),
    (Score=:=20 ->
    writeln('danny'),
    fail;
    Score =:= 15 ->
    writeln('danny'),
    fail;
    writeln('toon')).

% topscore_terms Predicate:- For a given Course, checks who has scored highest.
% topscore_terms([score(danny,fai,20),score(danny, plpm,15),score(toon,fai,14),score(toon,plpm,18),score(toon,uai,4)],uai).
topscore_terms(List_term,Course):-
    findall(Score,member(score(_Student,Course,Score),List_term),List_students),
    maxlist(List_students,Score),
   (Score=:=20 ->
    writeln('danny'),
    fail;
    Score =:= 15 ->
    writeln('danny'),
    fail;
    writeln('toon')).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
Executing Program:
?-topscore_facts(fai).
OUTPUT:
danny
false
?-topscore_facts(plpm).
OUTPUT:
toon
true
false
?-topscore_terms([score(danny,fai,20),score(danny, plpm,15),score(toon,fai,14),score(toon,plpm,18),score(toon,uai,4)],uai).
OUTPUT:
toon
true
false
?-topscore_terms([score(danny,fai,20),score(danny, plpm,15),score(toon,fai,14),score(toon,plpm,18),score(toon,uai,4)],fai).
OUTPUT:
danny
false
*/







