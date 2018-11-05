A = imread('umbrellas.jpg');  %Image  A  is in 8-bit format  (uint8)
figure(1);  clf; imagesc(A);  %  open    figure window,    clear,  draw
figure(2);  clf; imshow(A)

% Convert to grayscale
Ad = double(A);
[h, w, d] = size(A);
A_gray = uint8((Ad(:,:,1) + Ad(:,:,2) + Ad(:,:,3)) / 3.0);
figure; imshow(A_gray);

A1 = A;
A1(130:260,240:450,3) = 0; % sets blue channel in a part of the region to zero
figure;
subplot(1,2,1);
imshow(A1);
A2 = A(130:260,240:450,1); % shows the same region that has had it's blue channel set to 0
subplot(1,2,2);
imshow(A2);

A3 = A_gray;
A3(130:260,240:450) = 255 - A3(130:260,240:450); % invert 
figure;
imshow(A3);

% grayscale reduction

factor = 63/255;
A_red = uint8(A_gray * factor);
figure;
imshow(A_red);
figure;
imagesc(A_red);
colormap gray;

