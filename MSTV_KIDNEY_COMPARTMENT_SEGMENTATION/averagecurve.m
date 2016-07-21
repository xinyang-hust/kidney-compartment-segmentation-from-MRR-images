
function averagecurve(label,cropI,T,Num,string)

sizecrop=size(cropI{1});
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
[a,b]=size(sort_label);
for i=1:max(T)
    Ave(1,i)=sum(sort_label(1:a,i))/a;
end
%t=find(Ave==max(Ave));
%Ave_max=Ave(1,t)
%for i=1:max(T)
%Ave(1,i)=Ave(1,i)/Ave_max;
%end
t=1:max(T);
plot(t,Ave,string);


