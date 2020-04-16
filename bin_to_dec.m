function dec_value = bin_to_dec(pop_data)
multiplier = [8 4 2 1 2^-1 2^-2 2^-3 2^-4 2^-5 2^-6 2^-7 2^-8];
dec_value = sum(pop_data.*multiplier, 1);
end

