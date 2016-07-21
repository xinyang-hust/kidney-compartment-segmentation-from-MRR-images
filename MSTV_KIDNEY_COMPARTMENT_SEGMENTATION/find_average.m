function [Ave,average]=find_average(label,cropI,T,Num)

sizecrop=size(cropI);
f=find(label~=0);
%     for i=1:length(f)
%         [a,b,c]=ind2sub([sizecrop(1),sizecrop(2),sizecrop(4)],f(i));
%         for j=1:max(T)
%         intensity_label(i,j)=cropI(a,b,1,c+(j-1)*Num);
%         end
%     end
    
for i=1:length(f)
    for j=1:max(T)
        intensity_label(i,j)=cropI{j}(f(i));
    end
end

intensity_label=double(intensity_label);
sort_label=sort(intensity_label,1,'descend');

for i=1:max(T)
    Ave(1,i)=sum(sort_label(1:length(sort_label),i))/length(sort_label);
end
average=0;
for i=1:15
    average=average+Ave(1,i);
end
average=average/15;


end

