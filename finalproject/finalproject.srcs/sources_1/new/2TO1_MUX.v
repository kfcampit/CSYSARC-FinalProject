`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 10:04:33 PM
// Design Name: 
// Module Name: 2TO1_MUX
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


module _2TO1_MUX(
    input wire [15:0] a,
    input wire [15:0] b,
    output wire [15:0] out,
    input wire sel,
    input wire clk
    );
    
    reg [15:0] dataout;
    
    always @(posedge clk)
    begin
        case(sel)
            0: dataout <= a;
            1: dataout <= b;
        endcase
    end
    
    assign out = dataout;
    
endmodule
