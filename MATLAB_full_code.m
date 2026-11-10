%% 1. Cubic Spline Polynomial Coefficient Extraction (Pages 2, 11-12)[cite: 2, 11, 12]
% Define the x and y coordinates
x = [0, 2, 4, 6, 8];[cite: 2]
y = [748, 1384, 1148, 545, 1773];[cite: 2]

% Fit the cubic spline
pp = spline(x, y);[cite: 2]

% Extract break points and coefficients
breaks = pp.breaks;[cite: 2, 11]
coefs = pp.coefs;[cite: 2, 11]

% Display the polynomial equations for each segment
numSegments = size(coefs, 1);[cite: 2, 11]
for i = 1:numSegments[cite: 2, 11]
    fprintf('Segment %d (from x=%.2f to x=%.2f):\n', i, breaks(i), breaks(i+1));[cite: 2, 11]
    fprintf('  y = %.4f*(x-%.2f)^3 + %.4f*(x-%.2f)^2 + %.4f*(x-%.2f) + %.4f\n', ...[cite: 2, 12]
        coefs(i, 1), breaks(i), coefs(i, 2), breaks(i), coefs(i, 3), breaks(i), coefs(i, 4));[cite: 2, 12]
    fprintf('\n');[cite: 2, 12]
end


%% 2. Cubic Spline Interpolation & Plotting (Page 4)[cite: 4]
x = [0, 2, 4, 6, 8];[cite: 4]
y = [748, 1384, 1148, 545, 1773];[cite: 4]

% Generate a finer grid for the spline interpolation
x_fine = linspace(min(x), max(x), 100);[cite: 4]

% Perform cubic spline interpolation
y_spline = spline(x, y, x_fine);[cite: 4]

% Plot the original data points
figure;[cite: 4]
plot(x, y, 'o', 'MarkerSize', 8, 'DisplayName', 'Data Points');[cite: 4]
hold on;[cite: 4]
grid on;[cite: 4]

% Plot the cubic spline interpolation
plot(x_fine, y_spline, 'r-', 'LineWidth', 1, 'DisplayName', 'Cubic Spline');[cite: 4]
hold on;[cite: 4]
plot(x, y, 'b.:')[cite: 4]
hold on[cite: 4]

% Add labels and legend
xlabel('Years');[cite: 4]
ylabel('Number of Dengue cases');[cite: 4]
title('Cubic Spline Interpolation');[cite: 4]
legend('Cubic Spline', 'Actual');[cite: 4]


%% 3. All Interpolation Methods Combined Plot (Pages 6-7)[cite: 6, 7]
x = [0, 2, 4, 6, 8];[cite: 6]
y = [748, 1384, 1148, 545, 1773];[cite: 6]

% Fit the cubic spline
pp = spline(x, y);[cite: 6]

% Define a finer set of x values for plotting the spline
x_fine = linspace(min(x), max(x), 100);[cite: 6]

% Evaluate the spline at the finer set of x values
y_fine = ppval(pp, x_fine);[cite: 6]

% Plot the cubic spline
figure;[cite: 6]
plot(x_fine, y_fine, 'b', 'LineWidth', 1);[cite: 6]
hold on;[cite: 6]

% Actual data plot
x1 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];[cite: 6]
y1 = [748, 459, 1384, 6331, 1148, 4054, 545, 600, 1773, 544];[cite: 6]
plot(x1, y1, 'g')[cite: 6]
hold on;[cite: 6]

% Lagrange & Newton polynomial plot
L1 = @(x) 4.4089*x.^4 - 42.3854*x.^3 + 21.8646*x.^2 + 408.5417*x + 748;[cite: 6]
fplot(L1, [0, 9], 'r')[cite: 6]
hold on;[cite: 6]
grid on;[cite: 6]

% Least squares linear fit plot
y2 = @(x) 1758.6 - 33.3636*x; 
fplot(y2, [0, 8], 'k')[cite: 6]

% Add labels, title, and legend
xlabel('Year');[cite: 6]
ylabel('Number of Dengue cases');[cite: 6]
title('All Interpolation methods');[cite: 6]
legend('Cubic spline', 'Actual', 'Lagrange & Newtons', 'Least square method')[cite: 7]


%% 4. Newton's Divided Difference Interpolation (Page 7)[cite: 7]
x = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];[cite: 7]
y = [748, 459, 1384, 6331, 1148, 4054, 545, 600, 1773, 544];[cite: 7]

figure;
plot(x, y, 'b.:')[cite: 7]
hold on;[cite: 7]
grid on;[cite: 7]

N = @(x) 4.4089*x.^4 - 42.3854*x.^3 + 21.8646*x.^2 + 408.5417*x + 748;[cite: 7]
fplot(N, [0, 9], 'r')[cite: 7]

xlabel('Year')[cite: 8]
ylabel('No.of dengue cases')[cite: 8]
title('Newtons Divided Difference Interpolation')[cite: 8]
legend('Actual', 'Newton Method')[cite: 8]


%% 5. Least Square Approximation (Page 8)[cite: 8]
x1 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];[cite: 8]
y1 = [748, 459, 1384, 6331, 1148, 4054, 545, 600, 1773, 544];[cite: 8]

figure;
y2 = 1758.6 - 33.3636*x1;[cite: 8]
plot(x1, y2, 'k.-')[cite: 8]
hold on;[cite: 8]
grid on;[cite: 8]

plot(x1, y1, 'b.:')[cite: 8]

xlabel('Year');[cite: 9]
ylabel('No. of Dengue Cases');[cite: 9]
title('Least Square Approximation');[cite: 9]
legend('least square', 'Actual');[cite: 9]


%% 6. Lagrange Interpolation Polynomial (Pages 9-10)[cite: 9, 10]
x = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];[cite: 9]
y = [748, 459, 1384, 6331, 1148, 4054, 545, 600, 1773, 544];[cite: 9]

figure;
plot(x, y, 'b.:')[cite: 9]
hold on;[cite: 9]
grid on;[cite: 9]

L = @(x) 4.4089*x.^4 - 42.3854*x.^3 + 21.8646*x.^2 + 408.5417*x + 748;[cite: 9]
fplot(L, [0, 9], 'r')[cite: 10]

xlabel('Year')[cite: 10]
ylabel('No.of dengue cases')[cite: 10]
title('Lagrange Interpolation polynomial')[cite: 10]
legend('Actual', 'Lagrange')[cite: 10]


%% 7. Lagrange Missing Values Point Evaluation (Page 10)[cite: 10]
x = [0, 2, 4, 6, 8];[cite: 10]
y = [748, 1384, 1148, 545, 1773];[cite: 10]
n = length(x) - 1;[cite: 10]
xp = 3;[cite: 10]
sm = 0;[cite: 10]

for i = 1:n+1[cite: 10]
    pr = 1;[cite: 10]
    for j = 1:n+1[cite: 10]
        if j ~= i[cite: 10]
            pr = pr * (xp - x(j)) / (x(i) - x(j));[cite: 10]
        end[cite: 10]
    end[cite: 10]
    sm = sm + y(i) * pr;[cite: 10]
end[cite: 10]
yp = sm[cite: 10]


%% 8. Lagrange Symbolic Polynomial Generation (Pages 10-11)[cite: 10, 11]
syms x[cite: 10]
xx = [0, 2, 4, 6, 8];[cite: 10]
y = [748, 1384, 1148, 545, 1773];[cite: 10]
L2 = [];[cite: 10]

for i = 1:length(xx)[cite: 10]
    LL = [];[cite: 10]
    for j = 1:length(xx)[cite: 10]
        if j ~= i[cite: 10]
            L = (x - xx(j)) / (xx(i) - xx(j));[cite: 10]
            LL = [LL, L];[cite: 10]
        end[cite: 10]
    end[cite: 10]
    L1 = prod(LL) * y(i);[cite: 10]
    L2 = [L2, L1];[cite: 10]
end[cite: 10]

pol = simplify(sum(L2))[cite: 11]
vpa(pol)[cite: 11]


%% 9. Lagrange Plot (Page 11)[cite: 11]
x = [2, 5, 8, 11, 14];[cite: 11]
y = [2837, 1729, 3130, 4036, 3022];[cite: 11]

figure;
plot(x, y, 'r')[cite: 11]
hold on;[cite: 11]

L1 = @(x) 10.586*x + 2787.2;[cite: 11]
fplot(L1, [2, 14], 'b')[cite: 11]
hold on;[cite: 11]

L2 = @(x) 0.8122*x.^4 - 39.66*x.^3 + 605.17*x.^2 - 3023.58*x + 7167.79;[cite: 11]
fplot(L2, [2, 14], 'g')[cite: 11]

xlabel('year')[cite: 11]
ylabel('no.of dengue cases')[cite: 11]
title('Lagrange Interpolation')[cite: 11]
legend('Actual', 'Approximation 1', 'Approximation 2')[cite: 11]


%% 10. Cubic Plot (Page 12)[cite: 12]
x = [0, 2, 4, 6, 8];[cite: 12]
y = [748, 1384, 1148, 545, 1773];[cite: 12]

pp = spline(x, y);[cite: 12]
x_fine = linspace(min(x), max(x), 100);[cite: 12]
y_fine = ppval(pp, x_fine);[cite: 12]

figure;[cite: 12]
plot(x, y, 'o', 'MarkerSize', 8, 'MarkerFaceColor', 'r');[cite: 12]
hold on;[cite: 12]
plot(x_fine, y_fine, 'b', 'LineWidth', 1.5);[cite: 12]
hold on;[cite: 12]

x1 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];[cite: 12]
y1 = [748, 459, 1384, 6331, 1148, 4054, 545, 600, 1773, 544];[cite: 12]
plot(x1, y1, 'g')[cite: 12]

xlabel('x');[cite: 12]
ylabel('y');[cite: 12]
title('Cubic Spline Interpolation');[cite: 12]


%% 11. Combine Plot (Pages 12-13)[cite: 12, 13]
x = [1, 3, 5, 7, 9];[cite: 12]
y = [223, 3244, 333, 170, 137];[cite: 12]

pp = spline(x, y);[cite: 13]
x_fine = linspace(min(x), max(x), 100);[cite: 13]
y_fine = ppval(pp, x_fine);[cite: 13]

figure;[cite: 13]
plot(x, y, 'o', 'MarkerSize', 11, 'MarkerFaceColor', 'r');[cite: 13]
hold on;[cite: 13]
plot(x_fine, y_fine, 'b', 'LineWidth', 1.5);[cite: 13]
hold on;[cite: 13]

x1 = [0, 2, 4, 6, 8];[cite: 13]
y1 = [313, 475, 854, 0, 540];[cite: 13]
plot(x1, y1, 'g')[cite: 13]
hold on;[cite: 13]

L1 = @(x) -24.4219*x.^4 + 651.5833*x.^3 - 4899.2813*x.^2 + 13813.9167*x - 9313.7969;[cite: 13]
fplot(L1, [0, 9], 'r')[cite: 13]
hold on;[cite: 13]

y2 = @(x) 628.9 - 33.7667*x;[cite: 13]
fplot(y2, [0, 9], 'k')[cite: 13]

xlabel('x');[cite: 13]
ylabel('y');[cite: 13]
title('Cubic Spline Interpolation');[cite: 13]