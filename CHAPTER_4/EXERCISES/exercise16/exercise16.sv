module exercise16
(
	input logic a, b, c, d, e,
	output logic y
);
	assign y = ~(~(~(a & b) & ~(c & d)) & e);
endmodule
