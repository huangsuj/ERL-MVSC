%% Compact bound for manifold embedding and random walk

function tVal = CompactBound(spec, n, eta, delta)

tVal = (log(delta*(1-spec)) - log(eta*(n^0.5)))/(log(1-eta));

end