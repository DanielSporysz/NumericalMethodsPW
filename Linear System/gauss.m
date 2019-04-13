%% Gaussian elimination
load('matrix.mat')

n = size(A,1);

for j = 1 : n - 1
    % optimalization
    tmpA = A(j:n,j:n);
    maxA = max(max(tmpA));
    [maxRowIndex,maxColumnIndex] = find(A==maxA);
    % columns in A
    tmpCol = zeros(1,n);
    tmpCol = A(:,maxColumnIndex);
    A(:,maxColumnIndex) = A(:,j);
    A(:,j) = tmpCol;
    % rows  in A
    tmpRow = zeros(n,1);
    tmpRow = A(maxRowIndex,:);
    A(maxRowIndex,:) = A(j,:);
    A(j,:) = tmpRow;
    % rows in B
    tmpB = b(maxRowIndex);
    b(maxRowIndex) = b(j);
    b(j) = tmpB;
    
    % elimination
    for i = j + 1 : n          
        wsp = A(i,j) / A(j,j);
        A(i,:) = A(i,:) - wsp * A(j,:);
        b(i) = b(i) - wsp * b(j);
    end
end

xGauss = zeros(n,1);
xGauss(n)= b(n) / A(n,n);
for j = n - 1 : -1 : 1
    xGauss(j) = (b(j) - A(j,j+1:n) * xGauss(j+1:n) )/A(j,j);
end

% blad Gaussa
bGaussa = A * xGauss;
dokladnoscMetodyGaussa = sum(bGaussa) - sum(b);


    
    