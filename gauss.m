function[x] = gauss(A,B,iter)

a=A;
b=B;
[row,column]=size(a);

d=zeros(row,1);
x=ones(row,1)*1/row;

for k=1:iter
	for i=1:row
		for j=1:column
			if(i>j)
				d(i) = - a(i,j)*d(j)/a(i,i) + d(i);
			elseif(i==j)
				d(i) =  b(i)/a(i,i) + d(i);
			else
				d(i) = - a(i,j)*x(j)/a(i,i) + d(i);
			endif
		endfor
	endfor

x=d;
d=zeros(row,1);

endfor
