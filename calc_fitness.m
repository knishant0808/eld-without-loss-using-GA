function [fitness, error, cost] = calc_fitness(pop_data, cons)
lambda = pop_data(:, 9);
for i = 1;length(lambda)
    if lambda(i) < cons.lambda_min
        lambda(i) = cons.lambda_min;
    elseif lambda(i) > cons.lambda_max
        lambda(i) = cons.lambda_max;
    end
end
power_gen = (lambda - cons.B)./(2*cons.A);
tot_power = sum(power_gen, 1);
error = abs(cons.Pd - tot_power);
fitness = 1/(1 + error);
cost = sum((power_gen.^2).*cons.A + (power_gen.*cons.B), 2);
end

