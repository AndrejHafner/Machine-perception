close all;
A = rgb2gray(imread('lena.png'));
Ag = imnoise(A,'gaussian',0,0.01);
As = imnoise(A,'salt & pepper',0.1);

Ag_gs = uint8(gaussfilter(double(Ag),1));
As_gs = uint8(gaussfilter(double(As),1));

Ag_med = uint8(medianfilter(double(Ag),5));
As_med = uint8(medianfilter(double(As),5));

subplot(2,3,1);
imshow(Ag);
title('Gaussian noise');
subplot(2,3,4);
imshow(As);
title('Salt & pepper noise');
subplot(2,3,2);
imshow(Ag_gs);
title('Gauss filtered');
subplot(2,3,5);
imshow(As_gs);
title('Gauss filtered');
subplot(2,3,3);
imshow(Ag_med);
title('Median filtered');
subplot(2,3,6);
imshow(As_med);
title('Median filtered');