close all;

I = imread('coins.jpg'); % synth mask

% Create the mask
I_gray = rgb2gray(I);
thresh = otsu(I_gray);
I_thresh = I_gray < thresh;
SE = ones(20);

% Closing
M = imerode(imdilate(I_thresh,SE2),SE2);
figure; imagesc(M);
colormap gray
%I_mask = immask(I,I_thresh);
%figure; imagesc(I_mask);

L = bwlabel(M); % use connected components to label all areas
label_max = max(L(:)); % number of components in L

for i = 1:label_max
    if sum(L(:) == i) > 700 % only process those components that have more than 700 pixels
        L(L == i) = 0; % if there are more that 700 pixels for a connected component remove it by making it black
    end
end
subplot(1,2,1);
imshow(I); title('Original');
subplot(1,2,2);
imshow(immask(I,L>0)); title('Processed'); % show the res
colormap gray