function [selected_pop, temp_data] = mutate(temp_data,m_prob, chrom_size)
selected_pop = [];
n_selection = length(temp_data, 1)*m_prob;
for i = 1:n_selection
    [parent, idx] = roul_whl_sel(temp_data);
    temp_data = remov(temp_data, idx);
    
    mutation_point = randi(chrom_size);
    
    child = parent;
    child(mutation_point) = 1 - parent(mutation_point);
    
    selected_pop = [selected_pop; child];
end
end

