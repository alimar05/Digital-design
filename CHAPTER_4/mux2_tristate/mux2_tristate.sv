module mux2_tristate(
	input logic [3:0] d0, d1,
	input logic s,
	output logic [3:0] y
);
	tristate to(d0, ~s, y);
	tristate t1(d1, s, y);
	
endmodule
