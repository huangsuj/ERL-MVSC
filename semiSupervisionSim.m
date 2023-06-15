%% This progam is to sample data points for semi-supervised learning

function [Xtest, Ytest, Sim, n] = semiSupervisionSim(X, Y, ratio)

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
similarities = MultiviewSimilarity(Xtest);
W = zeros(size(similarities{1}));
for ii = 1:view_num
    W = W + similarities{ii};
end
Sim = W./view_num;

% Produce a symmetric matrix
for ii = 1:n
    for jj = 1:n
        if abs(Ytest(ii)-Ytest(jj)) < 0.1
            Sim(ii, jj) = 1;
        end
    end
end

end