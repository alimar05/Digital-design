module exercise45
(
	input logic clk, c,
	input logic [1:0] a, b,
	output logic [1:0] s
);
	logic [1:0] areg, breg, sreg;
	logic cin, cout;
		
	always_ff @(posedge clk) begin
		cin <= c;
		areg <= a;
		breg <= b;
		s <= sreg;
	end
	assign sreg = {sreg[1], sreg[0]};
	
	fulladder_always add1(areg[0], breg[0], cin, sreg[0], cout);
	fulladder_always add2(areg[1], breg[1], cout, sreg[1], );	
endmodule
