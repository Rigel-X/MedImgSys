function [B] = move_zero(A)
[m,n] = size(A);
B = zeros(m,n);
    function C = count(x,y)
        C = 0;
        if x>=1 && x<=m && y>=1 && y<=n
            if A(x,y)==0
                C = 1;
            end
        end
    end
for i = 1:m
    for j = 1:n
        B(i,j) = A(i,j);
        if count(i+1,j)+count(i-1,j)+count(i,j+1)+count(i,j-1)>=3
            B(i,j) = 0;
        end
        if count(i+1,j)+count(i-1,j)+count(i,j+1)+count(i,j-1)>=4
            A(i,j) = 0;
        end
    end
end
end