close all;
sig = load('signal.txt');
sig05 = gauss(0.5);
sig1 = gauss(1);
sig2 = gauss(2);
sig3 = gauss(3);
sig4 = gauss(4);
k = [0.1,0.5,0.4];

plot(1:length(sig05),sig05,1:length(sig1),sig1,1:length(sig2),sig2,1:length(sig3),sig3,1:length(sig4),sig4)

subplot(1,4,1);
plot(sig);
subplot(1,4,2);
plot(conv(conv(sig,sig2),k));
subplot(1,4,3);
plot(conv(conv(sig,k),sig2));
subplot(1,4,4);
conv_k = conv(sig2,k);
plot(conv(sig,conv_k));