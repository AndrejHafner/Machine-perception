function C = gaussfilter(img,sigma)
    ker = gauss(sigma);
    med = conv2(img,ker,'same');
    C = conv2(med,ker','same');
