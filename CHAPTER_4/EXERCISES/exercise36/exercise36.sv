module exercise36
(
	input logic clk, reset,
	input logic n, d, q,
	output logic dispense, returnNickel, returnDime,
	returnTwoDimes
);
	typedef enum logic [3:0] {S0, S5, S10, S15, S20, S25, S30, S35, S40, S45} statetype;
	statetype state, nextstate;
	
	always_ff @(posedge clk, posedge reset)
		if (reset) state <= S0;
		else	   state <= nextstate;
		
	always_comb
		case (state)
			S0: if (n) 		nextstate = S5;
				else if (d) nextstate = S10;
				else if (q) nextstate = S25;
				else		nextstate = S0;
				
			S5: if (n)		nextstate = S10;
				else if (d)	nextstate = S15;
				else if (q)	nextstate = S30;
				else 		nextstate = S5;
				
			S10: if (n)		 nextstate = S15;
				 else if (d) nextstate = S20;
				 else if (q) nextstate = S35;
				 else		 nextstate = S10;
				 
			S15: if (n)		 nextstate = S20;
				 else if (d) nextstate = S25;
				 else if (q) nextstate = S40;
				 else		 nextstate = S15;
				 
			S20: if (n) 	 nextstate = S25;
				 else if (d) nextstate = S30;
				 else if (q) nextstate = S45;
				 else 	     nextstate = S20;
				 
			S25:    		 nextstate = S0;
			
			S30: 			 nextstate = S0;
			
			S35: 			 nextstate = S0;
			
			S40: 			 nextstate = S0;
			
			S45: 			 nextstate = S0;
			
			default: 		 nextstate = S0;
		endcase
	
	assign dispense  	  = (state == S25) |
						    (state == S30) |
						    (state == S35) |
					        (state == S40) |
					        (state == S45);
	
	assign returnNickel   = (state == S30);
	
	assign returnDime     = (state == S35) |
						    (state == S40);
						  
	assign returnTwoDimes = (state == S45);
		
endmodule
