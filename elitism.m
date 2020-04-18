function selected_pop = elitism(temp_data, e_prob)
%ELITISM - to get the best fitting population in the next generation.
num = e_prob*size(temp_data, 1);        %Getting best fitting population from temp_data. 
selected_pop = temp_data(1:num,:);      %Selecting best population for the next generation.
end

