/*
Manu based arithmetic operations.
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

arithmetic_operations(X,Y) :- 
    repeat,
    writeln('Choose option: 1. Addition 2.Subtract 3. Multiplication 4. Division 5. Stop'),
    read(O), 
    ( O = 5,!
	; 
    O = 1 ->  
    Z is   X+Y, write('Answer = '),writeln(Z),fail;
    O = 2 ->  
    Z is   X-Y, write('Answer = '),writeln(Z),fail;
    O = 3 ->  
    Z is   X*Y, write('Answer = '),writeln(Z),fail;
    O = 4 ->  
    Z is   X/Y, write('Answer = '),writeln(Z),fail                            
).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:-
Choose option: 1. Addition 2.Subtract 3. Multiplication 4. Division 5. stop
1
Answer = 9
Choose option: 1. Addition 2.Subtract 3. Multiplication 4. Division 5. stop
2
Answer = 1
Choose option: 1. Addition 2.Subtract 3. Multiplication 4. Division 5. stop
3
Answer = 20
Choose option: 1. Addition 2.Subtract 3. Multiplication 4. Division 5. stop
4
Answer = 1.25
Choose option: 1. Addition 2.Subtract 3. Multiplication 4. Division 5. stop
5
1true
*/
