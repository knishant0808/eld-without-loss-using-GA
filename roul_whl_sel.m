function [selection, idx] = roul_whl_sel(temp_data, chrom_size)
num = rand;
for i = 1:size(temp_data, 1)
    if((num >= temp_data(i, chrom_size+6) & (num < temp_data(i, chrom_size+7))))
        idx = i;
        selection = temp_data(i, :);
        break;
    end
end
end

