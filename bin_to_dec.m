function dec_value = bin_to_dec(pop_data)
multiplier = [2^-8 2^-7 2^-6 2^-5 2^-4 2^-3 2^-2 2^-1 1 2 4 8];
dec_value = sum(pop_data.*multiplier, 1);
end

