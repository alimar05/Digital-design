module exercise22
(
	input logic [2:0] a,
	output logic [6:0] y
);
	always_comb
		case(a)
			0: y = 7'b0000000;
			1: y = 7'b0000001;
			2: y = 7'b0000011;
			3: y = 7'b0000111;
			4: y = 7'b0001111;
			5: y = 7'b0011111;
			6: y = 7'b0111111;
			7: y = 7'b1111111;
		endcase
endmodule

