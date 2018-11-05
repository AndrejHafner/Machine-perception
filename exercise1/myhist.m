function [H, bins] = myhist(I, nbins)
I = reshape(I,1,numel(I)); % reshape to 1D
H = zeros(1, nbins); % init the output 
max_val_in = 255; % max & min values of the input image
min_val_in = 0;
max_val_out = nbins; % max & min values of the H cell index
min_val_out = 1;

% Compute bin numbers for all pixels
f = (max_val_out - min_val_out)/(max_val_in - min_val_in); % scaling factor
idx = floor(double(I) * f) + min_val_out; % scale down the original image so that the pixels values correlate to their bin numbers
idx(idx > nbins) = nbins; % set the ones that are too high to the highest bin index

for i = 1:length(I) % iterate through image and increment the bins that correspond to pixel values
    H(idx(i)) = H(idx(i)) + 1;
end

% Normalize the histogram
H = H / sum(H);
bins = ((1:nbins) - min_val_out) ./ f;