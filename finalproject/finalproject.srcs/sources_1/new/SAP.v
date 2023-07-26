`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2023 03:38:19 PM
// Design Name: 
// Module Name: SAP
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


module SAP(
    input clk,
    input rst,
    output [15:0] outputport,
    
    // DATPATH Testbench connections
    output [15:0] marout_tb,
    output [15:0] mbrout_tb,
    output [15:0] aout_tb,
    output [15:0] bout_tb,
    output [15:0] cout_tb,
    output [15:0] litout_tb,
    output [15:0] regselout_tb,
    output [15:0] pcout_tb,
    output [15:0] memout_tb,
    output [15:0] aluout_tb,
    output [15:0] irout_tb,
    output [7:0] opcode_tb,
    
    // CONTROL_UNIT Testbench connections
    output [2:0] pcopsel_tb,
    output [2:0] aluopsel_tb,
    output [1:0] regsel_tb,
    output [3:0] destSel_tb,
    output [2:0] sourceSel_tb,
    output rd_tb
    );
    
    wire [2:0] pcopsel;
    wire [2:0] aluopsel;
    wire [1:0] regsel;
    wire [3:0] destSel;
    wire [2:0] sourceSel;
    wire rd;
    wire [7:0] opcode;
    
    CONTROL_UNIT U1(
        pcopsel,
        aluopsel,
        regsel,
        destSel,
        sourceSel,
        rd,
        opcode,
        clk,
        rst
    );
    
    assign pcopsel_tb = pcopsel;
    assign aluopsel_tb = aluopsel;
    assign regsel_tb = regsel;
    assign destSel_tb = destSel;
    assign sourceSel_tb = sourceSel;
    assign rd_tb = rd;
    assign opcode_tb = opcode;
    
    
    DATAPATH U2(
        pcopsel,
        aluopsel,
        regsel,
        destSel,
        sourceSel,
        rd,
        clk,
        rst,
        outputport,
        opcode,
        
        marout_tb,
        mbrout_tb,
        aout_tb,
        bout_tb,
        cout_tb,
        litout_tb,
        regselout_tb,
        pcout_tb,
        memout_tb,
        aluout_tb,
        irout_tb
    );
    
endmodule
