module exercise21
(
	input logic [7:0] a,
	output logic [2:0] y,
	output logic NONE,
	output logic [2:0] z
);
	always_comb
		begin
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
		
			casez(a)
				8'b00000011: z = 3'd0;
				8'b00000101: z = 3'd0;
				8'b00001001: z = 3'd0;
				8'b00010001: z = 3'd0;
				8'b00100001: z = 3'd0;
				8'b01000001: z = 3'd0;
				8'b10000001: z = 3'd0;
				8'b0000011?: z = 3'd1;
				8'b0000101?: z = 3'd1;
				8'b0001001?: z = 3'd1;
				8'b0010001?: z = 3'd1;
				8'b0100001?: z = 3'd1;
				8'b1000001?: z = 3'd1;
				8'b000011??: z = 3'd2;
				8'b000101??: z = 3'd2;
				8'b001001??: z = 3'd2;
				8'b010001??: z = 3'd2;
				8'b100001??: z = 3'd2;
				8'b00011???: z = 3'd3;
				8'b00101???: z = 3'd3;
				8'b01001???: z = 3'd3;
				8'b10001???: z = 3'd3;
				8'b0011????: z = 3'd4;
				8'b0101????: z = 3'd4;
				8'b1001????: z = 3'd4;
				8'b011?????: z = 3'd5;
				8'b101?????: z = 3'd5;
				8'b11??????: z = 3'd6;
				default:     z = 3'd0;
			endcase
		end
endmodule
