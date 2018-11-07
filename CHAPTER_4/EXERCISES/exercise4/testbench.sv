module testbench();
	logic clk, reset;
	logic [3:0] a, y, yexpected;
	logic [79:0] vectornum, errors;
	logic [3:0] testvectors[15:0];
	exercise3_4 DUT(a[3:0], y);
	always
		begin
			clk = 1; #5; clk = 0; #5;
		end
	initial
		begin
			$readmemb("expected.txt", testvectors);
			