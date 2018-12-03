function [px, py] = harris_points( I, sigma, thresh)
    
    sigma_approx = 1.6*sigma;
    alpha = 0.05;

    % Find second derivatives
    [Ix,Iy] = image_derivatives(I,sigma);
    gauss_ker = gauss(sigma_approx);

    % Create auto-correlation matrix
    A = conv2(Ix.^2,gauss_ker,'same');
    B = conv2(Iy.^2,gauss_ker,'same');
    C = conv2(Ix.*Iy,gauss_ker,'same');

    % Calculate determinant and trace for each point in the image
    det = A.*B - C.^2;
    trace = A + B;
    response = det - alpha .* trace .^2;
    
    % Perform non-maxima suppresion and thresholding
    peaks = nonmaxima_suppression_box(response,thresh);
    [py,px] = find(peaks > 0);
    
    
    
    
    