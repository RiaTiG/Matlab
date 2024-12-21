min_val = -1;
max_val = 1;
num_points = 10;

x1 = linspace(min_val, max_val, num_points);
x2 = linspace(min_val, max_val, num_points);

[X1, X2] = meshgrid(x1, x2);

Y = (X1 - 2)^2 + (1 - X2^2);
% dlmwrite('training_data.dat', [X1(:), X2(:), Y(:)], 'delimiter', '\t');

% Строим поверхность
figure('Name', 'Теоретическая функция');
surf(X1, X2, Y);
xlabel('X_1');
ylabel('X_2');
zlabel('f(X_1, X_2)');
title('Теоретическая функция f(x1, x2) = (X1 - 2)^2 + (1 - X2^2)');
colorbar;


X = [X1(:), X2(:)];
y_true = Y(:);
disp(y_true);