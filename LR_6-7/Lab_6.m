rank = [1,2,3,4,5,6];
l = length(rank);

% Матрица парных сравнений для мощности
power_m = [1, 5, 5, 1/2, 4, 1; 
        1/5, 1, 1, 1/6, 1/2, 1/5;
        1/5, 1, 1, 1/6, 1/2, 1/5;
        2, 6, 6, 1, 5, 2;
        1/4, 2, 2, 1/5, 1, 1/4;
        1, 5, 5, 1/2, 4, 1];

% Матрица парных сравнений для крутящего момента
momentum_m = [1, 1/5, 1/2, 1, 1/2, 2;
            5, 1, 3, 5, 3, 6;
            2, 1/3, 1, 2, 1, 3;
            1, 1/5, 1/2, 1, 1/2, 2;
            2, 1/3, 1, 2, 1, 3;
            1/2, 1/6, 1/3, 1/2, 1/3, 1];

% Матрица парных сравнений для массы (большая масса предпочтительнее)
mass_m = [1, 1/7, 1/2, 3, 1/2, 7;
          6, 1, 5, 7, 5, 9;
          2, 1/5, 1, 4, 1, 6;
          1/3, 1/7, 1/4, 1, 1/4, 3;
          2, 1/5, 1, 4, 1, 6;
          1/7, 1/9, 1/6, 1/3, 1/6, 1];

weights_power = calculate_weights(power_m);
weights_momentum = calculate_weights(momentum_m);
weights_mass = calculate_weights(mass_m);

disp('Мощность:'); disp(weights_power);
disp('Крутящий момент:'); disp(weights_momentum);
disp('Масса:'); disp(weights_mass);

total = zeros(l, 1);
for i = 1 : l
    total(i) = ...
        weights_power(i) + ... 
        weights_momentum(i) + ... 
        weights_mass(i);
end

disp("Оценка двигателей:"); 
disp(total);

[max_, best] = max(total);
fprintf('Оптимальный вариант: Двигатель %d с весом: %.4f\n', best, max_);

figure;
bar(total);
xlabel('Варианты двигателей');
ylabel('Итоговый вес');
title('Итоговые веса вариантов двигателей');
xticklabels({'Двигатель 1', 'Двигатель 2', 'Двигатель 3', 'Двигатель 4', 'Двигатель 5', 'Двигатель 6'});
grid on;

% Функция для вычисления весов из матрицы парных сравнений
function [normalized_weights] = calculate_weights(matrix)
    l = size(matrix, 1);
    row_products = prod(matrix, 2);
    row_n_products = nthroot(row_products, l);
    total_sum = sum(row_n_products);
    normalized_weights = row_n_products / total_sum;
end