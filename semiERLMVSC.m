%% Embedding regularizer learning for multi-view semi-supevised
%  classification

%%%%%%%%%%%%%%%%%%% Input %%%%%%%%%
% X: cell data for multiview data points
% Y: ground truth 
% ratio: the ratio for semi-supervised data points

%%%%%%%%%%%%%%%%%% Output %%%%%%%%%
% idx: the predictive class label

function [results, predLabel] = semiERLMVSC(X, gt, ratio)

% Acquire required parameters from multi-view data
N = length(gt);                  % Number of samples
V = length(X);                  % Number of views 
classNum = length(unique(gt));   % Number of clusters

% Evaluate semi-supervised similarity matrix
[Xtest, Ytest, Sim, n, p] = semiSupervisionMultiSim(X, gt, ratio);

% Intialize all weighted matrices
% alpha = 0.01;
% beta = 0.0001;
% gamma = 0.0001;
% delta = 1e+1;
alpha = 0.01;
beta = 0.01;
gamma = 0.001;
delta = 1e1;
lambda = ones(1,V)./V;
Ytest = double(Ytest);
Lall = full(sparse(1:N, Ytest, 1, N, classNum));
L = [Lall(1:n,:); zeros(N-n, classNum)];
%L = [Lall(1:n,:); ones(N-n, classNum)./classNum];
Y = L;
M = zeros(size(Sim{1}));
for v = 1:V
    M = M + Sim{v};
end
M = M./V;  
diagD = ones(N,1);
% DM = diag(1./sqrt(sum(M, 2)+1e-8));
% M = DM * M * DM; % Normalization

maxIter = 40;
obj = zeros(maxIter, 1);
weight = ones(maxIter,V)./V;
% LOOP
for ii = 1:maxIter
    % Update Y
    Y = (eye(N) + (beta/2*delta)*(M + M')) \ L;
    
    % Update M
    weightedOnes = sum(lambda.^alpha) * ones(N,1);
    tempInversion = diag(1./(weightedOnes+2*gamma*diagD));
    tempM = zeros(size(Sim{1}));
    for v = 1:V
        tempM = tempM + (lambda(v).^(alpha)) * Sim{v};
    end
    M = tempInversion * (tempM + 0.5*beta*(Y*Y'));
    
    % Update D
    diagD = 1./(2*sqrt(sum(M.*M, 2)));
    
    % Update lambda
    for v = 1:V
        lambda(v) = norm(M-Sim{v}, 'fro')^(-2/(alpha-1));
    end
    lambda = lambda/sum(lambda);
   % lambda = 1./ones(V,1);
    weight(ii,:)= lambda;
    % Compute the objective function value
    obj(ii) = 0;
    for v = 1:V
        obj(ii) = obj(ii) + 0.5*(lambda(v)^alpha)*norm(M-Sim{v}, 'fro')^2;
    end
    obj(ii) = obj(ii) + 0.5*beta*trace(Y'*M*Y) + gamma*L21Norm(M) ...
        + 0.5*delta*norm(Y-L, 'fro')^2;
    %disp(['The ', num2str(ii), '-th iteration was processed.'])
    
    % Adjust whether the loop is terminated. 
     if (ii >1) && (abs(obj(ii)-obj(ii-1)) < 1e-4) 
       break;
     end
    
end




% Return predicted class label
[~, predLabel] = max(Y, [], 2);
% rep = Y;
% Y_all = zeros(length(Y), 1);
% Y_rep_all = zeros(length(Y), classNum);
% Y_rep_all(p,:) =  rep;
% Y_all(p,:) =  predLabel;
% ACC = sum(predLabel(n+1:end) == Ytest(n+1:end))/(N-n);
% save('C:\Users\hsj\OneDrive\my_paper\HGCNNet_for_hsj\results\scatter\MNIST10k\ERL-MVC_label.mat', 'Ytest');
% save('C:\Users\hsj\OneDrive\my_paper\HGCNNet_for_hsj\results\scatter\MNIST10k\ERL-MVC_representation.mat', 'Y');
results = classification_metrics(predLabel(n+1:end), Ytest(n+1:end));
% display the predictive performance
% disp(['The predictive accuracy is: ', num2str(ACC)]);

end

%% Compute L_21 norm
function val = L21Norm(M)

val = sum(sqrt(sum(M.*M, 2)));

end





