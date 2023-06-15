%% Draw figures of parameter beta of the proposed method


load gamma.mat

%% ALOI
%ACC = gamma.ALOI(1:3:end, 1:9);

%% Caltech101
ACC = gamma.Caltech101(1:3:end, 1:9);

%% HW
%ACC = gamma.HW(1:3:end, 1:9);

%% MNIST
%ACC = gamma.MNIST(1:3:end, 1:9);

%% Youtube
%ACC = gamma.Youtube(1:3:end, 1:9);

%% 3sources
%ACC = gamma.sources(1:3:end, 1:9);

%% BBCnews
%ACC = gamma.BBCnews(1:3:end, 1:9);

%% BBCsports
%ACC = gamma.BBCsports(1:3:end, 1:9);

% Set axis caption
surfl(ACC)
%colorbar
colormap(jet)
box on
grid on
%ylim([1, 18])    % set limits of x axisy
xlim([1, 9])
y = 1:18;
x = 1:9;
ylabel('Ratio of labeled data')
xlabel('Parameter \gamma')
zlim([0, 1])
zlabel('Accuracy')
colormap(hsv)
set(gca,'ytick', 1:2:18); 
set(gca,'YTickLabel', {'0', '0.1', '0.2', '0.3', '0.4', '0.5', '0.6', ...
    '0.7', '0.8'});
set(gca,'xtick', 1:9);  
set(gca,'XTickLabel', {'0.0001', '0.001', '0.01', '0.1', '1', '10', ...
    '100', '1000', '10000'});

