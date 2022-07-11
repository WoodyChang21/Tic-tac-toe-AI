// DetectWinner
// Detects whether either ain or bin has three in a row 
// Inputs:
//   ain, bin - (9-bit) current positions of type a and b
// Out:
//   win_line - (8-bit) if A/B wins, one hot indicates along which row, col or diag
//   win_line(0) = 1 means a win in row 8 7 6 (i.e., either ain or bin has all ones in this row)
//   win_line(1) = 1 means a win in row 5 4 3
//   win_line(2) = 1 means a win in row 2 1 0
//   win_line(3) = 1 means a win in col 8 5 2
//   win_line(4) = 1 means a win in col 7 4 1
//   win_line(5) = 1 means a win in col 6 3 0
//   win_line(6) = 1 means a win along the downward diagonal 8 4 0
//   win_line(7) = 1 means a win along the upward diagonal 2 4 6

module DetectWinner( input [8:0] ain, bin, output [7:0] win_line );
  // CPEN 211 LAB 3, PART 1: remove following line and add with your implementation below
	/*You can't use assign statements in always block so we created a reg 'winL' to set it equal to win_line outside of the always block*/
	reg [7:0] winL;
/*use always block to constantly check for winning conditions. if, else if, and else were used to specify the conditions of winning
and get the out that we want.*/
  always @*begin
    if ((ain[8]&ain[7]&ain[6])|(bin[8]&bin[7]&bin[6]))
       winL = 8'b00000001;
    else if ((ain[5]&ain[4]&ain[3])|(bin[5]&bin[4]&bin[3]))
       winL = 8'b00000010;
    else if ((ain[2]&ain[1]&ain[0])|(bin[2]&bin[1]&bin[0]))
       winL = 8'b00000100;
    else if ((ain[8]&ain[5]&ain[2])|(bin[8]&bin[5]&bin[2]))
       winL = 8'b00001000;
    else if ((ain[7]&ain[4]&ain[1])|(bin[7]&bin[4]&bin[1]))
       winL = 8'b00010000;
    else if ((ain[6]&ain[3]&ain[0])|(bin[6]&bin[3]&bin[0]))
       winL = 8'b00100000;
    else if ((ain[8]&ain[4]&ain[0])|(bin[8]&bin[4]&bin[0]))
       winL = 8'b01000000;
    else if ((ain[6]&ain[4]&ain[2])|(bin[6]&bin[4]&bin[2]))
       winL = 8'b10000000;
	/*if none of these conditions are met, that means no one has won so the corrosponding output is set to winL. This also avoids
ifered latch warning*/
    else 
      winL = 8'b00000000;

  end
	/*assign win_line = winL outside of the always block becuase you can't use assign statements in always block*/
assign win_line = winL;
endmodule
