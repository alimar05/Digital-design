module exercise31
(
	input logic clk, a, b, c, d,
	output logic x, y 
);
	logic areg, breg, creg, dreg;
	logic  n1, n2, n3;
	
	always_ff @(posedge clk) begin
		areg <= a;
		breg <= b;
		creg <= c;
		dreg <= d;
		x <= n2;
		y <= n3;
	end
	
	assign n1 = areg & breg;
	assign n2 = n1 | creg;
	assign n3 = ~(n2 | dreg);
endmodule
