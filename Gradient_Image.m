function G_Image = Gradient_Image(Image)
    Gray_Image = rgb2gray(Image); 
    hy = fspecial('sobel');
    hx = hy';
    Dy = imfilter(double(Gray_Image),hy,'replicate');
    Dx = imfilter(double(Gray_Image),hx,'replicate');
    G_Image = sqrt(Dx .^ 2 + Dy .^ 2);
    % Normalized processing
    Max_G = max(max(G_Image)'); 
    G_Image = G_Image ./ Max_G;
end