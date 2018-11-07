module exercise33
(
	input logic clk, reset,
	input logic a, b,
	output logic q
);
	typedef enum logic [1:0] {S0, S1, S2} statetype;
	statetype state, nextstate;
	
	always_ff @(posedge clk, posedge reset)
		if (reset) state <= S0;
		else	   state <= nextstate;
		
	always_comb
		case (state)
			S0: if (a)     nextstate = S1;
				else       nextstate = S0;
			S1: if (b)     nextstate = S2;
				else       nextstate = S0;
			S2: if (a & b) nextstate = S2;
				else 	   nextstate = S0;
			
			default: 	   nextstate = S0;
		endcase
		
	assign q = ((a & b) & (state == S2));
	/*always_comb
		case (state)
			S0:			   q = 0;
			S1: 		   q = 0;
			S2: if (a & b) q = 1;
				else	   q = 0;
			
			default:       q = 0;
		endcase*/
endmodule
