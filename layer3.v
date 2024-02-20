`timescale 1ns / 1ps

module layer3 #(parameter  NN = 30, numWeight=784, dataWidth=16,layerNum=1,sigmoidSize=10,weightIntWeight=4,actType="relu")
    (input clk, 
     input rst, 
     input weightValid, 
     input biasValid, 
     input [31:0] weightValue, 
     input [31:0] biasValue, 
     input [31:0] config_layer_num, 
     input [31:0] config_neuron_num, 
     input x_valid, 
     input [dataWidth-1:0] x_in,
     output [NN-1:0] o_valid, [NN*dataWidth-1:0] x_out
     );
    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(0), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_3_0.mem"), .biasFile("b_3_0.mem")) n0(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[0*dataWidth+:dataWidth]), .outValid(o_valid[0]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(1), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_3_1.mem"), .biasFile("b_3_1.mem")) n1(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[1*dataWidth+:dataWidth]), .outValid(o_valid[1]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(2), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_3_2.mem"), .biasFile("b_3_2.mem")) n2(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[2*dataWidth+:dataWidth]), .outValid(o_valid[2]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(3), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_3_3.mem"), .biasFile("b_3_3.mem")) n3(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[3*dataWidth+:dataWidth]), .outValid(o_valid[3]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(4), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_3_4.mem"), .biasFile("b_3_4.mem")) n4(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[4*dataWidth+:dataWidth]), .outValid(o_valid[4]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(5), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_3_5.mem"), .biasFile("b_3_5.mem")) n5(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[5*dataWidth+:dataWidth]), .outValid(o_valid[5]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(6), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_3_6.mem"), .biasFile("b_3_6.mem")) n6(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[6*dataWidth+:dataWidth]), .outValid(o_valid[6]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(7), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_3_7.mem"), .biasFile("b_3_7.mem")) n7(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[7*dataWidth+:dataWidth]), .outValid(o_valid[7]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(8), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_3_8.mem"), .biasFile("b_3_8.mem")) n8(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[8*dataWidth+:dataWidth]), .outValid(o_valid[8]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(9), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_3_9.mem"), .biasFile("b_3_9.mem")) n9(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[9*dataWidth+:dataWidth]), .outValid(o_valid[9]));
endmodule