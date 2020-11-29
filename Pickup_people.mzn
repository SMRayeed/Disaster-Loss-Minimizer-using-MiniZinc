include "globals.mzn";


int: stations ;
set of int: WAITING = 1..stations;
array[WAITING] of int: people_waiting;

int: capacity ;
array[WAITING] of int: stations_priority;
array[WAITING] of var int: people_picked;


%constraints

% At least 20% people from each station should be picked up, irrespective of their priority
constraint forall(i in WAITING)(people_picked[i] >= (people_waiting[i]/5));

constraint forall(i in WAITING)(people_picked[i] <= people_waiting[i]);

constraint sum(i in WAITING)(people_picked[i]) <= capacity ;

solve maximize sum(i in WAITING)(people_picked[i] * stations_priority[i]) ;


output ["People Picked from Stations : ", show(people_picked), "\n"];