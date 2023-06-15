%% This progam is to sample data points for semi-supervised learning

function [Xtest, Ytest, Sim, n, p] = semiSupervisionMultiSim(X, Y, ratio)

%%%%%%%%%% Input %%%%%%%%%%%%%%%
% X: data matrix
% Y: class label
% ratio: the ratio for semi-supervised data points

%%%%%%%%% Output %%%%%%%%%%%%%%% 
% Xtest: the scattered data matrix
% Ytest: the scattered class label
% Sim: semi-supervision similarity matrix  
% n: the number of samples for semi-supervised learning

N = length(Y); % the number of data points
p = randperm(N); % Scatter all data points
n = floor(N*ratio); % The number of sampled data points

% Return the scattered test data and test class label
view_num = length(X);
Xtest = cell(1,view_num);
for jj = 1:view_num
    Xtest{jj} = X{jj}(p, :);
end 
Ytest = Y(p);

% Evaluate the mean similiar matrix in an unsupervised mode
Sim = MultiviewSimilarity(Xtest);

% Produce a symmetric matrix
L = zeros(n,n);
for ii = 1:n
    for jj = 1:n
        if abs(Ytest(ii)-Ytest(jj)) < 0.1
            L(ii, jj) = 1;
        end
    end
end
% Revise each view
for v = 1:length(X)
    Sim{v}(1:n, 1:n) = L;
end

% Normalization
for v = 1:length(X)
    %D = diag(1./sqrt(sum(Sim{v}, 2)+1e-8));
    %Sim{v} = D * Sim{v} * D;
    %Sim{v} = eye(size(Sim{v})) - Sim{v};
    
    % Normalize Similarity matrix using stationary distribution 
    D = diag(1./sqrt(sum(Sim{v}, 2)+1e-8));
    Sim{v} = eye(size(Sim{v})) - D * Sim{v} * D;
    
%     [pi,~] = eigs(Sim{v}',1);
%     Dist = pi/sum(pi);
%     pi = diag(Dist);
%     Sim{v} = eye(size(Sim{v})) - (pi^0.5*Sim{v}*pi^-0.5 + pi^-0.5*Sim{v}'*pi^0.5)/2;
end

end