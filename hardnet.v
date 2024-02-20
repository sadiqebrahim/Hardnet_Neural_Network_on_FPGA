`timescale 1ns / 1ps

`include "include.v"

module hardnet #(parameter integer C_S_AXI_DATA_WIDTH=32, parameter integer C_S_AXI_ADDR_WIDTH=5)
    (input clock, 
     input reset, 
     input [`dataWidth-1:0] inputData, 
     input inputDataValid, 
     input [31:0] configlayer, 
     input [31:0] configneuron, 
     input [31:0] weight_Value, 
     input [31:0] bias_Value, 
     input weight_valid, 
     input bias_valid,
     output [31:0] outputData, 
     output outputDataValid
    );

    wire [`dataWidth-1:0] in_data;
    wire in_valid;
    wire [31:0] config_layer_num;
    wire [31:0] config_neuron_num;
    wire [31:0] weightValue;
    wire [31:0] biasValue;
    wire [31:0] out;
    wire out_valid;
    wire weightValid;
    wire biasValid;

    localparam IDLE = 'd0, SEND = 'd1;

    assign in_data = inputData;
    assign in_valid = inputDataValid;
    assign outputData = out;
    assign outputDataValid = out_valid;
    assign config_neuron_num = configneuron;
    assign config_layer_num = configlayer;
    assign weightValue = weight_Value;
    assign biasValue = bias_Value;
    assign weightValid = weight_valid;
    assign biasValid = bias_valid;


    wire [`numNeuronLayer1-1:0] o1_valid;
    wire [`numNeuronLayer1*`dataWidth-1:0] x1_out;
    reg [`numNeuronLayer1*`dataWidth-1:0] holdData1;
    reg data_out_valid1;
    reg [`dataWidth-1:0] out_data1;

    layer1 #(.NN(`numNeuronLayer1), .numWeight(`numWeightLayer1), .dataWidth(`dataWidth), .layerNum(1), .sigmoidSize(`sigmoidSize), .weightIntWeight(`weightIntWidth), .actType(`Layer1ActType)) l1(
        .clk(clock), .rst(reset), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .x_valid(in_valid), .x_in(in_data),
        .o_valid(o1_valid), .x_out(x1_out)
        );

    reg state1;
    integer count1;
    always @(posedge clock)
    begin
        if(reset)
        begin
            state1 <= IDLE;
            count1 <= 0;
            data_out_valid1 <= 0;
        end
        else
        begin
            case(state1)
                IDLE: begin
                        count1 <= 0;
                        data_out_valid1 <= 0;
                        if(o1_valid[0] == 1'b1)
                        begin
                            holdData1 <= x1_out;
                            state1 <= SEND;
                        end
                end
                SEND: begin
                        out_data1 <= holdData1[`dataWidth-1:0];
                        holdData1 <= holdData1 >> `dataWidth;
                        count1 <= count1 + 1;
                        data_out_valid1 <= 1;
                        if(count1 == `numNeuronLayer1)
                        begin
                            state1 <= IDLE;
                            data_out_valid1 <= 0;
                        end
                end
            endcase
        end
    end

    wire [`numNeuronLayer2-1:0] o2_valid;
    wire [`numNeuronLayer2*`dataWidth-1:0] x2_out;
    reg [`numNeuronLayer2*`dataWidth-1:0] holdData2;
    reg data_out_valid2;
    reg [`dataWidth-1:0] out_data2;


    layer2 #(.NN(`numNeuronLayer2), .numWeight(`numWeightLayer2), .dataWidth(`dataWidth), .layerNum(2), .sigmoidSize(`sigmoidSize), .weightIntWeight(`weightIntWidth), .actType(`Layer2ActType)) l2(
        .clk(clock), .rst(reset), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .x_valid(data_out_valid1), .x_in(out_data1),
        .o_valid(o2_valid), .x_out(x2_out)
        );

    reg state2;
    integer count2;
    always @(posedge clock)
    begin
        if(reset)
        begin
            state2 <= IDLE;
            count2 <= 0;
            data_out_valid2 <= 0;
        end
        else
        begin
            case(state2)
                IDLE: begin
                        count2 <= 0;
                        data_out_valid2 <= 0;
                        if(o2_valid[0] == 1'b1)
                        begin
                            holdData2 <= x2_out;
                            state2 <= SEND;
                        end
                end
                SEND: begin
                        out_data2 <= holdData2[`dataWidth-1:0];
                        holdData2 <= holdData2 >> `dataWidth;
                        count2 <= count2 + 1;
                        data_out_valid2 <= 1;
                        if(count2 == `numNeuronLayer2)
                        begin
                            state2 <= IDLE;
                            data_out_valid2 <= 0;
                        end
                end
            endcase
        end
    end

    wire [`numNeuronLayer3-1:0] o3_valid;
    wire [`numNeuronLayer3*`dataWidth-1:0] x3_out;
    reg [`numNeuronLayer3*`dataWidth-1:0] holdData3;
    reg [`dataWidth-1:0] out_data3;
    reg data_out_valid3;

    layer3 #(.NN(`numNeuronLayer3), .numWeight(`numWeightLayer3), .dataWidth(`dataWidth), .layerNum(3), .sigmoidSize(`sigmoidSize), .weightIntWeight(`weightIntWidth), .actType(`Layer3ActType)) l3(
        .clk(clock), .rst(reset), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .x_valid(data_out_valid2), .x_in(out_data2),
        .o_valid(o3_valid), .x_out(x3_out)
        );

    reg state3;
    integer count3;
    always @(posedge clock)
    begin
        if(reset)
        begin
            state3 <= IDLE;
            count3 <= 0;
            data_out_valid3 <= 0;
        end
        else
        begin
            case(state3)
                IDLE: begin
                        count3 <= 0;
                        data_out_valid3 <= 0;
                        if(o3_valid[0] == 1'b1)
                        begin
                            holdData3 <= x3_out;
                            state3 <= SEND;
                        end
                end
                SEND: begin
                        out_data3 <= holdData3[`dataWidth-1:0];
                        holdData3 <= holdData3 >> `dataWidth;
                        count3 <= count3 + 1;
                        data_out_valid3 <= 1;
                        if(count3 == `numNeuronLayer1)
                        begin
                            state3 <= IDLE;
                            data_out_valid3 <= 0;
                        end
                end
            endcase
        end
    end

    wire [`numNeuronLayer4-1:0] o4_valid;
    wire [`numNeuronLayer4*`dataWidth-1:0] x4_out;
    
    layer4 #(.NN(`numNeuronLayer4), .numWeight(`numWeightLayer4), .dataWidth(`dataWidth), .layerNum(4), .sigmoidSize(`sigmoidSize), .weightIntWeight(`weightIntWidth), .actType(`Layer1ActType)) l4(
        .clk(clock), .rst(reset), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .x_valid(data_out_valid3), .x_in(out_data3),
        .o_valid(o4_valid), .x_out(x4_out)
        );

    max #(.numInput(`numNeuronLayer4), .inputWidth(`dataWidth)) m(
        .clk(clock), .data(x4_out), .i_valid(o4_valid[0]),
        .o_valid(out_valid), .o_data(out)
        );

endmodule