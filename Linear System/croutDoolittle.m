%% Crouta-Doolittle
load('matrix.mat')

% Ax = LUx = b
n = size(A,1);
U = zeros(n, n);
L = eye(n);

U(1,:) = A(1,:);
L(:,1) = A(:,1) / U(1,1);
for k = 2 : n
    for i = k : n
        U(k, i) = A(k, i) - L(k, 1:k-1) * U(1:k-1, i );
        if i >= k + 1
            L(i, k) =(A(i,k) - L(i,1:k-1) * U(1:k-1,k) )/ U(k,k);
        end
    end
end

% y; Ly = b
y = zeros(n,1);
y(1) = b(1);
for i = 2 : n
    y(i) = b(i) - L(i, 1:i-1) * y(1:i-1);
end
% x; Rx = y 
xDoolittle = zeros(n,1);
xDoolittle(n) = y(n) / U(n, n);
for i = n-1 : -1 : 1
    xDoolittle(i) = (y(i) - U(i,i+1:n) * xDoolittle(i+1:n)) / U(i, i);
end