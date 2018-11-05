function M = immask(I,B)
% I -> original 3 channel image
% B -> binary mask of the image
% M -> masked image
Id = double(I);
M = cat(3,uint8(Id(:,:,1).*B),uint8(Id(:,:,2).*B),uint8(Id(:,:,3).*B));

end