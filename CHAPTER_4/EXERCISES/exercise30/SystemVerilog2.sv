module SystemVerilog2
(
	input logic clk, reset,
	input logic ta, tb, m,
	output logic [1:0] la, lb
);
	typedef enum logic [1:0] {S0, S1, S2, S3} statetype;
	statetype state, nextstate;
	
	parameter green  = 2'b00;
	parameter yellow = 2'b01;
	parameter red    = 2'b10;
	
	always_ff @(posedge clk, posedge reset)
		if (reset) state <= S0;
		else       state <= nextstate;
		
	always_comb
		case (state)
			S0: if (ta) 	nextstate = S0;
				else    	nextstate = S1;
			S1: 			nextstate = S2;
			S2: if (m | tb) nextstate = S2;
				else        nextstate = S3;
			S3: 			nextstate = S0;
			default: 		nextstate = S0;
		endcase
			
	always_comb
		case (state)
			S0: {la, lb} = {green, red};
			S1: {la, lb} = {yellow, red};
			S2: {la, lb} = {red, green};
			S3: {la, lb} = {red, yellow};
		endcase
endmodule
