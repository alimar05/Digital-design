module exercise18
(
	input logic a, b, c, d,
	output logic y
);
	always_comb
		casez({a, b, c, d})
			0: y = 0;
			1: y = 0;
			2: y = 0;
			3: y = 0;
			4: y = 0;
			5: y = 0;
			6: y = 0;
			7: y = 0;
			8: y = 1;
			9: y = 0;
		   10: y = 1;
		   11: y = 1;
		   12: y = 1;
		   13: y = 1;
		   14: y = 1;
		   15: y = 1;
		endcase
endmodule
