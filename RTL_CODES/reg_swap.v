`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2025 10:18:27 PM
// Design Name: 
// Module Name: reg_swap
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


module reg_swap #(parameter n=7 , data=8)(
    input clk,reset,swap,we,
    input [n-1:0] address_a,address_b,address_r,address_w,
    input [data-1:0] data_w,
    output [data-1:0] data_r
    );
    
    wire [n-1:0] mux_add_w, mux_add,r;
    wire [1:0] sel;
    wire w;
    wire [data-1:0] data_read;
    assign data_r = data_read;
    
    four_one_mux #(.n(n)) mux2 (
    .s(sel),
    .x0(address_r),
    .x1(address_a),
    .x2(address_b),
    .x3('b0),
    .f(mux_add_r)
    );
    
    four_one_mux #(.n(n)) mux1 (
        .s(sel),
        .x0(address_w),
        .x1('b0),
        .x2(address_a),
        .x3(address_b),
        .f(mux_add_w)
        
    );
    register #(.n(n) , .data(data)) reg1 (
        .address_w (mux_add_w),
        .address_r (mux_add_r),
        .data_w (w? data_read : data_w),
        .clk (clk),
        .we (w? 1'b1: we),
        .data_r(data_read)
    );
        
    fsm_swapper fsm1(
        .swap(swap),
        .clk(clk),
        .reset(reset),
        .w(w),
        .sel(sel)
    );    
    

    
endmodule
