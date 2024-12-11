cars = {'BMW', 'ВАЗ', 'Yotota', 'ChinMin', 'Tesla', 'Sanni'};
l = length(cars);

%Цена (а таки дешевле есть?)
value_m = [1, 3, 6, 4, 2, 5;
          1/3, 1, 1/3, 5, 1/2, 1/2; 
          1/6, 3, 1, 6, 1/4, 1/2;  
          1/4, 1/5, 1/6, 1, 1/2, 1/3; 
          1/2, 2, 4, 2, 1, 5; 
          1/5, 2, 2, 3, 1/5, 1];

%Масса автомобиля (внедорожник, чем выше масса, тем лучше проходимость)
mass_m = [1, 1/7, 1/2, 3, 1/2, 7;
          6, 1, 5, 7, 5, 9;
          2, 1/5, 1, 4, 1, 6;
          1/3, 1/7, 1/4, 1, 1/4, 3;
          2, 1/5, 1, 4, 1, 6;
          1/7, 1/9, 1/6, 1/3, 1/6, 1];

%Безопасность - это главное!
surv_m = [1, 2, 3, 2, 1, 3;
         1/2, 1, 1/3, 1/2, 1/4, 1/3; 
         1/3, 3, 1, 2, 1/5, 1/2;  
         1/2, 2, 1/2, 1, 1/2, 1/3; 
         1, 4, 5, 2, 1, 5; 
         1/3, 3, 2, 3, 1/5, 1];

%Мощность двигателя (как ни странно, но чем больше - тем лучше)
power_m = [1, 5, 5, 1/2, 4, 1; 
        1/5, 1, 1, 1/6, 1/2, 1/5;
        1/5, 1, 1, 1/6, 1/2, 1/5;
        2, 6, 6, 1, 5, 2;
        1/4, 2, 2, 1/5, 1, 1/4;
        1, 5, 5, 1/2, 4, 1];

%Высота колес в см (ну тут уже вкусовщина, но как по мне, чем выше тем
%круче)
height_kolesa_m = [1, 1/5, 1/2, 1, 1/2, 2;
                5, 1, 3, 5, 3, 6;
                2, 1/3, 1, 2, 1, 3;
                1, 1/5, 1/2, 1, 1/2, 2;
                2, 1/3, 1, 2, 1, 3;
                1/2, 1/6, 1/3, 1/2, 1/3, 1];

%Расход топлива (чем ниже тем экономнее, то есть лучше)
fuel_m = [1, 3, 4, 2, 2, 5;
         1/3, 1, 1/2, 1/4, 1/2, 1/3; 
         1/4, 2, 1, 1/3, 1/2, 1/2;  
         1/2, 4, 3, 1, 1, 2; 
         1/2, 2, 2, 1, 1, 4; 
         1/5, 3, 2, 1/2, 1/4, 1];

weights_value = calculate_weights(value_m);
weights_mass = calculate_weights(mass_m);
weights_surv = calculate_weights(surv_m);
weights_power = calculate_weights(power_m);
weights_height_kolesa = calculate_weights(height_kolesa_m);
weights_fuel = calculate_weights(fuel_m);

disp('Цена:'); disp(weights_value);
disp('Масса авто:'); disp(weights_mass);
disp('Безопасность:'); disp(weights_surv);
disp('Мощность двигателя:'); disp(weights_power);
disp('Высота колес:'); disp(weights_height_kolesa);
disp('Расход топлива:'); disp(weights_fuel);

total = zeros(l, 1);
for i = 1:l
    total(i) = weights_mass(i) + ...
                       weights_surv(i) + ...
                       weights_power(i) - ...
                       weights_value(i) + ...
                       weights_height_kolesa(i) + ...
                       weights_fuel(i);
end

norm_total = total / sum(total);

[max_, best] = max(norm_total);

% Вывод результата
fprintf('Оптимальная машина: %s с весом: %.4f\n', cars{best}, max_);

% Построение графика
figure;
bar(norm_total);
xlabel('Машины'); 
ylabel('Итоговый весс');
title('Итоговые оценки транспорта');
xticklabels(cars);
grid on;

function [norm] = calculate_weights(matrix)
    l = size(matrix, 1);
    row = prod(matrix, 2);
    row_n = nthroot(row, l);
    sum_ = sum(row_n);
    norm = row_n / sum_;
end