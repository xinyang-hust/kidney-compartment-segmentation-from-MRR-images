
%apply mask to PC-------------------------------------

global T Num rect PC mask I count_num_seg cropI;
global Label1 Label2 Label3 ;

if (count_num_seg==1)
PC=prin_com(I,T,Num);
end

H=waitbar(0,'Please wait...');
clear PCmask;clear cropPCmask;clear maskidx;

parfor i=1:10
for j=1:Num

cropPC{i}(:,:,1,j)=imcrop(PC{i}(:,:,1,j),rect);

end

end
waitbar(0.1,H,'Aplly Mask for PCA...');
[l,m,k]=size(mask);
maskidx=find(mask(:,:,:)~=0);

for i=1:10
cropPCmask{i}=zeros(l,m,k);
    for num=1:length(maskidx)
        cropPCmask{i}(maskidx(num))=cropPC{i}(maskidx(num));
    end
end
%------------------------------------------------------
waitbar(0.2,H,'Apply Mask to PCA...');
[l,m,k]=size(mask);

for i=1:length(maskidx)
	for j=1:10
        FMatrix(i,j)=cropPCmask{j}(maskidx(i));
    end
end
waitbar(0.3,H,'Kmeans...');

IDX=kmeans(FMatrix,3,'MaxIter',1000);
Label1=zeros(l,m,k);Label2=zeros(l,m,k);Label3=zeros(l,m,k);
waitbar(0.6,H,'Labeling...');
%disp('Labeling...');
for i=1:length(maskidx)
    
    switch IDX(i)
        case 1
            Label1(maskidx(i))=1;
        case 2
            Label2(maskidx(i))=1;
        case 3
            Label3(maskidx(i))=1;
    end
end

[l,m,k]=size(mask);
maskidx=find(mask(:,:,:)~=0);

for i=1:max(T)
    
    cropImask{i}=zeros(l,m,1,k);
    
    cropImask{i}(maskidx)=cropI{i}(maskidx);
        
end
waitbar(0.7,H,'Recognise...');
%recogniselabel
[Ave(1,:),average(1)]=find_average(Label1,cropI,T,Num);
[Ave(2,:),average(2)]=find_average(Label2,cropI,T,Num);
[Ave(3,:),average(3)]=find_average(Label3,cropI,T,Num);
global f_min f_medulla f_cortex
f_min=find(average==min(average));
t_max=zeros(1,3);
for j=1:3
    if (f_min==j)
        continue;
    end
    for i=3:max(T)-2
       if (Ave(j,i)>Ave(j,i-1)&&Ave(j,i)>Ave(j,i-2)&&Ave(j,i)>Ave(j,i+1)&&Ave(j,i)>Ave(j,i+2))
        t_max(j)=i;
        break
       end
    end
end
waitbar(0.9,H,'Recognise...');
f_medulla=find(t_max==max(t_max));
f_cortex=6-f_medulla-f_min;
evalc(sprintf('cortex=Label%d',f_cortex));
evalc(sprintf('medulla=Label%d',f_medulla));
evalc(sprintf('collsy=Label%d',f_min));
waitbar(0.95,H,'Finished');
close all hidden;


	