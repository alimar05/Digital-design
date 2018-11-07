module exercise9
(
	input logic a, b, c,
	output logic y
);
	exercise8 mux8(1, 0, 0, 1,
		1, 1, 0, 0, {a, b, c}, y);
endmodule
