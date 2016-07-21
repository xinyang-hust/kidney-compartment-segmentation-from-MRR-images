function [ dilatedBW ] = dilation(bw,factor)

[x,y,z] = ndgrid(-3:3);
se = strel(sqrt(x.^2 + y.^2 + z.^2) <=factor);
dilatedBW = imdilate(bw,se);

end

