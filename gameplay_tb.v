module gameplay_tb();

reg [8:0] xin;
reg [8:0] oin;
wire [8:0] Oout;

TicTacToe DUT( xin, oin, Oout);

initial begin
//when xin has the bottom right corner the ouput should prioritize the middle box so the ouput is 000010000
xin = 9'b000000001;
oin = 9'b000000000;

#5;
//when xin has the top left corner and the bottom right corner and oin has the middle, the adjacentedge outputs to the middle left box (000100000)
xin = 9'b100000001;
oin = 9'b000010000;

#5; 
//oin has 2 of the 3 boxes in the middle row so the output is to win which is 000001000
xin = 9'b101000001;
oin = 9'b000110000;


end




endmodule
