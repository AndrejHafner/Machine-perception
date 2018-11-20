close all;

A = rgb2gray(imread('museum.jpg'));

[Ix,Iy] = image_derivatives(A,1.0);
[Ixx,Iyy,Ixy] = image_derivatives2(A,1.0);
[Imag,Idir] = gradient_magnitude(A,1.0);

colormap gray;

subplot(2,4,1);
imagesc(A);
title('Original');

subplot(2,4,2);
imagesc(Ix);
title('Ix');

subplot(2,4,3);
imagesc(Iy);
title('Iy');

subplot(2,4,4);
imagesc(Imag);
title('Imag');

subplot(2,4,5);
imagesc(Ixx);
title('Ixx');

subplot(2,4,6);
imagesc(Ixy);
title('Ixy');

subplot(2,4,7);
imagesc(Iyy);
title('Iyy');

subplot(2,4,8);
imagesc(Idir);
title('Idir');

