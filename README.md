# eld-without-loss-using-GA
Economic Load Dispatch using Genetic Algorithm
Every generator in power system has some constraints attached to its operation. To supply the power demand the generators are needed to operate in most cost efficient way.

Our system has three generators with minimum and maximum power constraints.
Cost equation of generation-
C1 = a1*Pg1^2 + b1*Pg1 + c1
C2 = a2*Pg2^2 + b2*Pg2 + c2
C3 = a3*Pg3^2 + b3*Pg3 + c3

Since, this is a constrained optimization problem. Use of lagrangian operator is required to convert it into an unconstrained problem.

The population size is 50 and the algorithm is ran over loop for 100 generations. 
The concept of elitism, crossover and mutation is employed and roulette wheel selection method is used for the survival of fittest genes in population.

pop_data = [chromosome 1-15] [dec_value 16] [fitness 17] [error 18] [cost 19] [prob 20] [roul_wheel_start 21] [roul_wheel_end 22]
