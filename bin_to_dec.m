function dec_value = bin_to_dec(pop_data, chrom_size)
multiplier = [8 4 2 1 2^-1 2^-2 2^-3 2^-4 2^-5 2^-6 2^-7 2^-8];
binary_data = pop_data(:, 1:chrom_size);
dec_value = binary_data*multiplier';
end

