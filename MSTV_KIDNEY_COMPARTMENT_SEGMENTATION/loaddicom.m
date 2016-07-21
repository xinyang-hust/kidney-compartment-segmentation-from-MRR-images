
function [I,Num,T,info]=loaddicom

%This function is for loadding dicom images


dname = uigetdir(pwd);
dicomlist = dir(fullfile(dname,'*.dcm'));
h = waitbar(0,'Loading dicom images...');


parfor cnt = 1 : numel(dicomlist)
I(:,:,1,cnt)=dicomread(fullfile(dname,dicomlist(cnt).name));
info{cnt}=dicominfo(fullfile(dname,dicomlist(cnt).name));
end 
waitbar(1/3)

T=info{1}.NumberOfTemporalPositions;
Num=numel(dicomlist)/T;

waitbar(2/3)


for i=1:max(T)
    temp{i}=I(:,:,1,(1+(i-1)*Num):(i*Num));
end
clear I;

I=temp;clear temp;
waitbar(3/3)
close(h);