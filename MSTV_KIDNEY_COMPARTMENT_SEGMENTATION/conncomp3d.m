function [newBW] = conncomp3d(BW)

CC = bwconncomp(BW);
        numPixels = cellfun(@numel,CC.PixelIdxList);
        [biggest,idx] = max(numPixels);
        for i=1:length(CC.PixelIdxList)
             if i~=idx
             BW(CC.PixelIdxList{i}) = 0;
             end
        end
        newBW=BW;

end

