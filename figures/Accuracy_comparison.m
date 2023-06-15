%% Draw figures of multi-view semi-supervised classification 
%  of all compared methods

% Code author: Aiping Huang
% Email: sxxhap@163.com
% DateL January 09, 2020.

% DataSets: ALOI Caltech101-7 Caltech101-20	Caltech101-all HW	
%           MNIST MSRC-v1 NUS-WIDE	Youtube	3sources BBC4view_685

load ComparedResults.mat

%% ALOI
%  ACC = [CR.ALOI(:,1), CR.ALOI(:,2), CR.ALOI(:,3), CR.ALOI(:,4), ...
%       CR.ALOI(:,5), CR.ALOI(:,6), CR.ALOI(:,7), CR.ALOI(:,8)];

%% Caltech101
% ACC = [CR.Caltech101(:,1), CR.Caltech101(:,2), CR.Caltech101(:,3), CR.Caltech101(:,4), ...
%     CR.Caltech101(:,5), CR.Caltech101(:,6), CR.Caltech101(:,7), CR.Caltech101(:,8)];

%% HW
%  ACC = [CR.HW(:,1), CR.HW(:,2), CR.HW(:,3), CR.HW(:,4), ...
%     CR.HW(:,5), CR.HW(:,6), CR.HW(:,7), CR.HW(:,8)];

%% MNIST
%  ACC = [CR.MNIST(:,1), CR.MNIST(:,2), CR.MNIST(:,3), CR.MNIST(:,4), ...
%      CR.MNIST(:,5), CR.MNIST(:,6), CR.MNIST(:,7), CR.MNIST(:,8)];


%% Youtube
%   ACC = [CR.YouTube(:,1), CR.YouTube(:,2), CR.YouTube(:,3), CR.YouTube(:,4), ...
%      CR.YouTube(:,5), CR.YouTube(:,6), CR.YouTube(:,7), CR.YouTube(:,8)];

%% 3sources
%   ACC = [CR.sourse(:,1), CR.sourse(:,2), CR.sourse(:,3), CR.sourse(:,4), ...
%    CR.sourse(:,5), CR.sourse(:,6), CR.sourse(:,7), CR.sourse(:,8)];

%% BBCnews
%   ACC = [CR.BBCnews(:,1), CR.BBCnews(:,2), CR.BBCnews(:,3), CR.BBCnews(:,4), ...
%      CR.BBCnews(:,5), CR.BBCnews(:,6), CR.BBCnews(:,7), CR.BBCnews(:,8)];

%% BBCsports
 ACC = [CR.BBCsport(:,1), CR.BBCsport(:,2), CR.BBCsport(:,3), CR.BBCsport(:,4), ...
    CR.BBCsport(:,5), CR.BBCsport(:,6), CR.BBCsport(:,7), CR.BBCsport(:,8)];

% Set axis caption
hold on
x = 0.1:0.1:0.8;
h1 = plot(x, ACC(1:3:end,1)', ':v', 'MarkerSize', 6, 'Color', [1 0.5 0], 'LineWidth', 2.5);
h2 = plot(x, ACC(1:3:end,2)', ':o', 'MarkerSize', 6, 'Color', [0 0 1], 'LineWidth', 2.5);
h3 = plot(x, ACC(1:3:end,3)', ':*', 'MarkerSize', 8, 'Color', [0.5 0.54 0.53], 'LineWidth', 2.5);
h4 = plot(x, ACC(1:3:end,4)', ':s', 'MarkerSize', 8, 'Color', [0.85 0.44 0.84], 'LineWidth', 2.5);
h5 = plot(x, ACC(1:3:end,5)', ':d', 'MarkerSize', 6, 'Color', [0.5 0.16 0.16], 'LineWidth', 2.5);
h6 = plot(x, ACC(1:3:end,6)', ':p', 'MarkerSize', 6, 'Color', [0 0.78 0.55], 'LineWidth', 2.5);
h7 = plot(x, ACC(1:3:end,7)', ':^', 'MarkerSize', 6, 'Color', [0.12 0.56 1], 'LineWidth', 2.5);
h8 = plot(x, ACC(1:3:end,8)', ':h', 'MarkerSize', 6, 'Color', [1 0 0], 'LineWidth', 2.5);
axis([0.1 0.8 0 1])
box on
grid on
%colormap(hsv)
%set(gca,'XTickLabel', [0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, ...
%    0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8]);
%  h = columnlegend(2, [h1,h2,h3,h4,h5,h6,h7,h8], 'SVM','AMGL','MVAR','MLAN','AWDR', 'Co-GCN', 'HLR-M^{2}VS', 'ERL-MSC ', ...
%      'location', 'southeast');
 columnlegend(2, {'SVM','AMGL','MVAR','MLAN','AWDR', 'Co-GCN', 'HLR-M^{2}VS', 'ERL-MSC '}, 'location','southeast','boxon');
xlabel('Proportion of labels')
ylabel('Accuracy')
%set(h, 'Box', 'off')
