module exercise20
(
	input logic [7:0] a,
	output logic [2:0] y,
	output logic NONE
);
	always_comb
		casez(a)
			8'b00000000: begin y = 3'd0; NONE = 1; end
			8'b00000001: begin y = 3'd0; NONE = 0; end
			8'b0000001?: begin y = 3'd1; NONE = 0; end
			8'b000001??: begin y = 3'd2; NONE = 0; end
			8'b00001???: begin y = 3'd3; NONE = 0; end
			8'b0001????: begin y = 3'd4; NONE = 0; end
			8'b001?????: begin y = 3'd5; NONE = 0; end
			8'b01??????: begin y = 3'd6; NONE = 0; end
			8'b1???????: begin y = 3'd7; NONE = 0; end
		endcase
endmodule
