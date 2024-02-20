`timescale 1ns / 1ps

module layer2 #(parameter  NN = 30, numWeight=784, dataWidth=16,layerNum=1,sigmoidSize=10,weightIntWeight=4,actType="relu")
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

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(0), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_0.mem"), .biasFile("b_2_0.mem")) n0(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[0*dataWidth+:dataWidth]), .outValid(o_valid[0]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(1), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_1.mem"), .biasFile("b_2_1.mem")) n1(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[1*dataWidth+:dataWidth]), .outValid(o_valid[1]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(2), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_2.mem"), .biasFile("b_2_2.mem")) n2(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[2*dataWidth+:dataWidth]), .outValid(o_valid[2]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(3), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_3.mem"), .biasFile("b_2_3.mem")) n3(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[3*dataWidth+:dataWidth]), .outValid(o_valid[3]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(4), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_4.mem"), .biasFile("b_2_4.mem")) n4(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[4*dataWidth+:dataWidth]), .outValid(o_valid[4]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(5), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_5.mem"), .biasFile("b_2_5.mem")) n5(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[5*dataWidth+:dataWidth]), .outValid(o_valid[5]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(6), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_6.mem"), .biasFile("b_2_6.mem")) n6(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[6*dataWidth+:dataWidth]), .outValid(o_valid[6]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(7), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_7.mem"), .biasFile("b_2_7.mem")) n7(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[7*dataWidth+:dataWidth]), .outValid(o_valid[7]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(8), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_8.mem"), .biasFile("b_2_8.mem")) n8(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[8*dataWidth+:dataWidth]), .outValid(o_valid[8]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(9), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_9.mem"), .biasFile("b_2_9.mem")) n9(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[9*dataWidth+:dataWidth]), .outValid(o_valid[9]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(10), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_10.mem"), .biasFile("b_2_10.mem")) n10(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[10*dataWidth+:dataWidth]), .outValid(o_valid[10]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(11), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_11.mem"), .biasFile("b_2_11.mem")) n11(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[11*dataWidth+:dataWidth]), .outValid(o_valid[11]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(12), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_12.mem"), .biasFile("b_2_12.mem")) n12(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[12*dataWidth+:dataWidth]), .outValid(o_valid[12]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(13), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_13.mem"), .biasFile("b_2_13.mem")) n13(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[13*dataWidth+:dataWidth]), .outValid(o_valid[13]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(14), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_14.mem"), .biasFile("b_2_14.mem")) n14(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[14*dataWidth+:dataWidth]), .outValid(o_valid[14]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(15), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_15.mem"), .biasFile("b_2_15.mem")) n15(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[15*dataWidth+:dataWidth]), .outValid(o_valid[15]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(16), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_16.mem"), .biasFile("b_2_16.mem")) n16(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[16*dataWidth+:dataWidth]), .outValid(o_valid[16]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(17), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_17.mem"), .biasFile("b_2_17.mem")) n17(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[17*dataWidth+:dataWidth]), .outValid(o_valid[17]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(18), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_18.mem"), .biasFile("b_2_18.mem")) n18(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[18*dataWidth+:dataWidth]), .outValid(o_valid[18]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(19), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_19.mem"), .biasFile("b_2_19.mem")) n19(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[19*dataWidth+:dataWidth]), .outValid(o_valid[19]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(20), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_20.mem"), .biasFile("b_2_20.mem")) n20(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[20*dataWidth+:dataWidth]), .outValid(o_valid[20]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(21), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_21.mem"), .biasFile("b_2_21.mem")) n21(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[21*dataWidth+:dataWidth]), .outValid(o_valid[21]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(22), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_22.mem"), .biasFile("b_2_22.mem")) n22(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[22*dataWidth+:dataWidth]), .outValid(o_valid[22]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(23), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_23.mem"), .biasFile("b_2_23.mem")) n23(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[23*dataWidth+:dataWidth]), .outValid(o_valid[23]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(24), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_24.mem"), .biasFile("b_2_24.mem")) n24(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[24*dataWidth+:dataWidth]), .outValid(o_valid[24]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(25), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_25.mem"), .biasFile("b_2_25.mem")) n25(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[25*dataWidth+:dataWidth]), .outValid(o_valid[25]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(26), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_26.mem"), .biasFile("b_2_26.mem")) n26(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[26*dataWidth+:dataWidth]), .outValid(o_valid[26]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(27), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_27.mem"), .biasFile("b_2_27.mem")) n27(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[27*dataWidth+:dataWidth]), .outValid(o_valid[27]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(28), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_28.mem"), .biasFile("b_2_28.mem")) n28(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[28*dataWidth+:dataWidth]), .outValid(o_valid[28]));

    neuron #(.numWeight(numWeight), .layerNo(layerNum), .neuronNo(29), .dataWidth(dataWidth), .sigmoidSize(sigmoidSize), .weightIntWidth(weightIntWeight), .actType(actType), .weightFile("w_2_29.mem"), .biasFile("b_2_29.mem")) n29(
    .clk(clk), .rst(rst), .myinput(x_in), .weightValid(weightValid), .biasValid(biasValid), .weightValue(weightValue), .biasValue(biasValue), .config_layer_num(config_layer_num), .config_neuron_num(config_neuron_num), .myinputValid(x_valid), .out(x_out[29*dataWidth+:dataWidth]), .outValid(o_valid[29]));

endmodule

