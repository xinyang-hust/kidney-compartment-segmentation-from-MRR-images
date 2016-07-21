imshow(PC{1}(:,:,1,10));
rect=getrect;
save('rect','rect');
load('rect')
[basetime1]=basetimeselect(I,T,Num,rect);
save('basetime1','basetime1');
save('num','Num');
cropB=intensityNorm(I,T,Num,rect,basetime1);
%----------------------------

%Maximal Stable Extreme Regions
MSERmain
maskPCandKmeans
save('label','Label1','Label2','Label3');
save('cropI','cropI','Num','T');
gui



