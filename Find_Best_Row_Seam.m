function y = Find_Best_Row_Seam(Energy,Path)
    [m,n] = size(Energy);
    y = zeros(1,n);
    lastRow = find(Energy(:,n) == min(Energy(:,n)));
    row = lastRow(1);
    for j = n:-1:1
        y(j) = row;
        row = row + Path(row,j);
end