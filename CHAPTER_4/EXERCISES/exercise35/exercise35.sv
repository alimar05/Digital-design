module exercise35
(
	input logic clk, reset, a,
	output logic y
);
	typedef enum logic [2:0] {S0, S1, S2, S3, S4}
	statetype;
	
	statetype state, nextstate;
	
	always_ff @(posedge clk, posedge reset)
		if (reset) state <= S0;
		else	   state <= nextstate;
		
	always_comb
		case (state)
			S0: if (a) nextstate = S1;
				else   nextstate = S0;
			S1: if (a) nextstate = S2;
				else   nextstate = S0;
			S2: if (a) nextstate = S3;
				else   nextstate = S4;
			S3: if (a) nextstate = S3;
				else   nextstate = S4;
			S4: if (a) nextstate = S1;
				else   nextstate = S0;
			
			default:   nextstate = S0;
		endcase
	
	assign y = ((state == S3) & ~a) |
			   ((state == S4) & a);
endmodule
