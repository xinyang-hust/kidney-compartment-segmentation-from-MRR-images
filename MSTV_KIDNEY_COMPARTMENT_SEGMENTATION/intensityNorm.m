function cropB = intensityNorm(I,T,Num,rect,basetime1)

A=I;
for i=1:max(T)
    A{i}=double(A{i});
end

% for m=1:max(T)
%     A{m}=I(:,:,1,(1+(m-1)*Num):m*Num);
% end

for m=basetime1:max(T)
    B{m}=A{m}-A{basetime1};
end

for m=1:max(T)
    B{m}=B{m}/max(max(max(B{m}))) ;
end

for i=basetime1:max(T)
    for j=1:Num
    cropB{i}(:,:,1,j)=imcrop(B{i}(:,:,1,j),rect);
    end
end



%close all hidden;close all force;













