%% Calibrate labour productivity from FRED data to match US GDP
% (https://fred.stlouisfed.org/series/OPHNFB)

% Load series
lab_prod = xlsread("OPHNFB.xls");
lab_prod = lab_prod(:,2);
restricted_lab_prod = lab_prod(200:307);

% Difference the data
Dlab_prod = diff(lab_prod);

% Fit an AR(1) process to the differenced data
%model1 = arima(1,1,0);
model2 = arima(1,0,0); % AR(1)

%estmodel1 = estimate(model1, lab_prod);
%estmodel2 = estimate(model2, lab_prod);

estmodel3 = estimate(model2, restricted_lab_prod);