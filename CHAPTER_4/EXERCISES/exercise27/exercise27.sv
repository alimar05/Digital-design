module exercise27
(
	input logic clk, j, k,
	output logic q
);
	always @(posedge clk)
		case({j, k})
			2'b10: q <= 1'b1;
			2'b01: q <= 1'b0;
			2'b11: q <= ~q;
		endcase
endmodule
