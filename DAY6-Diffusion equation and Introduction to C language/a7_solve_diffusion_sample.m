%% Solve diffusion equation.

clear all;
close all;

% Create 1D grid.
dx = 0.05;
x = [0:dx:1]';

% Get the length of the array.
n = length(x);

alpha = 1;

% Time control.
t_initial = 0;
t_final = 0.05; %1e-4;
dt = 1e-3; % dx^2 / (2 * alpha);
%dt = 0.01; % dx^2 / (2 * alpha);
%dt = 0.1; % dx^2 / (2 * alpha);

r = alpha*dt / dx^2;

% Boundary conditions.
T_left = 300;
T_right = 273; % Dirichlet BC

T_initial = 350 * ones(n, 1);
T_numerical = T_initial;

% Set boundary conditions.
% left boundary condition
T_numerical(1, 1) = T_left;  %(i, 1) --> i = 1 % Dirichlet boundary condition

% Right boundary condition
T_numerical(n, 1) = T_right; %- Dirichlet bounday condition  %(n, 1) --> i = n
%T_numerical(n, 1) = T_numerical(n-1, 1); %% dT/dx = 0 (Neumann - adiabatic condition)

count = 1;  % at step 1
%count = 2;  % at step 2
% Solve diffusion equation.
for t = t_initial : dt : t_final
    % t = 0: 0.001: 0.05
  fprintf('Time: %.3e\n', t);
  T_old = T_numerical;
  for i = 2 : n-1
    T_numerical(i, 1) = T_old(i, 1) + dt * alpha * (T_old(i+1, 1) - 2*T_old(i, 1) + T_old(i-1, 1)) / dx^2;
  endfor

  % Plot u.
  close;
  figh = figure(1);
  hold on;
  plot(x, T_initial, '-r', 'linewidth', 2);
  plot(x, T_numerical, '-m', 'linewidth', 2);
  legend('Initial T', 'Numerical T', 'location', 'southwest');
  hold on;
  xlabel('x');
  ylabel('T(x, t)');
  box on;
  set(gca, "linewidth", 2, "fontsize", 20)
  hold off;

  fig_name = sprintf('./a7_diffusion_eq_images/%d.png', count);
  saveas(figh, fig_name);

  count = count + 1;

  pause(0.01);
end

