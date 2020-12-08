/*Susie loved animals and had a large collection of stuffed animals. However, there were several that were her favorites. She decided this morning to rearrange her stuffed
animals and give each of her favorites a special place in her room. Along with a name, each of her favorite stuffed animals also had an age and all were younger than her, 
of course. Determine the names of her favorite stuffed animals, the type of each animal, how old she deemed each of the animals (from one to five years), and where in her room
she placed each of her favorites.

1- The skunk was two years old. The tiger was a year younger than the animal placed on the bookshelf, but the tiger was also a year older than Cuddles.

2- The animal placed on the chair was two years older than Willie and a year younger than the whale.

3- Cuddles wasn’t the skunk. Boo wasn’t five years old.

4- The cat was placed on the bed.

5- The bear was two years older than Spot. Amee was the whale but she wasn’t placed on the pillow.

6- Cuddles wasn’t placed on the bench.
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-use_module(library(clpfd)).

puzzle(Name, Animal, Age, Place):-
    Name=[Cuddles, Willie, Boo, Spot, Aimee], Name ins 1..5,
    Animal=[Skunk, Tiger, Whale, Cat, Bear], Animal ins 1..5,
    Age=[_One, Two, _Three, _Four, Five], Age ins 1..5,
    Place=[Bookshelf, Chair, Bed, Pillow, Bench], Place ins 1..5,
    all_different(Name),
    all_different(Animal),
    all_different(Age),
    all_different(Place),
             
    Skunk#=Two,
    Tiger#=Bookshelf-1,
    Tiger#=Cuddles+1,
    Chair#=Willie+2,
    Chair#=Whale-1,
    Cuddles#\=Skunk,
    Boo#\=Five,
    Cat#=Bed,
    Bear#=Spot+2,
    Aimee#=Whale,
    Aimee#\=Pillow,
    Cuddles#\=Bench,
             
    labeling([],Name), labeling([],Animal), labeling([],Age), labeling([],Place).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*Execute the Program:-
?- puzzle(Name, Animal, Age, Place).
OUTPUT:-
Age = [2, 1, 3, 5, 4],
Animal = [1, 3, 4, 2, 5],
Name = [2, 1, 5, 3, 4],
Place = [4, 3, 2, 1, 5]
Age = [2, 1, 3, 5, 4],
Animal = [1, 3, 4, 2, 5],
Name = [2, 1, 5, 3, 4],
Place = [4, 3, 2, 5, 1]
Age = [2, 1, 4, 5, 3],
Animal = [1, 3, 4, 2, 5],
Name = [2, 1, 5, 3, 4],
Place = [4, 3, 2, 1, 5]....
*/
