function results = classification_metrics(y_true, y_pred)
    %% step0 --> initilizing parameters
    num_classes = length(unique(y_true));
    num_samples = length(y_true);

    micro_P = 0;
    macro_P = 0;
    micro_R = 0;
    macro_R = 0;
    micro_F1 = 0;
    macro_F1 = 0;
    micro_S = 0; % specificity
    macro_S = 0; % specificity

    num_TP = zeros(1, num_classes);
    num_FP = zeros(1, num_classes);
    num_FN = zeros(1, num_classes);
    num_TN = zeros(1, num_classes);

    %% step1 --> compute Accuracy
    cnt = 0;
    for u = 1:num_samples
        if y_pred(u) == y_true(u)
           cnt = cnt+1;
        end
    end
    ACC = cnt / num_samples;

    %% step2 --> compute num_TP/num_FP/num_FN/num_TN for each class
    yc_class_i = y_pred; % get the predict label of each combination
    for i = 1 : num_classes
        temp = yc_class_i;
        idx_yc = find(temp ~= i);
        temp(idx_yc) = 0; % compute the i-th class's value, we should set other classes labels of the predict label to 0
        idx_tp_fp = find(temp == i);
        temp(idx_tp_fp) = 1;
        %sj_label(idx_sj) = 0; % compute the i-th class's value, other classes labels of the actual label also need to be configued to 0
        idx_sj_count = find(y_true == i); % find the index of the label i of the actual class
        num_TP(i) = sum(temp(idx_sj_count));
        temp(idx_sj_count) = 0; % set the locations of yc label to 0 by using idx_sj_count, for the purpose of computing num_FP
        num_FP(i) = sum(temp);
        num_TN(i) = length(y_true) - length(idx_sj_count) - num_FP(i);
        num_FN(i) = length(idx_sj_count) - num_TP(i);
    end

    %% step3 --> Micro-based averaging
    micro_P = sum(num_TP) / (sum(num_TP) + sum(num_FP));
    micro_R = sum(num_TP) / (sum(num_TP) + sum(num_FN));
    micro_S = sum(num_TN) / (sum(num_TN) + sum(num_FP));
    micro_F1 = 2 * ((micro_P * micro_R) / (micro_P + micro_R));

    %% step4 -->  Macro-based averaging
    for j = 1 : num_classes
        temp = num_TP(j) / (num_TP(j) + num_FP(j));
        if (num_TP(j) + num_FP(j) == 0)
            temp = 0;
        end
        macro_P = macro_P + temp;
        macro_R = macro_R + num_TP(j) / (num_TP(j) + num_FN(j));
        macro_S = macro_S + num_TN(j) / (num_TN(j) + num_FP(j));
    end
    macro_P = macro_P / j;
    macro_R = macro_R / j;
    macro_S = macro_S / j;
    macro_F1 = 2 * ( (macro_P * macro_R) / (macro_P + macro_R));

    %% step5 --> return the computed results
    results = [ACC, micro_P, macro_P, micro_R, macro_R, micro_F1, macro_F1, micro_S, macro_S];