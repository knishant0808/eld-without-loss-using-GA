function pop_data = sort_data(pop_data, chrom_size)
[~, I] = sort(pop_data(:, chrom_size+2), 'descend');  %Sorting based on fitness in increasing order
                                           %Getting the index of elements
                                           %of the sorted array
pop_data = pop_data(I, :);      
end

