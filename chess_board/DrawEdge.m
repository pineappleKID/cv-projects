function [ im ] = DrawEdge( im,point )
x = point(1);
y = point(2);
patch = im((x-1)*80+1:x*80,(y-1)*80+1:y*80,:);
background = zeros(80,80,3);
background(:,:,1) = 1;    %change
frontground = zeros(70,70);
background(6:75,6:75,1) = frontground;
alpha = repmat((rgb2gray(background))~=0,1,1,3);
patch = patch.*(ones(80,80,3)-alpha)+alpha.*background;
im((x-1)*80+1:x*80,(y-1)*80+1:y*80,:) = patch;
end

