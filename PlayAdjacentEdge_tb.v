module PlayAdjacentEdge_tb();

reg [8:0] ain;
reg [8:0] bin;
wire [8:0] out;

PlayAdjacentEdge DUT(ain, bin, out);

initial begin

ain = 9'b100000001;
bin = 9'b000010000;

#5;

ain = 9'b001000100;
bin = 9'b000010000;

#5;

ain = 9'b001000001;
bin = 9'b000010000;


end
endmodule
