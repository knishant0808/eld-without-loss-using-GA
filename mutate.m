function [selected_pop, temp_data] = mutate(temp_data,m_prob, chrom_size)
%SINGLE POINT MUTATION 
selected_pop = [];
n_selection = size(temp_data, 1)*m_prob;
for i = 1:n_selection
    [parent, idx] = roul_whl_sel(temp_data, chrom_size);    %Selection of parent by Roulette Wheel Selection.
    temp_data = remov(temp_data, idx, chrom_size);          %Removal of parent for implementation of selection without replacement.
    
    mutation_point = randi(chrom_size);                     %Randomly selecting mutation point.
    
    child = parent;
    child(mutation_point) = 1 - parent(mutation_point);     %Changing the value of mutation point from 0 to 1 and vice-versa.
    
    selected_pop = [selected_pop; child];                   %Appending the child into selected_pop
end
end

