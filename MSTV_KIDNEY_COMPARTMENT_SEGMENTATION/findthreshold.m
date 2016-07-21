function level = findthreshold(label,Num)

temp=label(:,:,1,1);

for i=2:Num
    temp=[temp label(:,:,1,i)];
end

level=graythresh(temp);


end

