function [ Board,Player ] = Move( step,Board,Player )
    x1 = step(1,1);
    y1 = step(1,2);
    x2 = step(2,1);
    y2 = step(2,2);
    Basic = DrawBoard();
    Chess = ReadChess();
    
    Board(x2,y2) = Board(x1,y1);
    Board(x1,y1) = 0;
    
    Player(x2,y2) = Player(x1,y1);
    Player(x1,y1) = 0;
    
    DrawAll(Board,Chess,Player,Basic,[x1,y1;x2,y2]);
end

