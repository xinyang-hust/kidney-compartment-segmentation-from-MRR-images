dname = uigetdir(pwd);
dicomlist = dir(fullfile(dname,'*.dcm'));
h = waitbar(0,'Loading dicom images...');

for cnt = 1 : numel(dicomlist)
I(:,:,1,cnt)=dicomread(fullfile(dname,dicomlist(cnt).name));
info=dicominfo(fullfile(dname,dicomlist(cnt).name));
T(cnt)=info.TemporalPositionIdentifier;
waitbar(cnt/numel(dicomlist))
end 
close(h);

for i=1:max(T)
numslices(i)=length(find(T==i));
end

for i=1:max(T)
if numslices(1)==numslices(i)
    check=1;
else 
    check=0;
    break
end
end

if check==0
    disp('The data cannot be processed!');
    warndlg('The data cannot be processed!','Warning')
    break;  
else if check==1
        
Num=length(find(T==1));

for i=1:max(T)
    temp{i}=I(:,:,1,(1+(i-1)*Num):(i*Num));
end
clear I;
I=temp;clear temp;                  
   
    end
end


%  save('pca.mat');
%  save('data.mat','I','Num','T');
% 