module exercise10
(
	input logic a, b, c,
	output logic y
);
	exercise8 #(1) mux4_1(~c, c, 1'b1, 1'b0, {a, b}, y);
endmodule

module exercise8
#(parameter width = 4)
(
	input logic [width - 1:0] d0, d1, d2, d3,
	input logic [1:0] s,
	output logic [width - 1:0] y
);
	always_comb
		case(s)
			0: y = d0;
			1: y = d1;
			2: y = d2;
			3: y = d3;
		endcase
endmodule
