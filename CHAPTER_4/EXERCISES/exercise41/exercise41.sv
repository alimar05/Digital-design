module exercise41
(
	input logic clk, start, a,
	output logic q
);
	typedef enum logic [1:0] {S0, S1, S2} statetype;
	statetype state, nextstate;
	
	always_ff @(posedge clk, posedge start)
		if (start) state <= S0;
		else	   state <= nextstate;
	
	always_comb
		case (state)
			S0: if (a) nextstate = S1;
				else   nextstate = S0;
				
			S1: if (a) nextstate = S2;
				else   nextstate = S1;
				
			S2: if (a) nextstate = S2;
				else   nextstate = S1;
				
			default:   nextstate = S0;
		endcase
	
	assign q = (state == S1);
endmodule
