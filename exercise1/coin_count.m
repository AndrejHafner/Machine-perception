close all;

% Create the mask
A = imread('candy.jpg');
figure;imagesc(A);
[x,y] = ginput(1);
waitforbuttonpress;
A_gray = rgb2gray(A);
thresh = otsu(A_gray);
A_thresh = A_gray < thresh;
SE = ones(7);

% Closing
M = imerode(imdilate(A_thresh,SE),SE);



L = bwlabel(M); % use connected components to label all areas
label_max = max(L(:)); % number of components in L
avg_colours = zeros(3,label_max); % create the vector that will store average channel values
for i = 1:label_max
    pixel_cnt = sum(L(:) == i); % count all the pixels of a connected component
    mask = (L == i);
    masked = immask(A,mask);
    % Calculate average colours
    avg_red = round(sum(sum(masked(:,:,1))) / pixel_cnt);
    avg_green = round(sum(sum(masked(:,:,2))) / pixel_cnt);
    avg_blue = round(sum(sum(masked(:,:,3))) / pixel_cnt);
    % Store them into the array
    avg_colours(:,i) = [avg_red,avg_green,avg_blue];
    
end

candy_idx = L(round(y),round(x)); % must not be 0

candy_clicked = avg_colours(:,candy_idx);
avg_colours(:,candy_idx) = [];
thresh = 300;
selected_candy = sum((avg_colours - candy_clicked).^2) < thresh; % calculate the euclidean distance and select the ones below a threshold
% find euclidean distance

for i = 1 : label_max-1
    if selected_candy(i) == 1
        [o,p] = find(L==i);
        len_o = size(o);
        len_p = size(p);
        o = sum(o)/len_o(1);
        p = sum(p)/len_p(1);
        viscircles([p,o],5);
    end
end
text(50,50,"Count: " + sum(selected_candy));
