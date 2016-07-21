function [BW] = otsuthresh(CM,Num)

CM=CM/max(max(max(CM)));
[l,m,k]=size(CM);
temp=CM(:,:,1);

for i=2:Num
    temp=[temp CM(:,:,i)];
end
level=graythresh(CM);
BW=zeros(l,m,k);
for i=1:Num
    BW(:,:,i)=im2bw(CM(:,:,i),level);
end

end

