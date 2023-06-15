%% Draw figures of parameter beta of the proposed method


load beta.mat

%% ALOI
%ACC = beta.ALOI(1:3:end,1:8);

%% Caltech101
ACC = beta.Caltech101(1:3:end,1:8);

%% HW
%ACC = beta.HW(1:3:end,1:8);

%% MNIST
% ACC = beta.MNIST(1:3:end,1:8);

%% Youtube
%ACC = beta.Youtube(1:3:end,1:8);

%% 3sources
%ACC = beta.sources(1:3:end,1:8);

%% BBCnews
%ACC = beta.BBCnews(1:3:end,1:8);

%% BBCsports
%ACC = beta.BBCsports(1:3:end,1:8);

% Set axis caption
surfl(ACC)
%colorbar
colormap(jet)
box on
grid on
%ylim([1, 18])    % set limits of x axisy
xlim([1, 8])
y = 1:18;
x = 1:8;
ylabel('Ratio of labeled data')
xlabel('Parameter \beta')
zlim([0, 1])
zlabel('Accuracy')
%colormap(hsv)
set(gca,'ytick', 1:2:18); 
set(gca,'YTickLabel', {'0', '0.1', '0.2', '0.3', '0.4', '0.5', '0.6', ...
    '0.7', '0.8'});
set(gca,'xtick', 1:8);  
set(gca,'XTickLabel', {'0.00001', '0.0001', '0.001', '0.01', '0.1', '1', ...
    '10', '100'});

