function img = Display_Seam(Input_Image,Energy,Path,type)
    [m,n,~] = size(Energy);
    Line = Input_Image;
    if strcmp(type,'0') % Reduce Column
        lastCol = find(Energy(m,:) == min(Energy(m,:)));
        col = lastCol(1);
        for i = m:-1:1
            Line(i,col,:) = [0,255,0];
            col = col + Path(i,col);
    end 
    
    else
        lastRow = find(Energy(:,n) == min(Energy(:,n)));
        row = lastRow(1);
        for j = n:-1:1
            Line(row,j,:) = [0,255,0];
            row = row + Path(row,j);
    end
    img = Line;
end