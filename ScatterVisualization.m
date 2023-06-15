%% Plot scatter graph

% Code author: Aiping Huang
% Email: sxxhap@163.com
% Date: September 4, 2019.

function mappedX = ScatterVisualization(data, Y)

%%%%%%%%%%%%% Input %%%%%%%%%%%%
% data: data matrix n x d
% Y: the ground truth of data points
% idx: the predictive class label

color = [0 0 0 %??
0 0 1 %??
1 0 1 %??
1 0.50 0 %??
0 1 1 % ??
.69 .09 .12 % ??
.63 .13 .94 % ??
0 1 0 % ??
1 .75 .80 %??
.12 .56 1];
   
data = [];
for ii = 1:length(X)
    data = [data, X{ii}];
end

mappedX = tsne(data);
gscatter(mappedX(:,1), mappedX(:,2), idx, color(1:5:end, :), 'o+h*sd^<>p'); 
axis([-100, 100, -100, 100])

end

