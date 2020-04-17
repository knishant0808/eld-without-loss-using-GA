function selected_pop = elitism(temp_data, e_prob)
num = e_prob*size(temp_data, 1);
selected_pop = temp_data(1:num,:);
end

