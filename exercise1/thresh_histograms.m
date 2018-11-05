close all

A = imread('bird.jpg');  %Image  A  is in 8-bit format  (uint8)
figure; imshow(A);
A_gray = rgb2gray(A);
thresh = 100;
M = A_gray > thresh;
figure;
imagesc(M);
colormap gray

[H, bins] = myhist(A_gray,5);
figure;
imshow(A_gray);
figure;
bar(H);

% c)
I = double(rgb2gray(imread('umbrellas.jpg')));
P = I(:); % turn a 2D matrix to a vector of numbers
figure(1); clf;
bins = 10;
H = hist(P,bins);
subplot(1,3,1); bar(H,'b');
bins = 20;
H = hist(P,bins);
subplot(1,3,2); bar(H,'b');
bins = 40;
H = hist(P,bins);
subplot(1,3,3); bar(H,'b');

% Oblika se spreminja ker  z ve�jim �tevilom "ko�ev" bolj podrobno opi�emo
% intenziteto slike. Posamezni nivoji intenzitete ki so lahko v histogramu
% z manj�im �tevilom "ko�ev" prikazani v enem stolpcu, se potem porazdelijo
% med ve� stolpcev, kar vpliva na obliko histograma.

% d)
S1 = double(rgb2gray(imread('slika1.jpg')));
S2 = double(rgb2gray(imread('slika2.jpg')));
S3 = double(rgb2gray(imread('slika3.jpg')));
S1d = S1(:);
S2d = S2(:);
S3d = S3(:);
bins = 40;
figure(2); clf;
%H1 = hist(S1d,bins);
%[H2,bins2] = myhist(S1d,bins);
%H1 = hist(S2d,bins);
%[H2,bins2] = myhist(S2d,bins);
H1 = hist(S3d,bins);
[H2,bins2] = myhist(S3d,bins);
subplot(1,2,1); bar(H1,'b');
subplot(1,2,2); bar(H2,'b');

% Hist dolo�i max&min glede na max in min vrednosti elementov v podanem
% vektorju. Vi�ina stolpca v histogramu, ki ga vrne funkcija hist, je enaka �tevilu elementov za tisto
% intenziteto. Vi�ina stolpca v histogramu funkcije myhist pa je relativna
% frekvenca dolo�ene intenzitete. Vsota vseh stolpcev je enaka 1.

% e)

figure(3); clf;
[H1b,bins1a] = myhist(S1d,bins);
[H2b,bins2a] = myhist(S2d,bins);
[H3b,bins3a] = myhist(S3d,bins);
subplot(1,3,1); bar(H1b,'b');
subplot(1,3,2); bar(H2b,'b');
subplot(1,3,3); bar(H3b,'b');

% Prva slika je bila narejena pri normalni svetlobi, druga brez lu�i v sobi
% in tretja z namizno svetilko usmerjeno vame. Histogrami izra�ajo
% inteziteto barv na sliki, zato je na sliki brez lu�i ve�inski del
% histograma pomaknjen na levo, kjer je intenziteta majhna, na sliki z
% svetilko usmerjeno vame pa je bolj na sredini, saj je bilo ve� svetlobe
% in s tem tudi vi�ja intenziteta.


% f)
thresh = otsu(A_gray);
A_thresh = A_gray > thresh;
figure; imagesc(A_thresh);
colormap gray

