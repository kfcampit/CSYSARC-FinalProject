`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 09:26:32 PM
// Design Name: 
// Module Name: PC
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


module PC(
    input wire [2:0] pcopsel,
    input wire [15:0] pcin,
    output wire [15:0] pcout,
    input wire clk,
    input wire rst
    );

reg [16:0] stack;
reg [16:0] outputreg;

always @(posedge clk)
begin
    if(rst) outputreg = 0;
    else
    begin
        case (pcopsel)
        3'h0: outputreg = 0;
        3'h1: outputreg = pcout + 2;
        3'h2: outputreg = pcin;
        3'h3: stack = outputreg;
        3'h4: outputreg = stack;
        default:;
        endcase
    end
end

assign pcout = outputreg;
    
endmodule
