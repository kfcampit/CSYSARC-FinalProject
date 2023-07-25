`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 10:24:13 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [15:0] inA,
    input [15:0] inB,
    output [15:0] result,
    input [2:0] aluopsel,
    input clk
    );
    
reg [16:0] outputreg;

always @(posedge clk)
begin
    case (aluopsel)
        3'h0: outputreg = inA + inB;
        3'h1: outputreg = inA - inB;
        3'h2: outputreg = ~inA;
        3'h3: outputreg = inA & inB;
        3'h4: outputreg = inA | inB;
        3'h5: outputreg = inA ^ inB;
        3'h6: outputreg = inA -^ inB;
        default:;
    endcase
end

assign result = outputreg;
    
endmodule
