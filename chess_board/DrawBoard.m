function [ Board ] = DrawBoard
Board = zeros(640,640,3);
for i = 1:8
    for j = 1:8
        s = i+j;
        if mod(s,2) == 0
            Board((i-1)*80+1:i*80,(j-1)*80+1:j*80,:) = 1;
        end
    end
end

end

