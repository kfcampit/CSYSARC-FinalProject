`timescale 1us / 1us
module EMSAP_tb;

    reg clk;
    reg rst;
    wire [15:0] outputport;
    
    // DATPATH Testbench connections
    wire [15:0] marout_tb;
    wire [15:0] mbrout_tb;
    wire [15:0] aout_tb;
    wire [15:0] bout_tb;
    wire [15:0] cout_tb;
    wire [15:0] litout_tb;
    wire [15:0] regselout_tb;
    wire [15:0] pcout_tb;
    wire [15:0] memout_tb;
    wire [15:0] aluout_tb;
    wire [15:0] irout_tb;
    wire [7:0] opcode_tb;
    
    // CONTROL_UNIT Testbench connections
    wire [2:0] pcopsel_tb;
    wire [2:0] aluopsel_tb;
    wire [1:0] regsel_tb;
    wire [3:0] destSel_tb;
    wire [2:0] sourceSel_tb;
    wire rd_tb;
    
    wire [2:0] state_tb;
    wire [1:0] statedelay_tb;

    parameter step = 2;
    
    // Instantiate the Unit Under Test (UUT)
    SAP uut (
    .clk(clk),
    .rst(rst),
    .outputport(outputport),
    
    .marout_tb(marout_tb),
    .mbrout_tb(mbrout_tb),
    .aout_tb(aout_tb),
    .bout_tb(bout_tb),
    .cout_tb(cout_tb),
    .litout_tb(litout_tb),
    .regselout_tb(regselout_tb),
    .pcout_tb(pcout_tb),
    .memout_tb(memout_tb),
    .aluout_tb(aluout_tb),
    .irout_tb(irout_tb),
    .opcode_tb(opcode_tb),
    
    .pcopsel_tb(pcopsel_tb),
    .aluopsel_tb(aluopsel_tb),
    .regsel_tb(regsel_tb),
    .destSel_tb(destSel_tb),
    .sourceSel_tb(sourceSel_tb),
    .rd_tb(rd_tb),
    
    .state_tb(state_tb),
    .statedelay_tb(statedelay_tb)
    );
    
    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
    end
    
    always #(step/2) clk = ~clk;
    
    initial begin
        #step;
        #step rst = 1;
        #step rst = 0;
        
    end
endmodule
