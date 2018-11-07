function H = myhist3(img,bins)
    % when computing indices add a small factor to avoid overflow
    % problemms
    % normalize the image so that it falls into the range of bins (if bins
    % is 8, then values are between 0 and 8, then floor all down and add 1
    idx_n = floor(double(img) * bins / (255 + 1e-5)) + 1;
    
    % Reshape the image so that we have colums as R G B and rows as each
    % pixel value
    [h,w,d] = size(img);
    idx = reshape(idx_n,h * w,d);
    % Count the row occurences and put them into the 3D matrix with
    % specified size
    H =  accumarray(idx,1, [bins,bins,bins]);
   
    % normalize the histogram (sum of cell values should equal to 1)
    H = H / sum(sum(sum(H)));
