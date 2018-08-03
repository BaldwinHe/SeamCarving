function En = Image_Enlarge(image,scale)
    [m,n,r] = size(image);
    En = imresize(image,scale);
end