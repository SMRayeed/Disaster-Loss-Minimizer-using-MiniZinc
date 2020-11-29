include "globals.mzn";

% division among the family members ... according to age -> to determine combined calories needed

int: middle_age_men;
int: middle_age_women;
int: aged_men;
int: aged_women;
int: teenagers;
int: child;

% determining minimum calories needed
int: minimum_calorie_needed;
minimum_calorie_needed = (2500*middle_age_men)+(2000*middle_age_women)+(2000*aged_men)+(1800*aged_women)+(2200*teenagers)+(1500*child);
% these data are collected from the Internet


% determine the number of ingrediants in the storage 
int: calorie_ingrediants;
set of int: OBJ = 1..calorie_ingrediants;

% defining an array to store the prices of these ingrediants
array[OBJ] of int: calorie_ingrediants_price_per_unit;

% defining an array to store the calories of these ingrediants
array[OBJ] of int: calorie_ingrediants_offered_calories_per_unit;

% defining an array to store the amount of these ingrediants available
array[OBJ] of int: calorie_ingrediants_availability_per_unit;

% defining an array to store the results
array[OBJ] of var int: calorie_result;


% defining an upper & a lower threshold of calorie to satisfy 
float: lower_threshold_for_minimum_calorie_needed;
float: upper_threshold_for_minimum_calorie_needed;

lower_threshold_for_minimum_calorie_needed = (0.95*minimum_calorie_needed);
upper_threshold_for_minimum_calorie_needed = (1.10*minimum_calorie_needed);

% defining an upper threshold of any single ingrediant
float: max_calorie_from_one_ingrediant;
max_calorie_from_one_ingrediant = (0.25*minimum_calorie_needed);


%constraints

% we consider each ingrediant as a primitive food element, so our result should contain each of them - at least one unit ...
constraint forall(i in OBJ)(calorie_result[i] > 0);

% we dont want excessive of one food, so maximum 25% of the entire need can be fulfiled by one ingrediant
constraint forall(i in OBJ)(calorie_ingrediants_price_per_unit[i] * calorie_result[i] <= max_calorie_from_one_ingrediant);

% our resultant calorie chart should be bounded between the thresholds we have defined 
constraint sum(i in OBJ)(calorie_ingrediants_offered_calories_per_unit[i] * calorie_result[i]) >= lower_threshold_for_minimum_calorie_needed ;
constraint sum(i in OBJ)(calorie_ingrediants_offered_calories_per_unit[i] * calorie_result[i]) <= upper_threshold_for_minimum_calorie_needed ;
solve minimize sum(i in OBJ)(calorie_ingrediants_price_per_unit[i] * calorie_result[i]) ;

% the amount of each ingrediant should be available in our storage
constraint forall(i in OBJ)(calorie_result[i] <= calorie_ingrediants_availability_per_unit[i]);


% output -> combination of ingrediants to satisfy the Calorie Needed for the Family ...
output ["Minimum Calorie Needed : ", show(minimum_calorie_needed), "\n", "Calorie Ingrediants Needed : ", show(calorie_result), "\n"];