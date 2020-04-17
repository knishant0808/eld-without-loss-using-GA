function pop_data = sort_data(pop_data)
[~, I] = sort(pop_data(:, 14));  %Sorting based on fitness in increasing order
                                           %Getting the index of elements
                                           %of the sorted array
pop_data = pop_data(I, :);      
end

