module arbiter(
				input clk,rst,
				input req_arb,
				output reg gnt_arb
				);
				
	always_ff@(posedge clk) begin
		if(rst) 
			gnt_arb <= 0;
		
		else
			gnt_arb <= req_arb;
	end
	
endmodule