module SystemVerilog3
(
	input logic clk, reset,
	input logic p, r,
	output logic m
);
	logic state, nextstate;
	parameter S0 = 1'b0;
	parameter S1 = 1'b1;
	
	always_ff @(posedge clk, posedge reset)
		if (reset) state <= S0;
		else       state <= nextstate;
	
	always_comb
		case (state)
			S0: if (p) nextstate = S1;
				else   nextstate = S0;
			S1: if (r) nextstate = S0;
				else   nextstate = S1;
			default:   nextstate = S0;
		endcase
	
	assign m = state;
endmodule
