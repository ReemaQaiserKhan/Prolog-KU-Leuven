/* Prolog Exam 2016 January, Q3.
To add a little fun to the sweltering summer heat, 4Bs Boutique in downtown Knokke announced that they were sponsoring a swimsuit contest. Prizes would be awarded to the winners
and judging would be held the following weekend. Interested contestants should sign up and the 4Bs clientele set up quite a buzz over it all, with speculation running high for 
both who would sign up and who would win, if they did sign up. Write a predicate swim that determines the full name of the five win-ning contestants (one first name was Sarah and
one last name was Sanford), the color of each winners bathing suit, if the winners wore a 1-piece suit or a 2-piece, and what place each won (1st to 5th).
1) Rachel Travers did not wear a red bathing suit but she did place one higher than the woman wearing the white 1-piece bathing suit. 
2) Melonys last name was not James but she won 1st place.
3) The three who wore 1-piece suites were the woman in 2nd place, the one who wore the yellow bathing suit, and Amelia, whose last name was not West. 
4) Rachel placed one higher than Ms. Couch but two places lower than the one who wore the blue bathing suit. 
5) Julias last name was not Couch. Ms. James wore a 2-piece bathing suit. 
6) The five women were, in no particular order, Ms. James, Julia, the woman who placed 5th, the woman who wore the black 2-piece bathing suit, and Ms. West. 
Please use the numbers of the 6 hints to document your code. Indicate clearly whether you are using CLP(R), CLP(FD) ur just, normal Prolog. 
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-use_module(library(clpfd)).

swim(FName,LName,Colour,Piece,Place):-
    FName=[Sarah,Rachel,Melony,Amelia,Julias],FName ins 1..5,
    LName=[_Sanford,Travers,James,West,Couch],LName ins 1..5,
    Colour=[Red,White,Yellow,Black,Blue],Colour ins 1..5,
    Piece=[One,Two,_Three,_Four,_Five],Piece ins 1..5,
    Place=[First,Second,_Third,_Fourth,Fifth], Place ins 1..5,
    
    all_different(FName),
    all_different(LName),
    all_different(Colour),
    all_different(Piece),
    all_different(Place),
    %1
    Rachel#=Travers,
    Rachel#\=Red,
    Rachel+1#=White,
    White#=One,
    %2
    Melony#\=James,
    Melony#=First,
    %3
    Sarah#=Second #/\ Sarah #=One #<==>F1,
    Rachel#=Second #/\ Rachel #=One #<==>F2,
    Amelia#=Second #/\ Amelia #=One #<==>F3,
    Julias#=Second #/\ Julias #=One #<==>F4,
    F1+F2+F3+F4#>0,
    
    Sarah#=Yellow #<==> Y1,
    Rachel#=Yellow #<==> Y2,
    Melony#=Yellow #<==>Y3,
    Julias#=Yellow #<==>Y4,
    Y1+Y2+Y3+Y4#>0,
    
    Amelia#\=Yellow,
    Amelia#=One,
    Amelia#\=West,
    %4
    Rachel#=Couch-1,
    Rachel#=Blue+2,
    %5
    Julias#\=Couch,
    James#=Two,
    %6
    James#\=Fifth #/\ James#\=Black,
    Julias#\=Fifth #/\ Julias#\=Black,
    West#\=Fifth #/\ West#\=Black,
    
    Sarah#=Fifth #/\ Sarah#\=Black #<==>S1,
    Rachel#=Fifth #/\ Rachel#\=Black #<==>S2,
    Amelia#=Fifth #/\ Amelia#\=Black #<==>S3,
    S1+S2+S3#>0,
    
    labeling([],FName),labeling([],LName),labeling([],Colour),labeling([],Piece),
    labeling([],Place).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:-
?- swim(FName,LName,Colours,Piece,Place).
OUTPUT:
Colours = [2, 4, 5, 3, 1],
FName = [1, 3, 2, 4, 5],
LName = [1, 3, 5, 2, 4],
Piece = [4, 5, 1, 2, 3],
Place = [2, 4, 3, 5, 1]
Colours = Place, Place = [2, 4, 5, 3, 1],
FName = [1, 3, 2, 4, 5],
LName = [1, 3, 5, 2, 4],
Piece = [4, 5, 1, 2, 3]
Colours = [2, 4, 5, 3, 1],
FName = [1, 3, 2, 4, 5],
LName = [1, 3, 5, 2, 4],
Piece = [4, 5, 1, 3, 2],
Place = [2, 4, 3, 5, 1]
Colours = Place, Place = [2, 4, 5, 3, 1],
FName = [1, 3, 2, 4, 5],
LName = [1, 3, 5, 2, 4],
Piece = [4, 5, 1, 3, 2]
....
*/
