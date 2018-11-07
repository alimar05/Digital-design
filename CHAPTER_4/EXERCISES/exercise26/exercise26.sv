module exercise26
(
	input  logic r, s, 
    output logic q, qbar
);
	always @(r, s)
		case({r, s})
			2'b01: {q, qbar} <= 2'b10;
			2'b10: {q, qbar} <= 2'b01;
			2'b11: {q, qbar} <= 2'b00;
		endcase
endmodule

