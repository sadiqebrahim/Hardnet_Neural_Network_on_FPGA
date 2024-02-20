`timescale 1ns/1ps
`define DEBUG
`include "include.v"

module neuron #(parameter layerNo=0, neuronNo=0, numWeight=784, dataWidth=16,sigmoidSize=10,weightIntWidth=4,actType="relu",biasFile="",weightFile="")
	(input clk, 
	 input rst, 
	 input [dataWidth-1:0] myinput, 
	 input myinputValid, 
	 input weightValid, 
	 input biasValid, 
	 input [31:0] weightValue, 
	 input [31:0] biasValue, 
	 input [31:0]config_layer_num,
	 input [31:0]config_neuron_num,
	 output [dataWidth-1:0] out, 
	 output reg outValid);

	 localparam addressWidth = $clog2(numWeight);

	 reg wen;
	 wire ren;
	 reg [addressWidth-1:0] w_addr;
	 reg [addressWidth:0] r_addr;
	 reg [dataWidth-1:0] w_in;
	 wire [dataWidth-1:0] w_out;
	 reg [2*dataWidth-1:0] mul;
	 reg [2*dataWidth-1:0] sum;
	 reg [2*dataWidth-1:0] bias;
	 reg [31:0] biasReg[0:0];
	 reg weight_valid;
	 reg mult_valid;
	 wire mux_valid;
	 reg sigValid;
	 wire [2*dataWidth-1:0] comboAdd;
	 wire [2*dataWidth-1:0] biasAdd;
	 reg [dataWidth-1:0] myinputd;
	 reg muxValid_d;
	 reg muxValid_f;
	 reg addr=0;


	always @(posedge clk)
	begin
		if(rst)
		begin
			w_addr <= {addressWidth{1'b1}};
			wen <= 0;
		end
		else if(weightValid & (config_layer_num==layerNo) & (config_neuron_num==neuronNo))
		begin 
			w_in <= weightValue;
			w_addr <= w_addr + 1;
			wen <= 1;
		end
		else
			wen <= 0;
	end

	assign mux_valid = mult_valid;
	assign comboAdd = mul + sum;
	assign biasAdd = sum + bias;
	assign ren = myinputValid;

	`ifdef pretrained
		initial 
		begin
			$readmemb(biasFile,biasReg);			
		end
		always @ (posedge clk)
		begin
			bias <= {biasReg[addr][dataWidth-1:0],{dataWidth{1'b0}}};
		end
	`else
		always @ (posedge clk)
		begin 
			if(biasValid & (config_layer_num==layerNo) & (config_neuron_num==neuronNo))
			begin
				bias <= {biasValue[dataWidth-1:0],{dataWidth{1'b0}}};
			end
		end
	`endif	


	always @(posedge clk) 
	begin
		if(rst|outValid)
			r_addr <= 0;
		else if(myinputValid)
			r_addr <= r_addr +1;		
	end

	always @(posedge clk) 
	begin
		mul <= $signed(myinputd) * $signed(w_out);		
	end

	always @ (posedge clk)
	begin
		if (rst|outValid)
			sum <=0;
		else if((r_addr == numWeight) & muxValid_f)
		begin
			if(!bias[2*dataWidth-1] & !sum[2*dataWidth-1] & biasAdd[2*dataWidth-1])
			begin
				sum[2*dataWidth-1] <= 1'b0;
				sum[2*dataWidth-2:0] <= {2*dataWidth-1{1'b1}};
			end
			else if(bias[2*dataWidth-1] & sum[2*dataWidth-1] & !biasAdd[2*dataWidth-1])
			begin
				sum[2*dataWidth-1] <= 1'b1;
				sum[2*dataWidth-2:0] <= {2*dataWidth-1{1'b0}};
			end
			else
				sum <= biasAdd;
		end
		else if(mux_valid)
		begin
			if(!mul[2*dataWidth-1] & !sum[2*dataWidth-1] & comboAdd[2*dataWidth-1])
			begin
				sum[2*dataWidth-1] <= 1'b0;
				sum[2*dataWidth-2:0] <= {2*dataWidth-1{1'b1}}; 
			end
			else if(mul[2*dataWidth-1] & sum[2*dataWidth-1] & !comboAdd[2*dataWidth-1])
			begin
				sum[2*dataWidth-1] <= 1'b1;
				sum[2*dataWidth-2:0] <= {2*dataWidth-1{1'b0}}; 
			end
			else
				sum <=comboAdd;
		end
	end

	always @(posedge clk) 
	begin
		myinputd <= myinput;
		weight_valid <= myinputValid;
		mult_valid <= weight_valid;
		sigValid <= ((r_addr==numWeight) & muxValid_f) ? 1'b1 : 1'b0;
		outValid <= sigValid;
		muxValid_d <= mux_valid;
		muxValid_f <= !mux_valid & muxValid_d;
		if (muxValid_f)
		begin
		  $display("%d %d",r_addr, muxValid_f);
		end
	end

	weight_memory #(.numWeight(numWeight),.neuronNo(neuronNo),.layerNo(layerNo),.addressWidth(addressWidth),.dataWidth(dataWidth),.weightFile(weightFile)) WM(
		.clk(clk), .wen(wen), .ren(ren), .wadd(w_addr), .radd(r_addr), .win(w_in), .wout(w_out)
		);

		generate
			if(actType == "sigmoid")
			begin:siginst
				sig_rom #(.inWidth(sigmoidSize),.dataWidth(dataWidth)) s1(
					.clk(clk), .x(sum[2*dataWidth-1-:sigmoidSize]), .out(out)
				);
			end
			else
			begin:reluinst
				relu #(.dataWidth(dataWidth),.weightIntWidth(weightIntWidth)) s1(
					.clk(clk), .x(sum), .out(out)
				);
			end
		endgenerate

		`ifdef DEBUG
		always @(posedge clk) 
		begin
			if(outValid)
				$display(neuronNo,,,,"%b",out);			
		end
		`endif
		
endmodule