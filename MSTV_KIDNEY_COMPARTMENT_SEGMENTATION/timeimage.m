function [peaktime]=timeimage(I,T);
[m,n,~,l]=size(I{1});
Numvoxel=m*n*l;
global peaktime;
peaktime=ones(m,n,l);
intensity=ones(1,T);
for i=1:Numvoxel
    for j=1:T
        intensity(j)=I{j}(i);
    end
    maxtime=find(intensity==max(intensity));
    peaktime(i)=maxtime(1);
end
