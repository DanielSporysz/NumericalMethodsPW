%% Gauss-Jordan
load('matrix.mat')

n = size(A,1);

for k = 1 : n
    for i = 1 : n % step 1
        if i ~= k
            A(i,k) = A(i,k) / A(k,k);
        end
    end
    for i = 1 : n % step 2
        if i ~= k
            for j = 1 : n
                if j ~= k
                    A(i,j) = A(i,j) - A(i,k) * A(k,j);
                end
            end
        end
    end
    for j = 1 : n % step 3
        if j ~= k
            A(k,j) = -( A(k,j) / A(k,k));
        end
    end
    A(k,k) = 1 / A(k,k); % step 4
end
    
xGaussJordan = A * b;