close all;

impulse = zeros(25,25);
impulse(13,13) = 255;

sigma = 6.0;
G = gauss(sigma);
D = gaussdx(sigma);

GGt = conv2(conv2(impulse,G),G');
GDt = conv2(conv2(impulse,G),D');
DGt = conv2(conv2(impulse,D),G');
GtD = conv2(conv2(impulse,G'),D);
DtG = conv2(conv2(impulse,D'),G);

subplot(2,3,1);
imagesc(impulse);
title('Impulse');

subplot(2,3,2);
imagesc(GDt);
title('G,Dt');

subplot(2,3,3);
imagesc(DGt);
title('D,Gt');

subplot(2,3,4);
imagesc(GGt);
title('G,Gt');

subplot(2,3,5);
imagesc(GtD);
title('Gt,D');

subplot(2,3,6);
imagesc(DtG);
title('Dt,G');

% The order is not important

