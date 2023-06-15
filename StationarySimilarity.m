%% Re-compute similarity using stationary distribution

function Wnew = StationarySimilarity(Sim)

    %D = diag(1./sqrt(sum(Sim, 2)+1e-8));
    %Sim = D * Sim * D;
    D = diag(1./(sum(Sim, 2)+1e-8));
    Sim = D*Sim;
    Wnew = eye(size(Sim)) - Sim;
%     [pi,~] = eigs(Sim',1);
%     Dist = pi/sum(pi);
%     pi = diag(Dist);
%     Wnew = eye(size(Sim)) - (pi^0.5*Sim*pi^-0.5 + pi^-0.5*Sim'*pi^0.5)/2;
end
