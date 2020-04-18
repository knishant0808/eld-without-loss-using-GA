function pop_data = sort_data(pop_data, chrom_size)
[~, I] = sort(pop_data(:, chrom_size+2), 'descend');    %Sorting based on fitness in decreasing order
                                                        %Getting the index of elements
pop_data = pop_data(I, :);      
end

