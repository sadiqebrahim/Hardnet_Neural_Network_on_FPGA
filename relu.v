`timescale 1ns/1ps

module relu #(parameter dataWidth=16, weightIntWidth=4)
	(input clk, 
	 input [2*dataWidth-1:0] x, 
	 output reg [dataWidth-1:0] out);

	always @(posedge clk)
	begin
		if($signed(x)>=0)
		begin
			if(|x[2*dataWidth-1-:weightIntWidth+1])
				out <= {1'b0, {(dataWidth-1){1'b1}}};
			else
				out <= x[2*dataWidth-1-weightIntWidth-:dataWidth];
		end
		else
			out <= 0;
	end

endmodule
