module exercise3_4
(
	input logic [3:0] a,
	output logic y
);
	logic y1, y2;
	exercise3 ex1(a[3], a[2], y1);
	exercise3 ex2(y1, a[1], y2);
	exercise3 ex3(y2, a[0], y);
endmodule	

/*testbench*/
module testbench();
	logic clk, reset;
	logic [3:0] a;
	logic y, yexpected;
	logic [3:0] vectornum, errors;
	logic [4:0] testvectors[16];
	
	exercise3_4 dut(a, y);
	
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
			{a, yexpected} = testvectors[vectornum];
		end
		
	always @(negedge clk)
		if (~reset) begin
		
			if (y !== yexpected) begin
				$display("Error: inputs = %b", a);
				$display(" outputs = %b (%b expected)", y, yexpected);
			end
			
			vectornum = vectornum + 1;
				
			if (testvectors[vectornum] === 5'bx) begin
				$display("%d tests completed with %d errors", vectornum, errors);
			end
		end
endmodule
	