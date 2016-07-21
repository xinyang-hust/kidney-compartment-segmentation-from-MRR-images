function [count] = slicecount(countM)

[l,m,k]=size(countM);
count=0;
for i=1:k
    f=find(countM(:,:,i)==0);
    if length(f)~=(l*m)
        count=count+1;
    end
end

end

