function temp_data = remov(temp_data,idx)
temp_data = [temp_data(1:idx-1,:); temp_data(idx+1:end,:)];
temp_data = sort_data(temp_data);
[prob, pos_start, pos_end] = prob_pos(temp_data);
temp_data(:, 17) = prob;
temp_data(:, 18) = pos_start;
temp_data(:, 19) = pos_end;
end

