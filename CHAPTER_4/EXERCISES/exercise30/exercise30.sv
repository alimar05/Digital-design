module exercise30
(
	input logic clk, reset,
	input logic p, r, ta, tb,
	output logic [1:0] la, lb
);
	logic m;
	SystemVerilog3 modeFSM(clk, reset, p, r, m);
	SystemVerilog2 lightsFSM(clk, reset, ta, tb, m, la, lb);
endmodule
