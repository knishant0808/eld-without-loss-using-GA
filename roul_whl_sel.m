function [selection, idx] = roul_whl_sel(temp_data)
num = rand;
for i = 1:size(temp_data, 1)
    if((num >= temp_data(i, 18) & (num < temp_data(i, 19))))
        idx = i;
        selection = temp_data(i, :);
        break;
    end
end
end

