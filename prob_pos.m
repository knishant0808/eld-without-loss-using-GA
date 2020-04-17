function [prob, pos_start, pos_end] = prob_pos(pop_data,chrom_size)
tot_fitness = sum(pop_data(:, chrom_size+2));
prob = pop_data(:, chrom_size+2)/tot_fitness; %Calculating probability of outcome based on fitness

start = 0;
for k = 1:size(pop_data, 1);
    pos_start(k, 1) = start;
    pos_end(k, 1) = start + prob(k);
    start = pos_end(k, 1);
end
end