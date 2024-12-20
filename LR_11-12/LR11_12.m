% Построение графика функций y = x1^2 + x2^2 + 13 * x1 * x2
% в области x1 - [-2, 2] и x2 - [-2, 2]

n = 5;  
x1 = 1 : 1 : 5;
x2 = 1 : 1 : 5;
y = zeros(n, n);
s = 0;
Input = zeros(2, 25);
Target = zeros(1, 25);
for j = 1 : n
   for i = 1 : n
       y(j, i) = (x1(j)^2 - 3) + (x2(i)^2 - 3) + (13 * x1(j) * x2(i) - 3);
       s = s + 1;
       Input(1, s) = x1(j) - 3;
       Input(2, s) = x2(i) - 3;
       Target(1, s) = (x1(j)^2 - 3) + (x2(i)^2 - 3) + (13 * x1(j) * x2(i) - 3);
   end
end
Input
Target
surf(x1, x2, y)
xlabel('x1')
ylabel('x2')
zlabel('y')
title('Target function: y = x1^2 + x2^2 + 13*x1*x2')

Target = [6 22 40 60 82 22 51 82 115 150 40 82 126 172 220 60 115 172 231 292 82 150 220 292 366]
Output = [6 22 40 60 37.5714 22 61.2475 82 115 150 50.8526 82 126 172 191.9485 55.4531 115 172 231 317.8585 82 150 227.7388 292.2271 366]

s1 = 0;
s2 = 0;
for (i = 1 : 25)
   s1 = s1 + ((Target(i) - Output(i))^2);
   s2 = s2 + (Target(i)^2);
end
s1 = s1^(1 / 2);
d = s1 / (s2^(1 / 2));
disp("Погрешность: ") 
disp(d) 