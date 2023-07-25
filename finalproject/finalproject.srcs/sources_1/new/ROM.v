`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 09:42:13 PM
// Design Name: 
// Module Name: ROM
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


module ROM(
    input wire [6:0] address,
    output wire [15:0] data,
    input wire clk,
    input wire rst,
    input wire rd
    );
    
reg [15:0] outputreg;
    
always@(posedge clk & rd)
begin
    if(rst) outputreg = 16'h00;
    else
    begin
        case (address)
            7'd000: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd002: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd004: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd006: begin outputreg[15:8] = 8'b11111111; outputreg[7:0] = 8'b11111111; end
            7'd008: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd010: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd012: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd014: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd016: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd018: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd020: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd022: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd024: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd026: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd028: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd030: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end 
            7'd032: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd034: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd036: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd038: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd040: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd040: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end 
            7'd042: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd044: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd046: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd048: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd040: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd050: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end 
            7'd052: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd054: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd056: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd058: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd060: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd062: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd064: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd066: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd068: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd070: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end 
            7'd072: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd074: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd076: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd078: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd080: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end 
            7'd082: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd084: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd086: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd088: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd090: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end 
            7'd092: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd094: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd096: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd098: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd100: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd102: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd104: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd106: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd108: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd120: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end 
            7'd122: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd124: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
            7'd126: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000000; end
        endcase
    end
end
   
assign data = outputreg;   
    
endmodule
