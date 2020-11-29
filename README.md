# Disaster-Loss-Minimizer-using-MiniZinc
A MiniZinc project based on optimization problem, done during the Artificial Intelligence course.

# Introduction
Disaster Loss Minimizer is an intelligent machine that will reduce the amount the loss during any kind of disaster. Geographically, we are in a region of disasters like – Flood, Cyclones etc. And whenever any disaster occurs, a huge number of people suffer – losing both shelter and belongings. They have to move leaving most of their belongings; also, during these disasters, many government and non-government organizations face a great loss. Our goal is to minimize the loss as much as possible – one way of that is to carry most valuable things as many as possible. Our agent will do exactly that, depending on capacity and the economical values of the things, it will suggest those things that are most valuable.

# Description
## Relief Supply
Analyzing the scenario, it is easy to depict that one of the problems during the disasters is – people have to move to a shelter for safety reasons and they cannot take
everything that belong to them. As a result, many valuable things wash away or get destroyed. Besides, there are few elementary things that are very much needed at that
time, like dry food and dry clothes; so, these things should be taken despite of having lesser economic values. Also, there are other things to consider as well – like capacity, preferences, type of belongings etc. What our machine will do is –
- It will take the list of accessories as input
- List will contain the number/weight and value of a particular thing
- It will also enlist the carriers as input – for example, a family has three young male who can carry 30kg each, 4 young female who can carry 15g each and 6 children who can carry 8kg each
- Now the preferences will be set as the constraints – which may vary from family to family.
- Ultimately, it will list the products those are most valuable, mostly preferred and within the upper-bound of capacity of the family, so that their loss is minimized.

# Objective & Goals
1. Help the rural & poor people: Our goal is to reduce the loss of the rural poor people who are affected mostly during the time of disasters. Implementing this type of
machine will be a great help for them – providing an optimal solution. Because of the lack of knowledge and due to have shortage of time, very often people panic and
cannot decide what to take and what not. So, this machine will be helpful for them. 
2. Save their money: Accessories are basically money in the form of an asset. So, saving the accessories means saving some money – which is very much crucial during the hazardous time. Saving anything valuable will be financially beneficial. 
3. Minimize govt. expense: Any type of disaster causes a huge expense for the government as well. Lots of govt. assets get hampered and as an aftermath, govt has
to spend millions. This minimizing agent will also be applicable for the govt. or no-govt. organizations – means it’ll reduce their loss as well.

# Related Articles 
Basically, this approach follows Knapsack algorithm but implemented in a greater aspect. So, before coming up with this idea, we have seen some of the basic cases of knapsack. Besides, there are some articles and papers that we have gone through before coming up with such an idea – 
1. Learning Automata-Based Solutions to the Nonlinear Fractional Knapsack Problem with Applications to Optimal Resource Allocation
2. Caste, Culture and Exclusion in India: A Study through Bio-informatics and Constrained Optimization

# Rationale behind the Idea
- Millions of people in our country suffer from a huge loss due to disasters which can be reduced using this optimal approach
- Million dollars are spent in this sector every year by our govt which also can be minimized
- NGO’s and Govt. organizations can save many of their necessary accessories by adopting this approach
- Financially adopting this approach is beneficial to the govt. as it reduces the expenses
- This approach is also beneficial to people as it saves their valuable belongings
- This approach can also be adopted while suppling goods to the affected people in shelters

# Expected Result
The expectation from our machine is to provide us such a result that will enlist all the accessories that are economically valuable, have higher preference and does not
exceed the capacity of that family. Needless to say, the result will vary from user to user and the input parameters and constraints changes.

# Methodology
Developing this machine is all about modelling. Being an intelligent machine, this loss-minimizer will do the calculation satisfying the constraints. This modelling part will be done in MiniZinc IDE. As soon as the modelling is done, the solver will provide the optimal solution based on the input and constraints.
