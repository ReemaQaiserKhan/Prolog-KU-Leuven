/* Write a code that based on percentage recommends the programmes available.*/

k:-
    write('Enter name: '),nl, %Enter Name
    read(FName),nl,
    write('Enter your interest: 1- Engineering 2- Medical'),nl, %Enter Interest
    read(Interest),nl,
    write('Enter your percentage:'),nl, %Enter Percentage
    read(Percentage),nl,
    upcase_atom(FName,Name), %Convert name into uppercase
    write('Name:'),write(Name),nl,
    write('Interest:'),write(Interest),nl,
    write('Percentage:'),write(Percentage),nl,
    write('You are eligible for the following programmes:'),nl,
    %Using if-else to check percentages and avaiable programmes
    (   Interest=1->  
    ( Percentage>=65 ->
        write('Electrical Engineering'),nl,
        write('Chemical Engineering');
        Percentage>=60 ->
        write('Aerospace Engineering'),nl,
        write('Petroleum Engineering');
        write('No programmes avaiable.'));
    Interest=2->  
    ( Percentage>=65 ->
        write('Nursing');
        Percentage>=60 ->
        write('Dentistry');
        write('No programmes avaiable.'))).
