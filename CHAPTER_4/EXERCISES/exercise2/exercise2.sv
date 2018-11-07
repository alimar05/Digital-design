module exercise2
(
	input logic [3:0] a,
	output logic [1:0] y
);
	always_comb
		/*if		(a[0]) y = 2'b11;
		else if (a[1]) y = 2'b10;
		else if (a[2]) y = 2'b01;
		else if (a[3]) y = 2'b00;
		else		   y = a[1:0];*/
		/*casez(a)
			4'b???1: y = 2'b11;
			4'b??10: y = 2'b10;
			4'b?100: y = 2'b01;
			4'b?000: y = 2'b00;
			default: y = a[1:0];
		endcase*/
		begin
			y[0] = a[0] | (a[2] & ~a[1]);
			y[1] = a[0] | a[1];
		end
endmodule
