function [Re,Re_Gra] = Reduce_Width(image,Grad)

    [Energy,Path] = Find_Path(Grad,'0');
    x = Find_Best_Col_Seam(Energy,Path);
    
    [m,n] = size(Grad);
    
    Re = zeros(m,n-1,3);
    
    for i = 1 : m
        Re(i,1:x(i)-1,:) = image(i,1:x(i)-1,:);
        Re(i,x(i):n-1,:) = image(i,x(i)+1:n,:);
    end
    
    Re = uint8(Re);
    
    Re_Gra = Gradient_Image(Re); 
    
    end