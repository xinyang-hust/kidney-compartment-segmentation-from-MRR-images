function PC=prin_com(I,T,Num)
PCNum=10;

disp('Creating Feature Matrix,please wait...');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% whole pca
img_size=size(I{1});
voxels_num=img_size(1)*img_size(2)*Num;

for i=1:max(T)
    F_Matrix(1:voxels_num,i)=I{i}(1:voxels_num);
end

disp('Principle Component Analysis...');
 F_Matrix=double(F_Matrix);

% [coeff,score,latent]=pca(F_Matrix);
[coeff,score,latent]=princomp(F_Matrix);

[l,m,n,k]=size(I{1});   

for i=1:PCNum
   PC{i}=zeros(l,m,n,k);
   PC{i}(1:voxels_num)=score(1:voxels_num,i);
   PC{i}=int16(PC{i});
   for j=1:Num
       PC{i}(:,:,1,j)=imadjust(PC{i}(:,:,1,j));
   end
end