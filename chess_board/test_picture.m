clc;clear;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%describe the board%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
board=cell(8,8);
board{1,1}='h1';board{1,2}='g1';board{1,3}='f1';board{1,4}='e1';board{1,5}='d1';board{1,6}='c1';board{1,7}='b1';board{1,8}='a1';
board{2,1}='h2';board{2,2}='g2';board{2,3}='f2';board{2,4}='e2';board{2,5}='d2';board{2,6}='c2';board{2,7}='b2';board{2,8}='a2';
board{3,1}='h3';board{3,2}='g3';board{3,3}='f3';board{3,4}='e3';board{3,5}='d3';board{3,6}='c3';board{3,7}='b3';board{3,8}='a3';
board{4,1}='h4';board{4,2}='g4';board{4,3}='f4';board{4,4}='e4';board{4,5}='d4';board{4,6}='c4';board{4,7}='b4';board{4,8}='a4';
board{5,1}='h5';board{5,2}='g5';board{5,3}='f5';board{5,4}='e5';board{5,5}='d5';board{5,6}='c5';board{5,7}='b5';board{5,8}='a5';
board{6,1}='h6';board{6,2}='g6';board{6,3}='f6';board{6,4}='e6';board{6,5}='d6';board{6,6}='c6';board{6,7}='b6';board{6,8}='a6';
board{7,1}='h7';board{7,2}='g7';board{7,3}='f7';board{7,4}='e7';board{7,5}='d7';board{7,6}='c7';board{7,7}='b7';board{7,8}='a7';
board{8,1}='h8';board{8,2}='g8';board{8,3}='f8';board{8,4}='e8';board{8,5}='d8';board{8,6}='c8';board{8,7}='b8';board{8,8}='a8';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
eat_flag=0;
flag_x=0;
flag_y=0;
move_matrix=[];
image=imread('image\second\00.jpg');
for i=1:3
    image(:,:,i)=medfilt2(image(:,:,i),[7,7]);
end
[loc_x,loc_y]=get_location(image);
pre_occupy=[];

%test1_image=imread('image\test\white_move.jpg');
%test2_image=imread('image\test\black_move.jpg');
test1_image=imread('image\second\01.jpg');
for i=1:3
    test1_image(:,:,i)=medfilt2(test1_image(:,:,i),[7,7]);
end
pre_occupy=show_move(test1_image,loc_x,loc_y);
whole_image=dir('image\second');   %get the whole pic
[Board,Player] = Initialize();
Basic = DrawBoard();
Chess = ReadChess();
DrawAll(Board,Chess,Player,Basic,[]);
pause(6);
for step=5:size(whole_image,1) 
%for step=5:5 
        name_picture=['image\second','\',whole_image(step).name];
        test2_image=imread(name_picture);
        for i=1:3
            test2_image(:,:,i)=medfilt2(test2_image(:,:,i),[7,7]);
        end
        occupy1=pre_occupy;
        occupy2=show_move(test2_image,loc_x,loc_y);
        diff_occupy=occupy2-occupy1;
        [after_move_y,after_move_x]=find(diff_occupy==1);     % the chess move to the new place 
        [before_move_y,before_move_x]=find(diff_occupy==-1);  % it's original place
        %%% move to another place
        if     size(before_move_y,1)==1 && size(after_move_y,1)==1 && eat_flag==0;
                disp(['move ', num2str(board{before_move_y,before_move_x}),' to '  ,num2str(board{after_move_y,after_move_x}) ])
                move_matrix(1,1)=before_move_y;
                move_matrix(1,2)=before_move_x;
                move_matrix(2,1)=after_move_y;
                move_matrix(2,2)=after_move_x;
        %%% after remove a chess (eat a chess)
        elseif size(before_move_y,1)==1 && size(after_move_y,1)==1 && eat_flag==1;
                disp([num2str(board{flag_y,flag_x}),' is ate by  ',num2str(board{before_move_y,before_move_x}) ])
                eat_flag=0;
                move_matrix(1,1)=before_move_y;
                move_matrix(1,2)=before_move_x;
                move_matrix(2,1)=flag_y;
                move_matrix(2,2)=flag_x;
        %%% remove a chess
        elseif size(before_move_y,1)==1 && size(after_move_y,1)==0 && eat_flag==0;
                eat_flag=1;
                flag_y=before_move_y;
                flag_x=before_move_x;
        %%% error detecting
        else
            disp('error in detecting moving');
        end    
        pre_occupy=occupy2;
        if eat_flag==0
                [Board,Player] = Move(move_matrix,Board,Player);
                pause(6);
        end
end
