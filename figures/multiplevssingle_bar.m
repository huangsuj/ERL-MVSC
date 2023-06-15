%% Draw figures of parameter sensitivity (gamma vs clustering performance)

% Code author: Aiping Huang
% Email: sxxhap@163.com
% Date: January 15, 2020.


%% MNIST30K
% ACC = [0.8707	0.8295	0.87956	0.8926 0.9159;
% 0.8906	0.8679	0.9107	0.9257 0.9306;
% 0.9077	0.8737	0.9191	0.9329 0.938;
% 0.9163	0.8774	0.9217	0.93928 0.944];

%% YouTube
%  ACC = [0.2994	0.2235	0.1765	0.4959	0.2854	0.3157	0.5278 0.5744;
%   0.3392	0.2644	0.1992	0.564	0.3142	0.3613	0.6079 0.63313;
%   0.354	0.284	0.2143	0.6038	0.3331	0.4002	0.6407 0.66648;
%   0.3722	0.3033	0.225	0.6278	0.3517	0.4136	0.6678 0.68583];

%% 3sourse
%  ACC = [0.6645	0.6383	0.6863	0.6928 0.7336;
%  0.7132	0.7574	0.7083	0.7917 0.8338;
%  0.7563	0.7871	0.7731	0.8347 0.8639;
%  0.8007	0.8072	0.7908	0.8693 0.8902];

%% BBCsports
 ACC = [0.8075	0.7884	0.8721 0.90204;
0.8869	0.867	0.9174  0.9349;
0.916	0.8941	0.9396 0.958;
0.9143	0.9052	0.9511 0.96942];

% Set axis caption
axis([0 10 0 1])
acc = ACC;
h = bar(acc);
%colorbar
%colormap(summer) % jet, hsv, lines. hot, cool, summer, winter, autumn, spring
box on
grid on
xlabel('Proportion of labels')
set(gca,'XTickLabel', {'10 %', '20 %', '30 %', '40 %'});
h = legend('V1', 'V2', 'Equal weights','ERL-MVSC', 'orientation','horizontal','location','north');
ylabel('Classification performance')
ylim([0.75,1])
