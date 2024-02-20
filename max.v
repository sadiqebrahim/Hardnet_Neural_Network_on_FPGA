`timescale 1ns / 1ps

module max #(parameter numInput=10, inputWidth=16)
    (input clk, 
     input [numInput*inputWidth-1:0] data, 
     input i_valid,
     output reg [31:0] o_data, 
     output reg o_valid);

    reg [inputWidth-1:0] maxValue;
    reg [numInput*inputWidth-1:0] buffer;

    integer counter;

    always @(posedge clk)
    begin
        o_valid <= 1'b0;
        if(i_valid)
        begin
            maxValue <= data[inputWidth-1:0];
            counter = 1;
            buffer <= data;
        end
        else if(counter == numInput)
        begin
            counter <= 0;
            o_valid <= 1'b1;
        end
        else if(counter != 0)
        begin
            counter <= counter + 1;
            if(buffer[counter*inputWidth+:inputWidth] > maxValue)
            begin
                maxValue <= buffer[counter*inputWidth+:inputWidth];
                o_data <= counter - 1;
            end
        end
    end
endmodule