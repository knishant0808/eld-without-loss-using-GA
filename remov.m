function temp_data = remov(temp_data,idx)
temp_data = [temp_data(1:idx,:); temp_data(idx+1, end)];
end

