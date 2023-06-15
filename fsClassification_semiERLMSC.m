%% Compute semi-supervised classification performance

%%%%%%%%%%%%% Input %%%%%%%%%%%%%%%%%%%%%%
% X: multi-view data matrix (each view with nSample x nFeature)
% Y: class label column

%%%%%%%%%%%% Output %%%%%%%%%%%%%%%%%%%%%%
% ACC: classification performance with mean +- std

function [result] = fsClassification_semiERLMSC(X, Y, ratio)

repNum = 1;
tempACC = zeros(repNum,1);

% Add a waitbar
steps = repNum;
% hwait = waitbar(0, 'Please wait ...');

% Start to time
t1 = clock;

for i = 1:repNum

%     rand('twister',0);
    [result, ~] = semiERLMVSC(X, Y, ratio);
%     tempACC(i) = result;
%     
%     % Update waitbar
%     waitbar(i/steps, hwait, 'Will complete soon.');
%     
% end
% t2 = clock;
% % Close waitbar
% close(hwait);
% 
% % Computer running time
% Time = etime(t2, t1)/repNum;
% 
% % Compute the mean and standard devation
% ACC = [mean(tempACC),std(tempACC)];

% Keep four decimal digits
% perf =  roundn([ACC(:); Time], -4);

end
