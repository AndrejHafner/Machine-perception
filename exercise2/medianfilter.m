function Ig = medianfilter(I,W)

[h,w] = size(I);
partW = (W-1)/2;
Ig = zeros(h - 2*partW, w - 2*partW);

for i = partW+1 : w - partW
    for j = partW+1 : h - partW
        window = I(i-partW:i+partW,j-partW:j+partW);
        med = median(window(:));
        Ig(i-partW,j-partW) = med;
    end
end

% Complexity
% O(w*h*W^2*log(W*2))

