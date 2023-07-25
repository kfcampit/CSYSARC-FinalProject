`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 09:45:57 PM
// Design Name: 
// Module Name: MAR
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


module MAR(
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
