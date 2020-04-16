function [prob, pos_start, pos_end] = prob_pos(pop_data)
tot_fitness = sum(pop_data(:, 10);
prob = pop_data(:, 10)/tot_fitness; %Calculating probability of outcome based on fitness

start = 0;
for k = 1:length(pop_data, 1);
    pos_start(k) = start;
    pos_end(k) = start + prob(k);
    start = pos_end(k);
end
end