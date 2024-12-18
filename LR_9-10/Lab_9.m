% x = (2 : 0.1 : 8);
% y = gaussmf(x, [1 5]);
% plot(x, y)

x = 0 : 0.1 : 11;
x1 = (3 : 0.1 : 11);
x2 = (3 : 0.1 : 11);
[X, Y] = meshgrid(x1, x2);
Z = min(gaussmf(X, [1 7]), gaussmf(Y, [1 7]));
% Z = max(0.5 * gaussmf(x, [1 7]), 0.5 * gaussmf(x, [1 7]));
plot3(X,Y,Z);
% x3 = defuzz(x, Z, 'centroid');
% h3.Color = gray;
% t3.Color = gray;
% h = line([x3 x3], [0.2 0.6], 'Color', 'k');
% t = text(x3, 0.2, 'centroid', 'FontWeight','bold');
% fprintf("Результат дефаззификации: ");
% disp(x3);