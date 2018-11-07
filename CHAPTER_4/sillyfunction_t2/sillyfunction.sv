`timescale 1ns/1ps
module sillyfunction
(
	input logic a, b, c,
	output logic y
);
	logic ab, bb, cb, n1, n2, n3;
	assign #1 {ab, bb, cb} = ~{a, b, c};
	assign #1 n1 = ab & bb & cb;
	assign #2 n2 = a & bb & cb;
	assign #2 n3 = a & bb & c;
	assign #4 y = n1 | n2 | n3; 
endmodule

`timescale 1ns/1ps
module testbench2();
	logic a, b, c, y;
	// instantiate device under test
	sillyfunction dut(a, b, c, y);
	// apply inputs one at a time
	// checking results
	initial begin
		a = 0; b = 0; c = 0; #10;
		assert (y === 0) else $error("000 failed.");
		c = 1; #10;
		assert (y === 0) else $error("001 failed.");
		b = 1; c = 0; #10;
		assert (y === 0) else $error("010 failed.");
		c = 1; #10;
		assert (y === 0) else $error("011 failed.");
		a = 1; b = 0; c = 0; #10;
		assert (y === 1) else $error("100 failed.");
		c = 1; #10;
		assert (y === 1) else $error("101 failed.");
		b = 1; c = 0; #10;
		assert (y === 0) else $error("110 failed.");
		c = 1; #10;
		assert (y === 1) else $error("111 failed.");
	end
endmodule