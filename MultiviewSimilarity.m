%% Multi-view similarities

function similarities = MultiviewSimilarity(X)

v = length(X);   % the number of views
%k = max(label);  % clusters
n = size(X{1}, 1); % the number of instance

addpath(genpath('functions'))
options.NeighborMode = 'KNN';
options.k = 20; 
options.WeightMode = 'HeatKernel';

% normalization
Cw = cell(v,1);
for i = 1:v
    for  j = 1:n
        X{i} = double(X{i});
         X{i}(j,:) = (X{i}(j,:) - mean(X{i}(j,:))) / (std(X{i}(j,:))+1e-8);
    end
    A0 = constructW(X{i},options);
    D = diag(1./sqrt(sum(A0, 2)));
    A0 = D * A0 * D;
    Cw{i} = A0; 
end

similarities = Cw;

end