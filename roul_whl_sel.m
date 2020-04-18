function [selection, idx] = roul_whl_sel(temp_data, chrom_size)
num = rand;                                                                         %Random number between 0 and 1
for i = 1:size(temp_data, 1)
    if((num >= temp_data(i, chrom_size+6) & (num < temp_data(i, chrom_size+7))))    %Determining the position of random selected number
        idx = i;                                                                    %Index of the population selected
        selection = temp_data(i, :);                                                %Appending the selection.
        break;
    end
end
end

