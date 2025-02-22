module cache #(parameter cache_index = 7) ( 
				input logic clk,rst,
				input logic valid,
				inout logic [7:0] data_cache,
				input logic [11:0] address_cache,
				input logic [1:0] rw,
				output logic hit,
				output logic gnt
			);

	
	reg [7:0] cache_mem [0:127];
	logic [11:0] temp_addr;
	
	reg temp_hit;
	
	 /*int file_handle, scan_file;
	string line;
	int data, index = 0;
	*/
	
	int file_handle = "extrace.txt";
	
	/*
	typedef struct packed {
		logic [6:0] index,
		logic [4:0] tag,
		logic [7:0] mem_data
	} cache_contents;
	
	cache_contents cache_content;
	*/
	/*
	
	initial begin
		file_handle = $fopen("extrace.txt", "r"); // Open the input file for reading

		if (!file_handle) begin
			$display("Error opening extrace.txt");
		end 
		
		else begin
			while (!$feof(file_handle) && index < 128) begin
				scan_file = $fgets(line, file_handle); // Read a line from the file
				scan_file = $sscanf(line, "%h", data); // Extract Data
				cache_mem[index] = data; // Store only the Data in mem_array
				index++;
			end

		$fclose(file_handle);
		end
	
	end
	*/
	
	initial 
		begin
			$readmemh(file_handle,cache_mem,8'h7F,8'h00);
		end
		
	
	
	always_ff@(posedge clk)
		begin
			if(rst) begin
				temp_hit <= 0;
				for(int i = 0;i < 2**cache_index;i++) 
					cache_mem[i] <= 0;
			end
			
			else begin
				for(int j = 0;j < 2**cache_index;j++) begin
					if(address_cache[6:0] != j)
						temp_hit <= 0;
						
					else 
						temp_hit <= 1;
						
				end
			end
		end
		
	assign hit = temp_hit;
		
	assign gnt = valid && temp_hit;
	
endmodule