module exercise37
(
	input logic clk, reset,
	input logic up,
	output logic [2:0] y
);
	typedef enum logic [2:0] {S000 = 3'b000, 
							  S001 = 3'b001, 
							  S011 = 3'b011, 
							  S010 = 3'b010,
							  S110 = 3'b110, 
							  S111 = 3'b111, 
							  S101 = 3'b101, 
							  S100 = 3'b100}
	statetype;
	statetype state, nextstate;
	
	always_ff @(posedge clk, posedge reset)
		if (reset) state <= S000;
		else	   state <= nextstate;
		
	always_comb
		case (state)
			S000: if (up) nextstate = S001;
				  else	  nextstate = S100;
			S001: if (up) nextstate = S011;
				  else	  nextstate = S001;
			S011: if (up) nextstate = S010;
				  else	  nextstate = S011;
			S010: if (up) nextstate = S110;
				  else	  nextstate = S010;
			S110: if (up) nextstate = S111;
				  else	  nextstate = S110;
			S111: if (up) nextstate = S101;
				  else	  nextstate = S111;
			S101: if (up) nextstate = S100;
				  else	  nextstate = S101;
			S100: if (up) nextstate = S000;
				  else	  nextstate = S101;
				  
			default:	  nextstate = S000;
		endcase
	
	assign y = state;
endmodule
