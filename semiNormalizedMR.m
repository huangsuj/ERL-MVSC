%% This program is to implement multi-view semi-supervised 
%   classification

%%%%%%%%%%%%%%%%%%% Input %%%%%%%%%
% X: cell data for multiview data points
% Y: ground truth 
% ratio: the ratio for semi-supervised data points

%%%%%%%%%%%%%%%%%% Output %%%%%%%%%
% idx: the predictive class label

function [ACC, predLabel] = semiNormalizedMR(X, Y, ratio)

% Acquire required parameters from multi-view data
N = length(Y);                  %  Number of samples
classNum = length(unique(Y));   % Number of clusters

% Evaluate semi-supervised similarity matrix
[Xtest, Ytest, Sim, n] = semiSupervisionSim(X, Y, ratio);

% Regularization muub 
mu = 1e+0;
alpha = 1/(1+mu); % alpha = 1/(1+mu)

% Predict class by a closed-form solution f* = (D - alpha W) \ y;
H = full(sparse(1:N, Ytest, 1, N, classNum));
%Htest = [H(1:n,:); zeros(N-n, classNum)];
Htest = [H(1:n,:); ones(N-n, classNum)./classNum];

% Re-evaluate similarity using stationary distribution of Random Walk
[pi,~] = eigs(Sim',1);
Dist = pi/sum(pi);
pi = diag(Dist);
Sim = (pi^0.5*Sim*pi^-0.5+pi^-0.5*Sim'*pi^0.5)/2;

% CLosed form soultion
D = diag(sum(Sim));
predH = (D-alpha*Sim)\Htest;

% Return predictive class label
[~, predLabel] = max(predH, [], 2);
ACC = sum(predLabel == Ytest)/N;

% display the predictive performance
disp(['The predictive accuracy is: ', num2str(ACC)]);

end








