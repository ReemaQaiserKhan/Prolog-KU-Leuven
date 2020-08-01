/* You can run SpecialLecturesReeKULeuven.pl on https://swish.swi-prolog.org/. Write SpecialLecturesReeKULeuven.pl in the search bar and then select.
Prolog January Examination 2017 Q3.
The week before the Christmas break was made varied by a series of special lectures, one each day (Monday through Friday).
The lectures had the following topics: bioinformatics, physical hygiene, modern art, nutrition, and study habits. The lecturers were two women named Al-ice and Bernadette, 
and three men named Charles, Duane, and Eddie. The last names of the lecturers were Felicidad, Garber, Haller, Itakura, and Jeffreys.
You also know the following facts:
1) Alice lectured on Monday. 
2) Charles's lecture or. physical hygiene wasn't given on aiday.
3) Dietician Jeffreys gave the lecture on nutrition.
4) A man gave the lecture on modern art. 
5) Miss Itakura and the lecturer on proper study habits spoke on consecutive days, in one order or the other. 
6) Haller gave a lecture sometime after Eddie did. 7) Duane Felicidad gave his lecture sometime before the modern art lecture. 
Write a program to determine for each day the lecturer (first and last name) and the topic. Indicate clearly whether you are using CLP or just normal Prolog. 
Also indicate which lines in your program are encoding each of the 7 facts. */
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-use_module(library(clpfd)).

special_lectures(Days,Topics, First_Name,Last_Name):-
    
    Days=[M,T,W,Th,F],Days ins 1..5,
    Topics=[BI, PH, MA, NU, SH], Topics ins 1..5,
    First_Name=[Alice, Bernadette, Charles, Duane, Eddie], First_Name ins 1..5,
    Last_Name=[Felicidad,Garber, Haller, Itakura, Jefferys], Last_Name ins 1..5,
    
    Alice#=M,
    Charles#=PH,
    Charles#\=F,
    Jefferys#=NU,
    Duane#=MA #\/ Eddie#=MA,
    Bernadette#=Itakura,
    (Itakura#=W #/\ SH#=Th) #\/ (Itakura#=Th #/\ SH#=W),
    Haller#>Eddie,
    Duane#=Felicidad,
    Duane#<MA,
    
    
    all_different(Days),
    all_different(Topics),
    all_different(First_Name),
    all_different(Last_Name),
     
    labeling([],Days),labeling([],Topics),labeling([],First_Name),labeling([],Last_Name).
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   /* Executing Program:-
   ?-special_lectures(Days,Topics, First_Name,Last_Name).
   OUTPUT:-
   Days = [1, 4, 2, 5, 3],
   First_Name = [1, 5, 4, 2, 3],
   Last_Name = [2, 3, 4, 5, 1],
   Topics = [5, 4, 3, 1, 2]
   Days = [1, 4, 5, 2, 3],
   First_Name = [1, 5, 4, 2, 3],
   Last_Name = [2, 3, 4, 5, 1],
   Topics = [5, 4, 3, 1, 2]
   Days = [1, 5, 2, 3, 4],
   First_Name = [1, 2, 5, 3, 4],
   Last_Name = [3, 4, 5, 2, 1],
   Topics = [2, 5, 4, 1, 3]........
   */
