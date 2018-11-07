close all;
sig = load('signal.txt');
ker = load('kernel.txt');

convo = simple_convolution(sig,ker);
x = 1:length(sig);

mat_conv = conv(sig,ker,'same'); % Result doesnt differ much, only at a small part, probably because the kenrel is different

plot(x,convo,x,sig,1:length(ker),ker,x,mat_conv);
% Same means that we start at 1+N

% I think its a Gaussian kernel - smoothes the signal & removes the high
% frequencies