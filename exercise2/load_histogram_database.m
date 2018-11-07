function [histograms,files] = load_histogram_database(directory,bins)
    files = cell(30*4,1); % use cell aray to store flenames 
    % initialize matrx for histograms
    histograms = zeros(30 * 4, bins^3);
    % calculate histogram for each image
    for i = 1:30 % iterate objects
        for j = 1:4 % iterate orientations
            image = (i-1)*4 + j;
            files{image} = fullfile(directory,sprintf('object_%02d_%d.png',i,j));
            img = imread(files{image});
            img_hist = reshape(myhist3(img,bins),1,bins^3);
            histograms(image,:) = img_hist;
        end
    end