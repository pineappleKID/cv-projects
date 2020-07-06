function occupy=show_move(I,x_loc , y_loc)
    %clc;clear;
    %I = imread('..\pic\white_move.jpg');
    I1=rgb2gray(I);
    %x_loc=[294,384,474,564,654,744,834,924];
    %y_loc=[111,201,291,379,469,561,650,740];

    x_diff=(x_loc(8)-x_loc(1))/7;
    y_diff=(y_loc(8)-y_loc(1))/7;
    %threshold
    th=45;
    high_ratio=0.7;
    low_ratio=0.2;
    %occupy shows whether there is a piece on the node
    occupy=zeros(8,8);
    for x=1:8
        for y=1:8
            if max(max(I1(x_loc(x)+round(x_diff*low_ratio):x_loc(x)+round(x_diff*high_ratio),...
                    y_loc(y)+round(y_diff*low_ratio):y_loc(y)+round(y_diff*high_ratio))))-...
                    min(min(I1(x_loc(x)+round(x_diff*low_ratio):x_loc(x)+round(x_diff*high_ratio),...
                    y_loc(y)+round(y_diff*low_ratio):y_loc(y)+round(y_diff*high_ratio))))>th
                I(x_loc(x)+round(x_diff*low_ratio):x_loc(x)+round(x_diff*high_ratio),...
                    y_loc(y)+round(y_diff*low_ratio):y_loc(y)+round(y_diff*high_ratio),3)=255;
                I(x_loc(x)+round(x_diff*low_ratio):x_loc(x)+round(x_diff*high_ratio),...
                    y_loc(y)+round(y_diff*low_ratio):y_loc(y)+round(y_diff*high_ratio),2)=5;
                occupy(x,y)=1;
            end
        end
    end
    %imshow(I)
end