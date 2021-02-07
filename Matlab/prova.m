x=[-0.2 -0.1 0.2 0.7 1.3];
y=[0.1923,0.3333,1.6667,2.5,5];

n=length(x);
m=4;
% Step 2
for i=1:m
xsum(i)=sum(x.^(i));
end
% Step 3
% First row of matrix [X] and first element of column vector [Y]
X(1,1)=n;
Y(1,1)=sum(y);
for j=2:(m-1)
X(1,j)=xsum(j-1);
end
% Rows 2 and 3 of matrix [X] and column vector [Y]
for i=2:(m-1)
for j=1:(m-1)
X(i,j)=xsum(j+i-2);
end
Y(i,1)=sum(x.^(i-1).*y);
end
% Step 4
a=X\Y