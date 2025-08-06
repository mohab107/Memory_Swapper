`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2025 10:50:27 PM
// Design Name: 
// Module Name: reg_swap_tb
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


module reg_swap_tb(

    );
    
    localparam n = 7;
    localparam data = 8;
    reg clk, reset;
    reg we;
    reg [n - 1: 0] address_w, address_r;
    reg [data - 1: 0] data_w;
    wire [data - 1: 0] data_r;    
    reg [n- 1: 0] address_a, address_b;
    reg swap;
    integer i;
    
    // Instantiate unit under test
    reg_swap #(.n(n), .data(data)) uut(
        .clk(clk),
        .reset(reset),
        .we(we),
        .address_w(address_w),
        .address_r(address_r),
        .data_w(data_w),
        .data_r(data_r),
        .address_a(address_a),
        .address_b(address_b),
        .swap(swap)
    );
    
    // Generate stimuli
    
    // Generating a clk signal
    localparam T = 10;
    always
    begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
        
    initial
    begin
        // issue a quick reset for 2 ns
        reset = 1'b0;
        #2  
        reset= 1'b1;
        swap = 1'b0;

    
        // fill locations 20 to 30 with some numbers
        for (i = 20; i < 30; i = i + 1)
        begin
            @(negedge clk);
            address_w = i;
            data_w = i;
            we = 1'b1;            
        end
        
        we = 1'b0;
        
        // Swap 2 locations several times
        @(negedge clk)
        address_a = 'd22;
        address_b = 'd28;
        swap = 1'b1;
        repeat(3) @(negedge clk);
        swap = 1'b0;
        
        #25 $stop;
        
        
    end    
    
endmodule

