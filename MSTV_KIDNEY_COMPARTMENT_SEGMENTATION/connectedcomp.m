function [ConCom1] = connectedcomp(cropB, factor)

%load('data');
%load('basetime1');
global basetime1 T Num
parfor m=basetime1:max(T)
    bw=cropB{m}(:,:,1,1);
    for i=2:Num
        tem=cropB{m}(:,:,1,i);
        bw=[bw tem];
    end
    A{m}=bw;
end

parfor i=basetime1:max(T)
    im=A{i};
    level=graythresh(im);
    Bin2d{i}=im2bw(im,level*factor);
end

s=size(cropB{basetime1});

parfor m=basetime1:max(T)
    for i=1:Num
        Bin{m}(:,:,1,i)=Bin2d{m}(:,(1+(i-1)*s(2)):(i*s(2)));
    end
end

for m=(basetime1+1):max(T)
    BW=Bin{m};
    BW=squeeze(BW);
    CC = bwconncomp(BW);
    numPixels = cellfun(@numel,CC.PixelIdxList);
    [biggest,idx1] = max(numPixels);

    BW1=BW;
    
    for i=1:length(CC.PixelIdxList)
        if i~=idx1
            BW1(CC.PixelIdxList{i}) = 0;
        end
    end

    for i=1:Num
        BWtem1(:,:,1,i)=BW1(:,:,i);
    end
    BW1=BWtem1;
    ConCom1{m}=BW1;
    
end