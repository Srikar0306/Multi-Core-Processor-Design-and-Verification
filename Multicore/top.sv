import pkg::*;

module top(
			input logic clk,rst,
			input logic [7:0] A,B,
			input logic start_op,
			input opcode op_sel,
			input logic [11:0] address_in,
			input logic [7:0] data_in,
			output logic end_op,
			output logic [15:0] result
			);
			
	logic hit,gnt,valid;
	logic [1:0] rw;
	logic [11:0] address_cache;
	
	wire [7:0] data_cache;
	
	multi_processor pro1 (.clk(clk),.rst(rst),.A(A),.B(B),.start_op(start_op),.op_sel(op_sel),.address_in(address_in),.data_in(data_in),.hit(hit),
						.gnt(gnt),.data_cache(data_cache),.result(result),.rw(rw),.end_op(end_op),.valid(valid),.address_cache(address_cache));
						
	cache cache2 (.clk(clk),.rst(rst),.valid(valid),.data_cache(data_cache),.address_cache(address_cache),.rw(rw),.hit(hit),.gnt(gnt));
				
endmodule