function ker = gaussdx(sigma)
    x = -round(3.0*sigma):round(3.0*sigma);
    ker = ((-1)/(sqrt(2*pi)*sigma^3)) .* x .* exp(-(x.^2)/(2*sigma^2));
    ker = ker / sum(abs(ker));