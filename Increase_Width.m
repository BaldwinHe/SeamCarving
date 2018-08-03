function [Inc,Inc_Gra] = Increase_Width(image,Grad)

    [Energy,Path] = Find_Path(Grad,'0');
    x = Find_Best_Col_Seam(Energy,Path);

    [m,n] = size(Grad);

    Inc = zeros(m,n+1,3);

    for i = 1 : m
        j = x(i);
        if j == 1
            avg  = (image(i,j,:)/2 + image(i,j+1,:)/2);
        elseif j == n
            avg  = (image(i,j,:)/2 + image(i,j-1,:)/2);
        else
            avg  = (image(i,j-1,:)/2 + image(i,j+1,:)/2);
        end
        Inc(i,:,:) = [image(i,1:j,:),avg,image(i,j+1:end,:)];
    end

    Inc = uint8(Inc);

    Inc_Gra = Gradient_Image(Inc);
    
    figure,imshow(Inc);

end