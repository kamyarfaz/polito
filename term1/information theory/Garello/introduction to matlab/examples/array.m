% Applied Signal Processing Laboratory
% This file contais some info on useful Matlab commands and features

%% initial commands
clc         % clear Command Window
clear       % clear variables in Workspace
close all   % close all open figures

disp("Accounting")

%% CASE 1

% 5 Items that can be bought m times
Items_qty = [2 5 1 9 8]
Items_price = [14 78 34 10 2]

% Compute the total amount
tot_amount = 0;
% for i = 1:length(Items_qty)
%    tot_amount = tot_amount+Items_qty(i)*Items_price(i);
% end
tot_amount = Items_qty*Items_price';

disp("Total amount is: "+tot_amount)

%% CASE 2

% Now suppose we have more than one customer, same shop
Items_qty = [2 5 1 9 8; 4 0 3 1 5; 0 2 2 6 1; 0 2 2 0 5]
Items_price = [14 78 34 10 2]

% Compute the total amount
tot_amount = zeros(1, size(Items_qty, 1));

% for i = 1:size(Items_qty, 1)
%     for j = 1:size(Items_qty, 2)
%         tot_amount(i) = tot_amount(i)+Items_qty(i, j)*Items_price(j);
%     end
%     disp("Total amount for customer "+i+" is: "+tot_amount(i))
% end

tot_amount = Items_qty*Items_price'

%% CASE 3

% Now suppose we have more than one customer, and each customer goes to a
% different shop (same products, but slightly different prices)
Items_qty = [2 5 1 9 8; 4 0 3 1 5; 0 2 2 6 1; 0 2 2 0 5]
% Items_qty = repmat([2 5 1 9 8], [4, 1])
Items_price = [14 78 34 10 2; 12 82 30 11 2; 15 79 28 14 1; 18 90 38 6 5]

% Compute the total amount
tot_amount = zeros(1, size(Items_qty, 1));

% for i = 1:size(Items_qty, 1)
%     for j = 1:size(Items_qty, 2)
%         tot_amount(i) = tot_amount(i)+Items_qty(i, j)*Items_price(j);
%     end
%     disp("Total amount for customer "+i+" is: "+tot_amount(i))
% end

tot_amount = Items_qty.*Items_price

%max(tot_amount,[], 'all')
max(tot_amount,[], 2)
%tot_amount = sum(tot_amount, 1)


