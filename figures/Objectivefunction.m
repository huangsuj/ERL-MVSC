%% Draw figures of multi-view semi-supervised classification 
%  of all compared methods

% Code author: Aiping Huang
% Email: sxxhap@163.com
% DateL July 28, 2020.

% DataSets: ALOI Caltech101-all HW MNIST Youtube 3sources BBC4view_685 BBCsports
%% ALOI
load ALOI-convergence.mat

%% Caltech101
%load caltech101_convergence.mat
 
 %% HW 
%load HW_convergence.mat
 
  %% BBCnews
 %load BBCnews_convergence.mat
  
  hold on
x = 1:40;
h = plot(x, obj(1:40), '-s', 'linewidth', 2);
box on
grid on
colormap(hsv)
xlabel('The number of iterations')
ylabel('Objective function value')