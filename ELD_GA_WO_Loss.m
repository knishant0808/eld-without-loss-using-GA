clc;
clear all;
%==========================================================================
%ELD DATA AND CONSTRAINTS
cons.Pd = 555;                                          %Total power demand.
cons.A = [0.009 0.0085 0.0085];                         %A, B and C are fuel cost coefficient.
cons.B = [2.1 2.8 1.8];
cons.C = [1200 950 1320];
cons.P_min = [80 100 80];                               %Min power generation by the plants.
cons.P_max = [250 200 300];                             %Min power generation by the plants.
cons.lambda_min = max(2*cons.A.*cons.P_min + cons.B);   %To find the minimum possible lambda value for generators
cons.lambda_max = min(2*cons.A.*cons.P_max + cons.B);   %To find the maximum possible lambda value for generators
%==========================================================================
%GA INITIALIZATION
pop_size = 50;                                  %Population size of 50 chromosomes.
chrom_size = 15;                                %Each chromosome has 15 genes. 11 genes for decimal values.
pop_data = [];                                  %This array contains decimal value of chromosome, fitness value, probabilty of selection
                                                %and position in roulette wheel.
child_pop = [];                                 %Child population at the end of every generation.
parent_pop = [];                                %Parent population at the start of every generation.

%Initialization of parent population.                    
parent_pop = randi([0, 1],pop_size, chrom_size); 
pop_data = [pop_data parent_pop];
%==========================================================================
%GA Parameters
param.c_prob = 0.2;                             %Crossover Probability
param.m_prob = 0.1;                             %Mutation Probability
param.e_prob = 0.06;                            %Elitism Probabilty
param.max_gen = 50;                            %Maximum number of generations
%==========================================================================
%GA Loop
best_sol = [];
for i = 1:param.max_gen
   
    %Binary to decimal
    dec_value = bin_to_dec(pop_data, chrom_size);
    %Appending decimal value to pop_data
    pop_data = [pop_data dec_value]; 
    
    %Calculating Fitness
    [fitness, error, cost] = calc_fitness(pop_data, cons, chrom_size);
    %Appending fitness, error and cost to pop_data
    pop_data = [pop_data fitness error cost];             
    
    %Sorting population based on fitness value in descending order
    pop_data = sort_data(pop_data, chrom_size);
    
    %Probabilty of selection and roulette wheel position
    [prob, pos_start, pos_end] = prob_pos(pop_data, chrom_size);
    %Appending probabilty, start and end position on roulette wheel
    pop_data = [pop_data prob pos_start pos_end];   
    
    temp_data = pop_data;
    
    %Elitism to retain the best chromosomes.
    selected_pop = elitism(temp_data, param.e_prob);
    elite_pop = size(selected_pop, 1) + 1;
    pop_data = selected_pop;
    
    %Crossover based on roulette wheel selection
    [selected_pop, temp_data] = crossover(temp_data, param.c_prob, chrom_size);
    pop_data = [pop_data; selected_pop];
    
    %Mutation based on roulette wheel selection
    [selected_pop, temp_data] = mutate(temp_data, param.m_prob, chrom_size);
    temp_data = sort_data(temp_data, chrom_size);
    pop_data = [pop_data; selected_pop; temp_data(elite_pop:end, :)]; 
    
    best_sol = [best_sol; pop_data(1,:)];
    
    child_pop = pop_data(:, 1:chrom_size);
    pop_data = child_pop;
end
%==========================================================================
lambda = bin_to_dec(pop_data(1,:), chrom_size);
pg1 = (lambda - cons.B(1))./(2*cons.A(1));
disp('pg1 = ');
disp(pg1);
pg2 = (lambda - cons.B(2))./(2*cons.A(2));
disp('\npg2 = ');
disp(pg2);
pg3 = (lambda - cons.B(3))./(2*cons.A(3));
disp('\npg3 = ');
disp(pg3);
tot_power = pg1 + pg2 + pg3;
disp('\nTotal_power = ');
disp(tot_power);
    