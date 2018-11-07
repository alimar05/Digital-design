`timescale 1ns/1ns
module exercise28
(
	input logic cclk, d,
	output logic q
);
	logic n1, n2, cclk_b;
	assign #1 n1 = d & cclk;
	assign #2 cclk_b = ~cclk;
	assign #1 n2 = cclk_b & q;
	assign #1 q = n1 | n2;
endmodule

/*testbench*/
module testbench();
	logic clk, reset;
	logic cclk, d, q, qexpected;
	logic [2:0] vectornum, errors;
	logic [2:0] testvectors[2];
	exercise28 dut(cclk, d, q);
	always
		begin
			clk = 1; #5; clk = 0; #5;
		end
	initial
		begin
			$readmemb("expected.txt", testvectors);
			vectornum = 0; errors = 0;
			reset = 0;
		end
	always @(posedge clk)
		{cclk, d, qexpected} = testvectors[vectornum];
	always @(negedge clk)
		if (~reset) begin
			if (q !== qexpected) begin
				$display("Error: inputs = %b", {cclk, d});
				$display(" outputs = %b (expected %b)", q, qexpected);
				errors = errors + 1;
			end
			vectornum = vectornum + 1;
			if (testvectors[vectornum] === 4'bx)
				$display("%d tests completed with %d errors", vectornum, errors);
		end
endmodule
