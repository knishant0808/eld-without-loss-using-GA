clc;
clear all;
%==========================================================================
%ELD DATA AND CONSTRAINTS
cons.Pd = 500;                                  %Total power demand.
cons.A = [0.008 0.0075 0.0065];                 %A, B and C are fuel cost coefficient.
cons.B = [2 1.8 2.5];
cons.C = [1200 950 1320];
cons.P_min = [80 100 80];                       %Min power generation by the plants.
cons.P_max = [250 200 300];                     %Min power generation by the plants.
cons.lambda_min = max(2*cons.A*P_min + cons.B); %To find the minimum possible lambda value for generators
cons.lambda_max = min(2*cons.A*P_max + cons.B); %To find the maximum possible lambda value for generators
%==========================================================================
%GA INITIALIZATION
pop_size = 50;                                  %Population size of 50 chromosomes.
chrom_size = 8;                                 %Each chromosome has 4 genes. 4 genes for decimal values.
pop_data = [];                                  %This array contains decimal value of chromosome, fitness value, probbailty of selection
                                                %and position in roulette wheel.
child_pop = [];                                 %Child population at the end of every generation.
parent_pop = [];                                %Parent population at the start of every generation.
error_lim = 0.001;                              % 0.001% error in power demand.
                                                %To stop GA when this accuracy is achieved.

%Initialization of parent population.                    
parent_pop = round(rand(pop_size, chrom_size)); 
pop_data = [pop_data parent_pop];
%==========================================================================
%GA Parameters
param.c_prob = 0.2;                             %Crossover Probability
param.m_prob = 0.1;                             %Mutation Probability
param.e_prob = 0.06;                            %Elitism Probabilty
param.max_gen = 100;                            %Maximum number of generations
%==========================================================================
%GA Loop
for i = 1:param.max_gen
   
    %Binary to decimal
    dec_value = bin_to_dec(pop_data);
    %Appending decimal value to pop_data
    pop_data = [pop_data dec_value]; 
    
    %Calculating Fitness
    [fitness, error, cost] = calc_fitess(pop_data, cons);
    %Appending fitness, error and cost to pop_data
    pop_data = [pop_data fitness error cost];             
    
    %Sorting population based on fitness value in descending order
    pop_data = sort_data(pop_data);
    %Exiting loop if error is within acceptable limits
    if pop_data(1,11) <= error_lim
        break;
    end
    
    %Probabilty of selection and roulette wheel position
    [prob, pos_start, pos_end] = prob_pos(pop_data);
    %Appending probabilty, start and end position on roulette wheel
    pop_data = [pop_data prob pos_start pop_end];   
    
    temp_data = pop_data;
    
    %Elitism to retain the best chromosomes.
    selected_pop = elitism(temp_data, param.e_prob);
    pop_data = selected_pop;
    
    %Crossover based on roulette wheel selection
    [selected_pop, temp_data] = crossover(temp_data, param.c_prob, chrom_size);
    pop_data = [pop_data; selected_pop];
    
    %Mutation based on roulette wheel selection
    [selected_pop, temp_data] = mutate(temp_data, param.m_prob, chrom_size);
    pop_data = [pop_data; selected_pop; temp_data];
     
    %Check for accuracy in calculation
    child_pop = pop_data(:, 1:8);
    pop_data = child_pop;
end
%==========================================================================
lambda = bin_to_dec(pop_data(1,:);
pg1 = 
pg2 = 
pg3 = 
    