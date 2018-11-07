module mux4_12(
	input logic [11:0] d0, d1, d2, d3,
	input logic [1:0] s,
	output logic [11:0] y
);
	logic [11:0] low, hi;
	mux2_parameter #(12) lowmux(d0, d1, s[0], low);
	mux2_parameter #(12) himux(d2, d3, s[0], hi);
	mux2_parameter #(12) outmux(low, hi, s[1], y);
endmodule
