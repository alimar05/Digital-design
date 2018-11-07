module exercise44
(
	input logic clk, a, b, c, d,
	output logic q
);
	logic areg, breg, creg, dreg;
	
	always_ff @(posedge clk) begin
		areg <= a;
		breg <= b;
		creg <= c;
		dreg <= d;
		q <= (areg ^ breg) ^ (creg ^ dreg);
	end
endmodule
