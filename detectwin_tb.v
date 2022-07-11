
module detectwin_tb();
 
reg [8:0] ain;
reg [8:0] bin;
wire [7:0] win_line;

DetectWinner DUT( ain, bin, win_line);

initial begin

/* when the game just started and there are no inputs from a or b. The expected out put is win_line = 00000000.*/
ain = 9'b000000000;
bin = 9'b000000000;

#5;

/*assert(win_line == 8'b00000000) $display ("it looks good so far.");
else $display("ERROR: something wrong with win_line");*/

//
/* a has bottom right square and b has the center square. The expected out put is win_line = 00000000 because no one has won*/
ain = 9'b000000001;
bin = 9'b000010000;

#5;

/* a has top left corner and bottom right corner. b has the center and bottom left corner. The expected out put is win _line =
00000000 because no one has won yet*/
ain = 9'b100000001;
bin = 9'b000010100;

#5

/* a has the top left corner, top right corner, and bottom right corner, b has top middle, the center, and bottom left
expected output is win_line = 00000000 because no one has won yet*/ 
ain = 9'b101000001;
bin = 9'b010010100;

#5;
/* a has all the boxes in the right collumn. The expeted output is win_line = 00100000*/
ain = 9'b101001001;
bin = 9'b010010100;

#5;

/* A has the top row. expected output is 00000001*/
ain = 9'b111000000;

#5;


/*b has the middle row. expected output is 00000010*/
ain = 9'b000000000;
bin = 9'b000111000;

#5; 

/*a has the bottom row. expected output is 00000100*/
ain = 9'b000000111;
bin = 9'b000000000;

#5;

/*b has the left column. expected output is 00001000*/
ain = 9'b000000000;
bin = 9'b100100100;

#5;

/*a has middle column. expected output is 00010000*/
ain = 9'b010010010;
bin = 9'b000000000;

#5;

/* b has the right column. expected output is 00100000*/
ain = 9'b000000000;
bin = 9'b001001001;


#5;

/*a has the diagonal from top left to bottom right. expected output is 01000000*/
ain = 9'b100010001;
bin = 9'b000000000;

#5;

/*b has the diagonal from top right to bottom left. expected ouput is 10000000*/
ain = 9'b000000000;
bin = 9'b001010100;

#5;

/*neither b or a has any of the winning condition. The expected output is 00000000*/
ain = 9'b010101101;
bin = 9'b101010010;




end


endmodule