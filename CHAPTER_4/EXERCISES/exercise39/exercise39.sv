module exercise39
(
	input logic clk,
	input logic a, b,
	output logic z
);
	integer count;
	logic aprev;
	always @(posedge clk) begin
		count = count + 1;
		if (count == 2) begin
			aprev <= a;
			count = 0;
		end
	end
	
	assign z = b ? (a | aprev) :
				   (a & aprev);
endmodule
