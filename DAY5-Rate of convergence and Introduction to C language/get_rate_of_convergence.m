%% Compute rate of convergence.

function roc = get_rate_of_convergence(err_array, dx_array)
  %roc = zeros(length(err_array)-1);

  for i = 1:length(err_array)-1
    %roc(i) = log(err_array(i)/err_array(i+1)) / log(dx_array(i)/dx_array(i+1));
    roc(i) = log(err_array(i+1)/err_array(i)) / log(dx_array(i+1)/dx_array(i));
  endfor
end
