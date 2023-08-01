`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 10:27:23 PM
// Design Name: 
// Module Name: OPERAND_MUX
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


module OPERAND_MUX(
    input [15:0] dataB,
    input [15:0] dataC,
    input [7:0] dataLIT,
    output [15:0] dataout,
    input [1:0] regsel,
    input clk
    );
    
    
    
//reg [15:0] out;
    
//always @(posedge clk)
//begin
//    case(regsel)
//        2'b00: out = dataB;
//        2'b01: out = dataC;
//        2'b10: out = dataLIT;
//    endcase
//end
    
//assign dataout = out;

  assign dataout = (regsel == 2'b00) ? dataB :
                   (regsel == 2'b01) ? dataC :
                   (regsel == 2'b10) ? dataLIT :
                   'bx;

endmodule
