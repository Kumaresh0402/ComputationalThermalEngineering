%% Error calculating based on forward and central difference methods

%clear all;
close all;

% Create 1D grid.
delx = 0.1;
x = [0:delx:1]';
rho = x.^3; % rho = x^3

% Get the length of the array.
n = length(x);

plot(x, rho, '-ob', 'linewidth', 2);
xlabel('x');
ylabel('\rho=x^3');
box on;
set(gca, "linewidth", 2, "fontsize", 16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% First order derivative.

rho_prime = 3*x.^2; % Analytical expression for derivative.

% Estimate gradients numerically using forward and central difference schemes.
rho_prime_forward = zeros(size(rho));
rho_prime_central_difference = zeros(size(rho));

rho_prime_forward(1, 1) = (rho(2, 1) - rho(1, 1)) / (rho(2, 1) - rho(1, 1));
rho_prime_forward(n, 1) = (rho(n, 1) - rho(n-1, 1)) / (rho(n, 1) - rho(n-1, 1));

rho_prime_central_difference(1, 1) = (rho(2, 1) - rho(1, 1)) / (rho(2, 1) - rho(1, 1));
rho_prime_central_difference(n, 1) = (rho(n, 1) - rho(n-1, 1)) / (rho(n, 1) - rho(n-1, 1));

for i = 2 : length(rho)-1
  rho_prime_forward(i, 1) = %Fill First order forward difference approximation here%
  rho_prime_central_difference(i, 1) = %Fill Second order central difference approximation here%
end

% Compute error.
err_l1_forward = sum(abs(rho_prime_forward(2:n-1) - rho_prime(2:n-1)))/(n-2);
err_l1_central = sum(abs(rho_prime_central_difference(2:n-1) - rho_prime(2:n-1)))/(n-2);

% Plot comparisons between analytical and numerical values for gradients.
figure(2);
hold on;
plot(x(2:n-1), rho_prime(2:n-1), '-b', 'linewidth', 2);
plot(x(2:n-1), rho_prime_forward(2:n-1), 'om', 'linewidth', 2);
plot(x(2:n-1), rho_prime_central_difference(2:n-1), '--or', 'linewidth', 2);
legend('Analytical', 'Forward difference', 'Central difference',  'location', 'northwest');
hold on;
xlabel('x');
ylabel('d\rho/dx=3x^2');
box on;
set(gca, "linewidth", 2, "fontsize", 16)
hold off;

