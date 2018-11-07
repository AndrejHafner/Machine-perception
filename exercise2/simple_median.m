function Ig = simple_median(I,W)
    partW = (W-1)/2;
    Ig = zeros(1,length(I) - W);
    for i = partW+1: length(I) - partW
        Ig(1,i-partW) = median(I(i-partW:i+partW));
    end