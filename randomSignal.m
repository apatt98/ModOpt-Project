function [y,A,x,epsilon] = randomSignal(N,k,m,sig_eps)
    x = zeros(N,1);
    positions = randperm(N,m);
    values = randi([0 1], m, 1);
    heights = (values == 0) - (values == 1);
    
    x(positions) = heights;
    
    signal = figure;
    plot(1:N,x);
    xlim([0 N+1]);
    ylim([-1.3 1.3]);
    exportgraphics(signal,'signal.png');

    A = randn(k,N);
    epsilon = sig_eps * randn(k,1);
    
    y = A * x + epsilon;
    
    noise = figure;
    plot(1:k,y);
    xlim([0 k+1]);
    ylim([-30 30]);
    exportgraphics(noise,'noise.png');
end