#-----reading file-------------------------------------------------------

fid = fopen("outlink.txt");
outlink_vector = fgetl(fid);
fclose(fid);

[p, q] = size(outlink_vector);
sizer=0;

for i=1:q
	if(outlink_vector(i)==" " && outlink_vector(i++))
		sizer++;
	endif
endfor


link_matrix=zeros(sizer,sizer);adjecent_matrix=zeros(sizer,sizer);s=zeros(sizer,sizer);
x=1;y=1;i=1;

#------------------------------------------------------------------------
#------------------------------------------------------------------------











#-----creating adjecent matrix------------------------------------------------

while (i < q)
	if(outlink_vector(i) == ' ')
		x++;y=1;i++;
	endif

	adjecent_matrix(x,y)=outlink_vector(i)-48;
	y++;i++;
endwhile
#------------------------------------------------------------------------
#------------------------------------------------------------------------











[ppp,qqq]=size(adjecent_matrix);
z=zeros(1,sizer);
asd=adjecent_matrix(:,1)';

#------calculate no. of outlicks from particular node------------------------------------------

for x=1:sizer
	for y=2:qqq
		if(adjecent_matrix(x,y)!=0)
			for r=1:sizer
				if(adjecent_matrix(x,y)==asd(r))
					z(x)=z(x)+1;
				endif
			endfor
		else
			break;
		endif	
	endfor
endfor
#------------------------------------------------------------------------
#------------------------------------------------------------------------








#-----creating link matrix--------------------------------------------------------------

for i=1:sizer
	for j=2:qqq
		if(adjecent_matrix(i,j)!=0)
			for k=1:sizer
				if(adjecent_matrix(i,j) == adjecent_matrix(k,1))
						link_matrix(k,i)=1/z(i);
				endif
			endfor
		else
			break;
		endif
	endfor
endfor
#------------------------------------------------------------------------
#------------------------------------------------------------------------






#-------------------------
m=0.85;
#-------------------------

M = sum(link_matrix);
d=zeros(sizer,sizer);

#-----to handle dangling nodes------------------------------------------------------------

for x=1:sizer
	if(M(x)==0)	
		for y=1:sizer
			d(y,x)=1/sizer;
		endfor
	endif	
endfor
#------------------------------------------------------------------------
#------------------------------------------------------------------------





stochastic_matrix=link_matrix+d;
fff=(1/sizer)*ones(sizer);

g = m*stochastic_matrix+(1-m)*fff;

#-----find eigen values and vectors--------------------------------------------------------

pow=power(g,4);
rank=pow';
newrank=zeros(1,sizer);

#--------find rank and correspoding indexes-----------------------------------------------
for i=1:sizer
	[value, index]=max(rank);
	newrank(i)=asd(index);
	rank(index)=-1000;
endfor

#------write link_matrix file rank vector
dlmwrite("rankvector.txt", newrank);
