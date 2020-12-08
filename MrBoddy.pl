/*
To discover who killed Mr. Boddy, you need to learn where each person was, and what weapon was in the room. Clues are scattered throughout the quiz.

To begin, you need to know the suspects. There are three men (George, John, Robert) and three women (Barbara, Christine, Yolanda).
Each person was in a different room (Bathroom, Dining Room, Kitchen, Living Room, Pantry, Study).
A suspected weapon was found in each room (Bag, Firearm, Gas, Knife, Poison, Rope). Who was found in the kitchen?

Clue 1: The man in the kitchen was not found with the rope, knife, or bag. Which weapon, then, which was not the firearm, was found in the kitchen?
Clue 2: Barbara was either in the study or the bathroom; Yolanda was in the other. Which room was Barbara found in?
Clue 3: The person with the bag, who was not Barbara nor George, was not in the bathroom nor the dining room. Who had the bag in the room with them?
Clue 4: The woman with the rope was found in the study. Who had the rope?
Clue 5: The weapon in the living room was found with either John or George. What weapon was in the living room?
Clue 6: The knife was not in the dining room. So where was the knife?
Clue 7: Yolanda was not with the weapon found in the study nor the pantry. What weapon was found with Yolanda?
Clue 8: The firearm was in the room with George. In which room was the firearm found?
It was discovered that Mr. Boddy was gassed in the pantry. The suspect found in that room was the murderer. Who, then, do you point the finger towards?

*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-use_module(library(clpfd)).

puzzle(Suspects,Rooms,Weapons):-
    
    Suspects=[George, John, Robert, Barbara, Christine, Yolanda], Suspects ins 1..6,
    Rooms=[Bathroom, DiningRoom, Kitchen, LivingRoom, Pantry, Study],Rooms ins 1..6,
    Weapons=[Bag, Firearm, Gas, Knife, _Poison, Rope], Weapons ins 1..6,
    
    all_different(Suspects),
    all_different(Rooms),
    all_different(Weapons),
    
    Barbara#\=Kitchen,
    Christine#\=Kitchen,
    Yolanda#\=Kitchen,
    
    (   George #= Kitchen #/\ (George#\=Rope #\/ George#\=Knife #\/ George#\=Bag #\/ George#\=Firearm))#<==>M1,
    (   John #= Kitchen #/\ (John#\=Rope #\/ John#\=Knife #\/ John#\=Bag) #\/ John#\=Firearm)#<==>M2,
    (   Robert #= Kitchen #/\ (Robert#\=Rope #\/ Robert#\=Knife #\/ Robert#\=Bag #\/ Robert#\=Firearm))#<==>M3,
    M1+M2+M3 #> 0,
    
    Christine#\=Study,
    Christine#\=Bathroom,
    Barbara#\=DiningRoom,
    Barbara#\=Kitchen,
    Barbara#\=Pantry,
    Barbara#\=LivingRoom,
    ( Barbara#= Study #/\ Yolanda#= Bathroom) #<==>B1,
    ( Barbara#= Bathroom #/\ Yolanda#= Study) #<==>B2,
    B1+B2#>0,
    
    Bag#\=Bathroom,
    Bag#\=DiningRoom,
    Bag#\=Barbara,
    Bag#\=George,
    
    (   Barbara#=Rope #/\ Barbara#=Study) #<==> R1,
    (   Christine#=Rope #/\ Christine#=Study) #<==> R2,
    (   Yolanda#=Rope #/\ Yolanda#=Study) #<==> R3,
    R1+R2+R3#>0,
    
    Robert#\=LivingRoom,
    (   John#=LivingRoom) #<==> W1,
    (   George#=LivingRoom) #<==>W2,
    W1+W2#>0,
    
    Knife#\=DiningRoom,
    
    Yolanda#\=Study,
    Yolanda#\=Pantry,
    
    George#=Firearm,
    
    Gas#=Pantry,
    
    labeling([],Suspects),labeling([],Rooms),labeling([],Weapons).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:-
?-puzzle(Suspects,Rooms,Weapons).
OUTPUT:
Rooms = [6, 1, 3, 2, 5, 4],
Suspects = [1, 2, 3, 4, 5, 6],
Weapons = [2, 1, 5, 3, 6, 4]
Rooms = [6, 1, 3, 2, 5, 4],
Suspects = [1, 2, 3, 4, 5, 6],
Weapons = [2, 1, 5, 6, 3, 4]
Rooms = [6, 1, 3, 2, 5, 4],
Suspects = [1, 2, 3, 4, 5, 6],
Weapons = [3, 1, 5, 2, 6, 4]...
*/
