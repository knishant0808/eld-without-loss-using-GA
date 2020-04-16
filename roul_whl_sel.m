function [selection, idx] = roul_whl_sel(temp_data)
num = rand;
for i = 1:length(temp_data, 1)
    if((num >= temp_data(i, 14) & (num < temp_data(i, 15)))
        idx = i;
        selection = temp_data(i);
    end
end
end

