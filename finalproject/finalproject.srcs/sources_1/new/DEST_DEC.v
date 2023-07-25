`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 10:30:36 PM
// Design Name: 
// Module Name: DEST_DEC
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


module DEST_DEC(
    input [3:0] destSel,
    output ldMAR,
    output ldMBR,
    output ldA,
    output ldB,
    output ldC,
    output ldLIT,
    output ldIR,
    output ldOUTR,
    input clk
    );
    
    reg [7:0] load;
    
    initial load = 0;
    
    always @(posedge clk)
    begin
        case (destSel)
            4'h0: load = 8'b00000001;
            4'h1: load = 8'b00000010;
            4'h2: load = 8'b00000100;
            4'h3: load = 8'b00001000;
            4'h4: load = 8'b00010000;
            4'h5: load = 8'b00100000;
            4'h6: load = 8'b01000000;
            4'h7: load = 8'b10000000;
            default:;
        endcase
    end
    
    assign ldA = load[0];
    assign ldB = load[1];
    assign ldC = load[2];
    assign ldIR = load[3];
    assign ldLIT = load[4];
    assign ldMAR = load[5];
    assign ldMBR = load[6];
    assign ldOUTR = load[7];
    
endmodule
