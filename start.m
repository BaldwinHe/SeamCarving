clc;
clear;
Input_Image = imread('Fuji.jpg');
[m,n,r] = size(Input_Image);
scale = 1;
need_x = 300;
need_y = 296;
if need_x > m
    scale = ceil(need_x/m);
end
if need_y > n
    scale = max(scale,ceil(need_y/n));
end
Input_Image =  Image_Enlarge(Input_Image,scale);
Grad = Gradient_Image(Input_Image);
dx = m*scale - need_x;
dy = n*scale - need_y;

for i = 1:dy
    [Input_Image,Grad] = Reduce_Width(Input_Image,Grad);
end

for i = 1:dx
    [Input_Image,Grad] = Reduce_Height(Input_Image,Grad);
end

size(Input_Image)
figure,imshow(Input_Image);
imwrite(Input_Image,'Fuji_test.jpg', 'JPG');
