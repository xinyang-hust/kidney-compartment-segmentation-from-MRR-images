function refined_cortex=cortexrefinement(cortex,factor)

global Num T cropI basetime1 countM;
[l,m,k]=size(cortex);
%find the time point cortex reach maximum and apply OTSU
[t,Ave_c]=find_timepoint(cortex,cropI,T,Num);
%step=1:max(T);figure;plot(step,Ave_c);
Ave_c=Ave_c(1:10);Ave_c(1:basetime1)=0;
t=find(Ave_c==max(Ave_c));
max(T)
t
f=find(cortex~=0);
cortex1=zeros(l,m,1,k);
cortex1(f)=cropI{t}(f);
cortex1=cortex1/max(max(max(cortex1)));
level=findthreshold(cortex1,Num);
for i=1:Num
    cortex1(:,:,1,i)=im2bw(cortex1(:,:,1,i),level*factor);
end
%---------------------------------------------------------
%Connected Component
BW=cortex1;
CC = bwconncomp(BW);
numPixels = cellfun(@numel,CC.PixelIdxList);
[biggest,idx] = max(numPixels);
for i=1:length(CC.PixelIdxList)
if i~=idx
BW(CC.PixelIdxList{i}) = 0;
end
end
%---------------------------------------------------------
% [l,m,n,k]=size(BW);
% global count;
% if count>11
% f=find(BW~=0);
% temp=zeros(l,m,1,k);
% temp(f)=countM(f);
% level=findthreshold(temp,Num);
% for i=1:Num
%     temp(:,:,1,i)=im2bw(temp(:,:,1,i),level*0.1);
% end
% figure;montage(temp);
% else
%     temp=BW;
% end
%---------------------------------------------------------
temp=BW;
for i=1:Num
bw=temp(:,:,1,i);    
CC=bwconncomp(bw);
for j=1:length(CC.PixelIdxList)
f=length(CC.PixelIdxList{j});
if f<2
bw(CC.PixelIdxList{j})=0;
end
end

temp(:,:,1,i)=bw(:,:);
end
[temp]=conncomp3d(temp);
refined_cortex(:,:,:)=temp(:,:,1,:);
