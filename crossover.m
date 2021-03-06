function [selected_pop, temp_data] = crossover(temp_data,c_prob, chrom_size)
%SINGLE POINT CROSSOVER
selected_pop = [];
n_selection = size(temp_data, 1)*c_prob;            
for l = 1:n_selection
    child1 = [];
    child2 = [];
    [parent1, idx1] = roul_whl_sel(temp_data, chrom_size);      %Selection of parent1 by Roulette Wheel Selection
    temp_data = remov(temp_data, idx1, chrom_size);             %Removal of parent1 for implementation of selection without replacement.
    [parent2, idx2] = roul_whl_sel(temp_data, chrom_size);      %Selection of parent2 by Roulette Wheel Selection
    temp_data = remov(temp_data, idx2, chrom_size);             %Removal of parent2 for implementation of selection without replacement.
    
    crossover_point = randi([1,chrom_size-1]);                  %Randomly choosing the crossover point for crossover.
    
    child1 = [parent1(:,1:crossover_point) parent2(:,crossover_point+1:chrom_size) parent1(:,chrom_size+1:end)];
    child2 = [parent2(:,1:crossover_point) parent1(:,crossover_point+1:chrom_size) parent2(:,chrom_size+1:end)];
    
    selected_pop = [selected_pop; child1; child2];
end

