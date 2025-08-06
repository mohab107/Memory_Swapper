module four_one_mux #(parameter n=3)(
	input [n-1:0] x0,x1,x2,x3,
	input [1:0]s,
	output reg [n-1:0]f
);
	always @(x0,x1,x2,x3,s)
	begin
	   f='bx;
		case(s)
			2'b00: f=x0;
			2'b01: f=x1;
			2'b10: f=x2;
			2'b11: f=x3;
			default: f='bx;
		endcase
	end
	

endmodule 