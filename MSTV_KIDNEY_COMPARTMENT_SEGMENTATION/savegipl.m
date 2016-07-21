function [ varout ] = savegipl( refine_label )
global Num I rect;
clear i;
vc=zeros(size(I{1}));
vc=double(vc);
vc=squeeze(vc);
for i=1:Num
vc(rect(2):(rect(2)+rect(4)),rect(1):(rect(1)+rect(3)),i)=refine_label(:,:,i);
end

vc1=permute(vc,[2 1 3]);
for i=1:Num
march_rc(:,:,Num-i+1)=vc1(:,:,i);
end
gipl_write_volume(march_rc);
end

