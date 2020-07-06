function [  ] = DrawAll( board,chess,player,basic,focus )
for i = 1:8
    for j = 1:8
        if board(i,j) == 0
            continue;
        end
        
        r = zeros(80,80,3);
        if mod(i+j,2) == 0
            r = ones(80,80,3);
        end
        
        patch = zeros(80,40,3);
        if player(i,j) == 1
            patch(:,:,2) = 1;
        else
            patch(:,:,1) = 1;    % change
        end
        for k = 1:3
            patch(:,:,k) = patch(:,:,k).*chess(:,:,board(i,j));
        end
        
        grid = zeros(80,80,3);
        grid(:,21:60,:) = patch;
        
        alpha = rgb2gray(grid);
        alpha = (alpha~=0);
        alpha = repmat(alpha,1,1,3);
        grid = alpha.*grid+(ones(80,80,3)-alpha).*r;
        
        basic((i-1)*80+1:i*80,(j-1)*80+1:j*80,:) = grid;
    end
end
for i = 1:size(focus,1)
    basic = DrawEdge(basic,focus(i,:));
end
c=[840,500,780,450];
set(gcf,'position',c);
imshow(basic,'Border','tight');
end

