module mux4_mux2(
	input logic [3:0] d0, d1, d2, d3,
	input logic [1:0] s,
	output tri [3:0] y
);
	logic [3:0] low, high;
	
	mux2_tristate(d0, d1, s[0], low);
	mux2_tristate(d2, d3, s[0], high);
	mux2_tristate(low, high, s[1], y);
	
endmodule
