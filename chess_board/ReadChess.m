function [ Chess ] = ReadChess
addpath('pieces\');
Chess = zeros(80,40,6);
for i = 1:6
    name = [num2str(i) '.png'];
    im = imread(name);
    im = rgb2gray(im);
    Chess(:,:,i) = im;
end
Chess = Chess./255;
end

