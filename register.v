`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2025 09:55:35 PM
// Design Name: 
// Module Name: register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module register #(parameter n=7 , data=8)(
        input [n-1:0] address_w ,address_r ,
        input [data-1:0] data_w ,
        input clk ,we,
        output [data-1:0] data_r        
    );
    reg [data-1:0] memory [0: 2 ** n-1];
    
    always@(posedge clk) begin
        if(we)
            memory[address_w] <= data_w;
    end
    assign data_r = memory[address_r];
endmodule
