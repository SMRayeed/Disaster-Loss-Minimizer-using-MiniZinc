include "globals.mzn";

% determine combined load capacity of the vehicles

int: truck;
int: pickup;

int: people;

% determining maximum capacity of the vehicles combined
int: maximum_vehicle_capacity;
maximum_vehicle_capacity = (6300*truck)+(1500*pickup);
% these data are collected from the Internet


% no doubt, our first priority are the people -> avg. weight of people is considered 60 kg.
int: maximum_vehicle_goods_capacity;
maximum_vehicle_goods_capacity = maximum_vehicle_capacity - (people*60);


% determine the number of goods 
int: family_equipments;
set of int: OBJ = 1..family_equipments;

% defining an array to store the prices of these goods 
array[OBJ] of int: family_equipments_price_per_unit;

% defining an array to store the weights of these goods
array[OBJ] of int: family_equipments_weight_in_kg;

% defining an upper threshold of any single equipment
float: max_percentage_of_one_equipment;
max_percentage_of_one_equipment = (0.30*maximum_vehicle_goods_capacity);

% defining an array to set the priority of these goods 
array[OBJ] of int: family_equipments_priority;

% defining an array to store the results
array[OBJ] of var int: goods_carried_result;


%constraints

% each equipment should be either carried or not based on its weight, price & priority...
constraint forall(i in OBJ)(goods_carried_result[i] >= 0);

% we dont want excessive amount of one item, so maximum 30% of the entire capacity can be fulfiled by one item
constraint forall(i in OBJ)(family_equipments_price_per_unit[i] * goods_carried_result[i] <= max_percentage_of_one_equipment);

% we cant take any item more than available 
constraint forall(i in OBJ)(goods_carried_result[i] <= family_equipments_weight_in_kg[i]);

% our resultant calorie chart should be bounded between the thresholds we have defined 
constraint sum(i in OBJ)(family_equipments_weight_in_kg[i] * goods_carried_result[i]) <= maximum_vehicle_goods_capacity ;

solve maximize sum(i in OBJ)(family_equipments_price_per_unit[i] * goods_carried_result[i] * family_equipments_priority[i]) ;


% output -> combination of ingrediants to satisfy the Calorie Needed for the Family ...
output ["Maximum Capacity : ", show(maximum_vehicle_capacity), "\n", 
        "Maximum Capacity after Boarding People : ", show(maximum_vehicle_goods_capacity), "\n",
        "Equipemts Carriable : ", show(goods_carried_result), "\n"];