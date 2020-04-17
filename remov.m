function temp_data = remov(temp_data,idx, chrom_size)
temp_data = [temp_data(1:idx-1,:); temp_data(idx+1:end,:)];
temp_data = sort_data(temp_data, chrom_size);
[prob, pos_start, pos_end] = prob_pos(temp_data, chrom_size);
temp_data(:, chrom_size+5) = prob;
temp_data(:, chrom_size+6) = pos_start;
temp_data(:, chrom_size+7) = pos_end;
end

