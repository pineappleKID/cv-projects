function [ Board,Player ] = Initialize
Board = zeros(8,8);

Board(2,:) = 6;
Board(7,:) = 6;

Board(1:7:8,1:7:8) = 1;

Board(1:7:8,2:5:7) = 2;

Board(1:7:8,3:3:6) = 3;

Board(1,4) = 4;
Board(8,5) = 4;

Board(1,5) = 5;
Board(8,4) = 5;
Player = zeros(8,8);
Player(1:2,:) = 1;
Player(7:8,:) = 2;
end

