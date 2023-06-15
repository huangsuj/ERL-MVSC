%% Test classification performance of semi-supervised learning

ratio = [0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50];
% ratio = 0.1;
Iter = length(ratio);
overall_perf = [];
dataset_name = 'Youtube.mat';
load('C:\Users\hsj\OneDrive\datasets\Youtube.mat');
code_path = 'C:\Users\hsj\OneDrive\multi_view\对比算法代码\acc_f1_compute\ERL-MVSC\ratio\';
% Y = truth;
% Y = Y;
% LOOP
%     overall_perf = [overall_perf; perf];
%     disp(['The ', num2str(ii), '-th batch has been processed.'])
%     rand('twister',51);    
for ii = 1:length(ratio)
    result_path = [code_path, 'results.txt'];
    fp = fopen(result_path,'A');
    repNum = 1;
    result_ACC = zeros(repNum,1);
    result_micro_P = zeros(repNum,1);
    result_macro_P = zeros(repNum,1);
    result_micro_R = zeros(repNum,1);
    result_macro_R = zeros(repNum,1);
    result_micro_F = zeros(repNum,1);
    result_macro_F = zeros(repNum,1);
    result_time = zeros(repNum,1);

    % Add a waitbar
    steps = repNum;
%         hwait = waitbar(0, 'Please wait ...');

    for i = 1:repNum
        % Start to time
        t1 = clock;

        [results] = fsClassification_semiERLMSC(X, Y', ratio(ii));
        result_ACC(i) = results(1);
        result_micro_P(i) = results(2);
        result_macro_P(i) = results(3);
        result_micro_R(i) = results(4);
        result_macro_R(i) = results(5);
        result_micro_F(i) = results(6);
        result_macro_F(i) = results(7);
        t2 = clock;
        result_time(i) = etime(t2,t1);
        
        % Update waitbar
%             waitbar(i/steps, hwait, 'Will complete soon.');
    end

    % Close waitbar
%         close(hwait);

    % Compute the mean and standard devation
    ACC = [mean(result_ACC), std(result_ACC)]
    micro_P = [mean(result_micro_P), std(result_micro_P)];
    macro_P = [mean(result_macro_P), std(result_macro_P)]
    micro_R = [mean(result_micro_R), std(result_micro_R)];
    macro_R = [mean(result_macro_R), std(result_macro_R)]
    micro_F = [mean(result_micro_F), std(result_micro_F)];
    macro_F = [mean(result_macro_F), std(result_macro_F)]
    Time = [mean(result_time), std(result_time)]
    fprintf(fp, 'Dataset: %s\n', dataset_name);
    fprintf(fp, 'Ratio: %10.2f\n', ratio(ii));
    fprintf(fp, 'ACC: %10.2f (%6.2f)\n', ACC(1)*100, ACC(2)*100);
    fprintf(fp, 'macro_P: %10.2f (%6.2f)\n', macro_P(1)*100, macro_P(2)*100);
    fprintf(fp, 'macro_R: %10.2f (%6.2f)\n', macro_R(1)*100, macro_R(2)*100);
    fprintf(fp, 'macro_F: %10.2f (%6.2f)\n', macro_F(1)*100, macro_F(2)*100);
%         fprintf(fp, 'micro_P: %10.4f\t%6.4f\n', micro_P(1), micro_P(2));
%         fprintf(fp, 'micro_R: %10.4f\t%6.4f\n', micro_R(1), micro_R(2));
%         fprintf(fp, 'micro_F: %10.4f\t%6.4f\n', micro_F(1), micro_F(2));
    fprintf(fp, 'Time: %10.4f\t%10.4f\n\n', Time(1), Time(2));
    fclose(fp);
end

    