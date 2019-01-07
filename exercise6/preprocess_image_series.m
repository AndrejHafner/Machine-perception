function A = preprocess_image_series(series)
    path = ['faces/', num2str(series), '/'];
    folder = dir(path);
    n = numel(folder) - 2;
    A = [];
    for i = 1:n
        if i < 10
            img_path = [path '00' num2str(i) '.png'];
        else 
            img_path = [path '0' num2str(i) '.png'];
        end
        img = imread(img_path);
        [h,w] = size(img);
        img = reshape(img,[h*w,1]);
        A = [A,img];
            
    end