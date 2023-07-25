`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 10:41:27 PM
// Design Name: 
// Module Name: DATAPATH
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


module DATAPATH(
    input [2:0] pcopsel,
    input [2:0] aluopsel,
    input [1:0] regsel,
    input [3:0] destSel,
    input [2:0] sourceSel,
    input rd,
    input clk,
    output [15:0] output_port,
    input rst
    );
    
    wire [15:0] databus;
    wire ldMAR;
    wire ldMBR;
    wire ldA;
    wire ldB;
    wire ldC;
    wire ldLIT;
    wire ldIR;
    wire ldOUTR;
    
    wire [15:0] marout;
    wire [15:0] mbrout;
    wire [15:0] aout;
    wire [15:0] bout;
    wire [15:0] cout;
    wire [15:0] litout;
    wire [15:0] regselout;
    
    wire [15:0] pcout;
    wire [15:0] memout;
    wire [15:0] aluout;
    wire [15:0] irout;
    
    PC U1(pcopsel, databus, pcout, clk, rst);
    
    MAR U2(databus, marout, ldMAR, clk, rst);
    MBR U3(databus, mbrout, ldMBR, clk, rst);
    MEM_MODULE U4(marout[7:0], mbrout, memout, !rd, rd, clk, rst);
    
    A U5(databus, aout, ldA, clk, rst);
    B U6(databus, bout, ldB, clk, rst);
    C U7(databus, cout, ldC, clk, rst);
    LIT U8(databus, litout, ldLIT, clk, rst);
    OPERAND_MUX U9(bout, cout, litout, regselout, regsel, clk);
    
    ALU U10(aout, regselout, aluout, aluopsel, clk);
    
    IR U11(databus, irout, ldIR, clk, rst);
    OUTR U12(databus, output_port, ldOUTR, clk, rst);
    
    DEST_DEC U13(destSel, ldMAR, ldMBR, ldA, ldB, ldC, ldLIT, ldIR, ldOUTR, clk);
    SOURCE_MUX U14(pcout, memout, aluout, irout, aout, sourceSel, databus, clk);
    
endmodule
