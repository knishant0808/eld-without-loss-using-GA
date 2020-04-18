function temp_data = remov(temp_data,idx, chrom_size)
temp_data = [temp_data(1:idx-1,:); temp_data(idx+1:end,:)];     %Removing idx from temp_data
temp_data = sort_data(temp_data, chrom_size);                   %Sorting temp_data
[prob, pos_start, pos_end] = prob_pos(temp_data, chrom_size);   %New probability and position on roulette wheel
temp_data(:, chrom_size+5) = prob;                              %Assigning new probability
temp_data(:, chrom_size+6) = pos_start;                         %Assigning new start position on roulette wheel
temp_data(:, chrom_size+7) = pos_end;                           %Assigning new end position on roulette wheel
end

