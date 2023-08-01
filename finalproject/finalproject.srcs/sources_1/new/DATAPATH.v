`timescale 1ns / 1ps

module DATAPATH(
    input [2:0] pcopsel,
    input [2:0] aluopsel,
    input [1:0] regsel,
    input [3:0] destSel,
    input [2:0] sourceSel,
    input rd,
    input clk,
    input rst,
    output [15:0] output_port,
    output [7:0] opcode,
    
    // Testbench Outputs
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
    output [15:0] irout_tb
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
    wire [7:0] litout;
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
    
    assign marout_tb = marout;
    assign mbrout_tb = mbrout;
    assign aout_tb = aout;
    assign bout_tb = bout;
    assign cout_tb = cout;
    assign litout_tb = litout;
    assign regselout_tb = regselout;
    assign pcout_tb = pcout;
    assign memout_tb = memout;
    assign aluout_tb = aluout;
    assign irout_tb = irout;
    assign opcode = databus[15:8];
    
endmodule
