close all;

img1 = imread('images/object_01_1.png');
img2 = imread('images/object_02_1.png');
img3 = imread('images/object_03_1.png');

bins = 8 
h1 = myhist3(img1,bins);
h2 = myhist3(img2,bins);
h3 = myhist3(img3,bins);
h1_d = reshape(h1,1,bins^3);
h2_d = reshape(h2,1,bins^3);
h3_d = reshape(h3,1,bins^3);
figure(1); clf;

subplot(2,3,1);
imshow(img1);

subplot(2,3,2);
imshow(img2);

subplot(2,3,3);
imshow(img3);

subplot(2,3,4);
bar(h1_d,2.5);
title(sprintf('l2(H1,H1) = %f',compare_histograms(h1,h1,'l2')));

subplot(2,3,5);
bar(h2_d,2.5);
title(sprintf('l2(H1,H2) = %f\nchi2(H1,H2) = %f\nintersect(H1,H2) = %f\nhellinger(H1,H2) = %f',compare_histograms(h1,h2,'l2'),compare_histograms(h1,h2,'chi2'),compare_histograms(h1,h2,'intersect'),compare_histograms(h1,h2,'hellinger')));

subplot(2,3,6);
bar(h3_d,2.5);
title(sprintf('l2(H1,H3) = %f\nchi2(H1,H3) = %f\nintersect(H1,H3) = %f\nhellinger(H1,H3) = %f',compare_histograms(h1,h3,'l2'),compare_histograms(h1,h3,'chi2'),compare_histograms(h1,h3,'intersect'),compare_histograms(h1,h3,'hellinger')));

% Image images/object_03_1.png is more similar to images/object_01_1.png,
% because the distance between them is smaller. All the other distances are
% smaller between them aswell, but the difference is not as big or the
% distance between them is not as small as with Euclidean distance. The
% first bin is highly expressed, it represents the color of the background
% - black.