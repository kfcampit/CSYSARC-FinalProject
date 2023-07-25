`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 10:28:48 PM
// Design Name: 
// Module Name: LIT
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


module LIT(
    input [15:0] datain,
    output [15:0] dataout,
    input load,
    input clk,
    input rst
    );
    
reg [15:0] outputreg;

always @(posedge clk && load)
begin
    if (rst)
        outputreg <= 0;
    else
        outputreg <= datain;
end

assign dataout = outputreg;
    
endmodule
