function [ endslice ] = slice_end(countM,Num)

% N=max(max(max(countM)))/2;

% f=find(countM<10);
% countM(f)=0;
%a(:,:,1,:)=countM(:,:,:);
%figure;montage(a)
clear temp;
    
for i=1:Num
temp(i)=length(find(countM(:,:,i)~=0));
end



clear f;

pks=findpeaks(temp);

if length(pks)>1

for i=1:length(pks)
f(i)=find(temp==pks(i));
end

clear s;

s1=find(f>28);

if length(s1)>=1
f(s1)=0;
end

s2=find(f<8);

if length(s2)>=1
    f(s2)=0;
end

f=f(find(f~=0));

if length(f)==1
    endslice=f(1);
else
endslice=find(temp==min(temp(f(1):f(end))));
end
end

endslice=endslice+2;



end

