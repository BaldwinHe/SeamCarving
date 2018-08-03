function [Inc,Inc_Gra] = Increase_Height(image,Grad)

    [Energy,Path] = Find_Path(Grad,'1');
    x = Find_Best_Row_Seam(Energy,Path);

    [m,n] = size(Grad);

    Inc = zeros(m+1,n,3);

    for i = 1 : n
        Inc(1:x(i),i,:) = image(1:x(i),i,:);
        if i == 1
            avg  = (image(x(i),i,:) + image(x(i),i + 1,:))/2;
        elseif i == n
            avg  = (image(x(i),i,:) + image(x(i),i - 1,:))/2;
        else
            avg  = (image(x(i),i - 1,:) + image(x(i),i + 1,:))/2;
        end
        Inc(x(i)+1,i,:) = avg;
        Inc(x(i)+2:n+1,i,:) = image(x(i)+1:n,i,:);
    end

    Inc = uint8(Inc);

    Inc_Gra = Gradient_Image(Inc);

    %figure,imshow(Inc);
end