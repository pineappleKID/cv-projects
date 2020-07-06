function [loc_y,loc_x]=get_location(I)
%clc;clear;
%I=imread('image\test\original.jpg');
for i=1:3
    I(:,:,i)=medfilt2(I(:,:,i),[3,3]);
end
I=rgb2gray(I);
I=im2double(I);
loc_x=[];
loc_y=[];
C = corner(I,1000);
[height,width]=size(I);
corner_image=zeros(height,width);
%hold on
corners_record=[];
for i = 1: size(C,1)
    radius = 30;
    if C(i,2) < radius+1 || C(i,2)>size(I,1)-radius || C(i,1) < radius+1 || C(i,1) >size(I,2)-radius
        continue;
    end
    up_left = sum(sum(I(C(i,2)-radius:C(i,2),C(i,1)-radius:C(i,1))));
    up_right = sum(sum(I(C(i,2):C(i,2)+radius,C(i,1)-radius:C(i,1))));
    lo_left = sum(sum(I(C(i,2)-radius:C(i,2),C(i,1):C(i,1)+radius)));
    lo_right = sum(sum(I(C(i,2):C(i,2)+radius,C(i,1):C(i,1)+radius)));
    Corner_Haar(i) = up_left+lo_right-up_right-lo_left;
    if abs(Corner_Haar(i))>700
        %plot(C(i,1),C(i,2),'* g');
        corners_record=[corners_record;C(i,1),C(i,2)];
    end
end
%find the left_top
xy_total=corners_record(:,2)+corners_record(:,1);
left_top_index= find(  xy_total==min(xy_total));
left_top=corners_record( left_top_index,:);
%find the left_bottom
xy_total=height-corners_record(:,2)+corners_record(:,1);
left_bottom_index= find(  xy_total==min(xy_total));
left_bottom=corners_record( left_bottom_index,:);
%find the right_top
xy_total=corners_record(:,2)+width-corners_record(:,1);
right_top_index= find(  xy_total==min(xy_total));
right_top=corners_record( right_top_index,:);
%find the right_bottom
xy_total=height-corners_record(:,2)+width-corners_record(:,1);
right_bottom_index= find(  xy_total==min(xy_total));
right_bottom=corners_record( right_bottom_index,:);

%imshow(I);
%hold on 
%plot(left_top(1,1),left_top(1,2),'* g');
%plot(left_bottom(1,1),left_bottom(1,2),'* r');
%plot(right_top(1,1),right_top(1,2),'* y');
%plot(right_bottom(1,1),right_bottom(1,2),'* g');
width_each_block=(right_bottom(1,1)-left_bottom(1,1))/6;
%for j=1:8
    %plot(left_top(1,1)+width_each_block*(j-2),left_top(1,2)+width_each_block*(j-2),'* g');
    %loc_x=[loc_x,round(left_top(1,2)+width_each_block*(j-2))];
    %loc_y=[loc_y,round(left_top(1,1)+width_each_block*(j-2))];
%end
new_x=round(left_top(1,1)-(right_bottom(1,1)- left_top(1,1))/6);
new_y=round(left_top(1,2)-(right_bottom(1,2)- left_top(1,2))/6);
loc_x=[loc_x,new_x];
loc_y=[loc_y,new_y];
%plot(new_x,new_y,'* g');
for j=0:6
    new_x=round( j/6*right_bottom(1,1)+((6-j)/6)* left_top(1,1));
    new_y=round( j/6*right_bottom(1,2)+((6-j)/6)* left_top(1,2));
    loc_x=[loc_x, new_x];
    loc_y=[loc_y, new_y];
    %plot(new_x,new_y,'* g');
end



%plot( [right_bottom(1,1) left_bottom(1,1)] , [right_bottom(1,2) left_bottom(1,2)],'r', 'LineWidth',2 )
%plot( [right_top(1,1) left_top(1,1)] , [right_top(1,2) left_top(1,2)],'r', 'LineWidth',2 )
%plot( [right_top(1,1) right_bottom(1,1)] , [right_top(1,2) right_bottom(1,2)],'r', 'LineWidth',2 )
%plot( [left_top(1,1) left_bottom(1,1)] , [left_top(1,2) left_bottom(1,2)],'r', 'LineWidth',2 )


end







