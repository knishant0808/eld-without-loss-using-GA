function [pop_data,temp_data] = crossover(temp_data,c_prob, chrom_size)
n_selection = length(temp_data, 1)*c_prob;
for l = 1:n_selection
    [parent1, idx1] = roul_whl_sel(temp_data);
    temp_data = remov(temp_data, idx1);
    [parent2, idx2] = roul_whl_sel(temp_data);
    temp_data = remov(temp_data, idx2);
    
    crossover_point = randi(chrom_size);
    
    child1 = [parent1(1:crossover_point) parent2(crossover_point:8);
    child2 = [parent2(1:crossover_point) parent1(crossover_point:8);
    
    
end
