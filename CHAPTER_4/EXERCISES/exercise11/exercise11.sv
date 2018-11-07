module exercise11
(
	input logic clk, d,
	output logic q
);
	logic n1;
	always_ff @(posedge clk)
		begin
			q = d;
			q = n1;
			n1 = d;
		end
endmodule
