%% Draw figures of multi-view semi-supervised classification 
%  of all compared methods


% DataSets: ALOI Caltech101-all HW MNIST Youtube 3sources BBC4view_685 BBCsports

load WC.mat

%% ALOI
% WC = WC.ALOI;

%% Caltech101
 %WC = WC.Caltech101

%% HW
% WC = WC.HW

%% MNIST
% WC = WC.MNIST

%% Youtube
WC = WC.youtube
 
%% 3sources
 %WC = WC.source
 
%% BBCnews
 %ACC = beta.BBCnews
 
%% BBCsports
%WC = WC.BBCsport
% Set axis caption
hold on
x = 0:50;
h1 = plot(x, WC(:,1), '-v', 'MarkerSize', 3, 'LineWidth', 2);
h2 = plot(x, WC(:,2), '-o', 'MarkerSize', 3, 'LineWidth', 2);
h3 = plot(x, WC(:,3), '-*', 'MarkerSize', 3, 'LineWidth', 2);
h4 = plot(x, WC(:,4), '-s', 'MarkerSize', 3, 'LineWidth', 2);
h5 = plot(x, WC(:,5), '-d', 'MarkerSize', 3, 'LineWidth', 2);
h6 = plot(x, WC(:,6), '-p', 'MarkerSize', 3, 'LineWidth', 2);
%h7 = plot(x, ACC(40,1:1:8)', '-^', 'MarkerSize', 6, 'Color', [0.12 0.56 1], 'LineWidth', 2.5);
%h8 = plot(x, ACC(46,1:1:8)', '-h', 'MarkerSize', 6, 'Color', [1 0 0], 'LineWidth', 2.5);
%axis([0 50 0 1])
box on
grid on
%set(gca,'XTickLabel', [1e-5, 1e-4, 1e-3, 1e-2, 1e-1, 1, 1e+1, 1e+2]);
colormap(hsv)
%set(gca,'XTickLabel', [0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, ...
%    0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8]);
%h = legend([h1,h2,h3,h4,h5,h6,h7,h8], '10%','20%','30%','40%','50%','60%','70%', '80%', ...
%    'location', 'southwest');
h = legend([h1,h2,h3,h4,h5,h6], 'View 1','View 2','View 3', 'View 4','View 5','View 6' );
xlabel('The number of iterations')
ylabel('Weights for all views')
%set(h, 'Box', 'off')
