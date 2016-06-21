function[x] = power(A,iter)
a=A;
[row, column]=size(a);

x=ones(row,1)*1/row;

for i=1:iter
	x = a*x;
	x = x/norm(x);
endfor

endfunction
