function x = Find_Best_Col_Seam(Energy,Path)
    [m,n] = size(Energy);
    x = zeros(1,m);
    lastCol = find(Energy(m,:) == min(Energy(m,:)));
    col = lastCol(1);
    for i = m:-1:1
        x(i) = col;
        col = col + Path(i,col);
end