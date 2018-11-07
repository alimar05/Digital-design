module exercise6
(
	input logic [3:0] data,
	output logic [6:0] segments
);

	always_comb
		case(data)
			//		            abc_defg
			4'h0: segments = 7'b111_1110;
			4'h1: segments = 7'b011_0000;
			4'h2: segments = 7'b110_1101;
			4'h3: segments = 7'b111_1001;
			4'h4: segments = 7'b011_0111;
			4'h5: segments = 7'b101_1011;
			4'h6: segments = 7'b101_1111;
			4'h7: segments = 7'b111_0000;
			4'h8: segments = 7'b111_1111;
			4'h9: segments = 7'b111_1011;
			4'ha: segments = 7'b111_0111;
			4'hb: segments = 7'b001_1111;
			4'hc: segments = 7'b000_1101;
			4'hd: segments = 7'b011_1101;
			4'he: segments = 7'b100_1111;
			4'hf: segments = 7'b100_0111;
		endcase
endmodule

/*testbench*/
module testbench();
	logic clk, reset;
	logic [3:0] data, vectornum, errors;
	logic [6:0] y, yexpected;
	logic [10:0] testvectors[16];
	
	exercise6 dut(data, y);
	
	always
		begin
			clk = 1; #5; clk = 0; #5;
		end
		
	initial
		begin
			$readmemb("expected.txt", testvectors);
			vectornum = 0; errors = 0;
			reset = 1; #10; reset = 0;
		end
		
	always @(posedge clk)
		begin
			{data, yexpected} = testvectors[vectornum];
		end
		
	always @(negedge clk)
		if (~reset) begin
			if (y !== yexpected) begin
				$display("Error: inputs = %h", data);
				$display(" outputs %b (%b expected)", y, yexpected);
				errors = errors + 1;
			end
			
			vectornum = vectornum + 1;
			
			if (testvectors[vectornum] === 11'bx) begin
				$display("%d tests completed with %d errors", vectornum, errors);
			end
		end
endmodule
