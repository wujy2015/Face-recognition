%In Algorithm1 step 4
%This function computes the residuals ri(y)for i= 1, . . . , k.
% It preserves the coefficients corresponding to the i-th group and sets the rest to zero

function r = judge(y, A, x0, m, n, e)

%length of the test image
len = length(y);
r = ones(m,1);

if (nargin == 5)
    for i = 1:m
        x1 = zeros(n*m,1);
        x1((i-1)*n+1:i*n) = x0((i-1)*n+1:i*n);
        re = y - A * x1;
        r(i) = sum(re.*re);
    end
end

if (nargin == 6)
    for i = 1:m
        x1 = zeros(n*m,1);
        x1((i-1)*n+1:i*n) = x0((i-1)*n+1:i*n);
        re = y - A * x1 - e;
        r(i) = sum(re.*re);
    end
end