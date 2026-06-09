`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2025 10:07:49 PM
// Design Name: 
// Module Name: fsm_swapper
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


module fsm_swapper(
        input swap,clk,reset,
        output w , 
        output [1:0] sel
    );
    
    reg[1:0] state_next , state_reg;
    parameter s0=0, s1=1, s2=2, s3=3;
    
    always@(posedge clk , negedge reset) begin
        if(~reset)
            state_reg <= s0;
        else 
            state_reg <= state_next ;
    end
    
    always@(*) begin
        state_next = state_reg;
        case(state_reg)
            s0: if(~swap)
                    state_next = s0;
                else
                    state_next = s1;
            s1: state_next = s2;
            s2: state_next = s3;
            s3: state_next = s0;
            default: state_next = s0;
        endcase
    end
    assign sel =state_reg;
    assign w = (state_reg != s0);
endmodule
