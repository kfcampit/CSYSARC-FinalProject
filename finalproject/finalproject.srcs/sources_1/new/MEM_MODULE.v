`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 09:52:00 PM
// Design Name: 
// Module Name: MEM_MODULE
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


//module ROM(
//    input wire [6:0] address,
//    output reg [15:0] data,
//    input wire clk,
//    input wire res,
//    input wire rd
//    );

//module RAM(
//    input wire [6:0] address,
//    output reg [15:0] dataout,
//    input wire [15:0] datain,
//    input wire clk,
//    input wire wr_en
//    );

module MEM_MODULE(
    input wire [7:0] address,
    input wire [15:0] datain,
    output wire [15:0] dataout,
    input wire wr_en,
    input wire rd,
    input wire clk,
    input wire rst
    );
    
    
    wire [15:0] romout;
    wire [15:0] ramout;
    
    ROM U1(address[6:0], romout, clk, rst, rd);
    RAM U2(address[6:0], ramout, datain, clk, wr_en);
    _2TO1_MUX U3(romout, ramout, dataout, address[7], clk);
    

endmodule
