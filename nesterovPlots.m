[y,A,x,eps] = randomSignal(2^14,2^13,50,sqrt(10^(-4)));
x_nonzero = gt(abs(x),0);
x_nonzero_pos = cumsum(ones(2^14,1)).*x_nonzero;
x_out_50 = nesterov(A,y,50,1e-14,1000);
x_out_30 = nesterov(A,y,30,1e-14,1000);
x_out_60 = nesterov(A,y,60,1e-14,1000);

x_50 = figure;
plot(1:2^14,x_out_50,'LineWidth',1);
title('Recovered Signal for t = 50');
xlim([0 2^14+1]);
ylim([-1.3,1.3]);
exportgraphics(x_50,'fiftysolo.png');

comp_50 = figure;
plot(1:2^14,x_out_50,'',x_nonzero_pos(x_nonzero),x(x_nonzero),'x','LineWidth',1);
title('Recovered Signal for t = 50');
xlim([0 2^14+1]);
ylim([-1.3,1.3]);
exportgraphics(comp_50,'fiftycomp.png');

x_30 = figure;
plot(1:2^14,x_out_30,'LineWidth',1);
title('Recovered Signal for t = 30');
xlim([0 2^14+1]);
ylim([-1.3,1.3]);
exportgraphics(x_30,'thirtysolo.png');

comp_30 = figure;
plot(1:2^14,x_out_30,'',x_nonzero_pos(x_nonzero),x(x_nonzero),'x','LineWidth',1);
title('Recovered Signal for t = 30');
xlim([0 2^14+1]);
ylim([-1.3,1.3]);
exportgraphics(comp_30,'thirtycomp.png');

x_60 = figure;
plot(1:2^14,x_out_60,'LineWidth',1);
title('Recovered Signal for t = 60');
xlim([0 2^14+1]);
ylim([-1.3,1.3]);
exportgraphics(x_60,'sixtysolo.png');

comp_60 = figure;
plot(1:2^14,x_out_60,'',x_nonzero_pos(x_nonzero),x(x_nonzero),'x','LineWidth',1);
title('Recovered Signal for t = 60');
xlim([0 2^14+1]);
ylim([-1.3,1.3]);
exportgraphics(comp_60,'sixtycomp.png');