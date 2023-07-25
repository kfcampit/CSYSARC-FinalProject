`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 09:49:32 PM
// Design Name: 
// Module Name: RAM
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


module RAM(
    input wire [6:0] address,
    output wire [15:0] dataout,
    input wire [15:0] datain,
    input wire clk,
    input wire wr_en
    );
    
    reg [7:0] Mem[0:127];
    reg [7:0] internal_bus_upper;
    reg [7:0] internal_bus_lower;
    
    initial internal_bus_upper = Mem[address];
    initial internal_bus_lower = Mem[address + 1];
    
    always @address internal_bus_upper = Mem[address];
    always @address internal_bus_upper = Mem[address + 1];
    
    always @(posedge clk)
    begin
        if(wr_en)
        begin
            Mem[address] = datain[15:8];
            Mem[address + 1] = datain[7:0];
        end
        else
        begin
            internal_bus_upper = Mem[address];
            internal_bus_lower = Mem[address + 1];
        end
    end
    
    assign dataout[15:8] = internal_bus_upper;
    assign dataout[7:0] = internal_bus_lower;
    
endmodule
