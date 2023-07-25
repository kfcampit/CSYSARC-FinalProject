`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 10:30:36 PM
// Design Name: 
// Module Name: SOURCE_MUX
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


module SOURCE_MUX(
    input [15:0] pcout,
    input [15:0] memout,
    input [15:0] aluout,
    input [15:0] irout,
    input [15:0] aout,
    input [2:0] sourceSel,
    output [15:0] dataout,
    input clk
    );
    
reg [15:0] out;
    
always @(posedge clk)
begin
    case(sourceSel)
        3'h0: out <= aluout;
        3'h1: out <= irout;
        3'h2: out <= memout;
        3'h3: out <= pcout;
        3'h4: out <= aout;
        default:;
    endcase
end
    
assign dataout = out;    
    
endmodule
