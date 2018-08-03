function [Eenergy,Path] = Find_Path(Gradient,Seam_Direction)
    [m,n] = size(Gradient);
    E = zeros(m,n);
    P = zeros(m,n);
    tmp = 0;
    if strcmp(Seam_Direction,'0') %Reduce Columns
        for i = 1:m
            for j = 1:n
                if(i == 1)
                    E(i,j) = Gradient(i,j);
                    P(i,j) = 0;
                else
                    if(j == 1)
                        tmp = min_id_2(E(i-1,j),E(i-1,j+1));
                        E(i,j) = Gradient(i,j) + min(E(i-1,j),E(i-1,j+1));
                        P(i,j) = tmp;
                    elseif (j == n)
                        tmp = min_id_2(E(i-1,j-1),E(i-1,j));
                        E(i,j) = Gradient(i,j) + min(E(i-1,j-1),E(i-1,j));
                        P(i,j) = tmp - 1;
                    else
                        tmp = min_id_3(E(i-1,j-1),E(i-1,j),E(i-1,j+1));
                        E(i,j) = Gradient(i,j) + E(i-1,j+tmp-1);
                        P(i,j) = tmp - 1;
                    end
                end
            end
        end
   % end

    else %Reduce Rows
        for j = 1:n
            for i = 1:m
                if(j == 1)
                    E(i,j) = Gradient(i,j);
                    P(i,j) = 0;
                else
                    if(i == 1)
                        tmp = min_id_2(E(i,j-1),E(i+1,j-1));
                        E(i,j) = Gradient(i,j) + min(E(i,j-1),E(i+1,j-1));
                        P(i,j) = tmp;
                    elseif(i == m)
                        tmp = min_id_2(E(i-1,j-1),E(i,j-1));
                        E(i,j) = Gradient(i,j) + min(E(i-1,j-1),E(i,j-1));
                        P(i,j) = tmp - 1;
                    else 
                        tmp = min_id_3(E(i-1,j-1),E(i,j-1),E(i+1,j-1));
                        E(i,j) = Gradient(i,j) + E(i - 1 + tmp,j-1);
                        P(i,j) = tmp - 1;
                    end
                end
            end
        end
    end
    Eenergy = E;
    Max_E = max(max(Eenergy)'); 
    Eenergy = Eenergy ./ Max_E;
    Path = P;
end