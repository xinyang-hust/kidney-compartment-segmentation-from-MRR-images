function [basetime1] = basetimeselect(I,T,Num,rect)

global cropI
% for i=1:max(T)
%     for j=1:Num
%     cropI{i}(:,:,1,j)=double(imcrop(I{i}(:,:,1,j),rect));
%     end
% end

for i=1:max(T)
    f=find(cropI{i}~=0);
    av(i)=sum(cropI{i}(f))/length(f);
end
%avplot=av;
av=av(1:10);
basetime1=find(av==min(av));
basetime1=basetime1+1;
% t=1:max(T);
% plot(t,avplot);
% xlabel('Time slot');
% ylabel('Average Intensity');
% grid on
end

