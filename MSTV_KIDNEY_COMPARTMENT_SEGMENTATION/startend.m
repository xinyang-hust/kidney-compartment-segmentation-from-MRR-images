function [ start_slice,end_slice ] = startend( Label )
global Num;
clear l m k f1;
[l,m,k]=size(Label);
for i=1:Num
   f1=find( Label(:,:,i)==0);
   if(length(f1)~=l*m)
       break;
   end
end
for j=i:Num
   f1=find( Label(:,:,j)==0);
   if(length(f1)==l*m)
       break;
   end
end
start_slice=i;
end_slice=j-1;

end

