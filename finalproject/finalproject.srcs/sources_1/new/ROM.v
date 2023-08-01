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
            // Test 1
//            7'd000: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000110; end  // LDA $6
//            7'd002: begin outputreg[15:8] = 8'b00001001; outputreg[7:0] = 8'b00000000; end  // OUT
//            7'd004: begin outputreg[15:8] = 8'b00001010; outputreg[7:0] = 8'b00000000; end  // HLT
//            7'd006: begin outputreg[15:8] = 8'b00010010; outputreg[7:0] = 8'b11011010; end  // 12DA


            // Test 2
//            7'd000: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00001010; end  // LDA $10
//            7'd002: begin outputreg[15:8] = 8'b00000001; outputreg[7:0] = 8'b00001100; end  // LDB $12
//            7'd004: begin outputreg[15:8] = 8'b00000011; outputreg[7:0] = 8'b00000000; end  // ADDAB
//            7'd006: begin outputreg[15:8] = 8'b00001001; outputreg[7:0] = 8'b00000000; end  // OUT
//            7'd008: begin outputreg[15:8] = 8'b00001010; outputreg[7:0] = 8'b00000000; end  // HLT
//            7'd010: begin outputreg[15:8] = 8'b00010010; outputreg[7:0] = 8'b11011010; end  // 12DA
//            7'd012: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00010100; end  // 14

            // Test 3
//            7'd000: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00001010; end  // LDA $10
//            7'd002: begin outputreg[15:8] = 8'b00010001; outputreg[7:0] = 8'b00000000; end  // NOP
//            7'd004: begin outputreg[15:8] = 8'b00000100; outputreg[7:0] = 8'b00010100; end  // ADDAL 14h
//            7'd006: begin outputreg[15:8] = 8'b00001001; outputreg[7:0] = 8'b00000000; end  // OUT
//            7'd008: begin outputreg[15:8] = 8'b00001010; outputreg[7:0] = 8'b00000000; end  // HLT
//            7'd0010: begin outputreg[15:8] = 8'b00010010; outputreg[7:0] = 8'b11011010; end  // 12DA

            // Test 4
//            7'd000: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00001010; end  // LDA $10
//            7'd002: begin outputreg[15:8] = 8'b00000010; outputreg[7:0] = 8'b00001100; end  // LDC $12
//            7'd004: begin outputreg[15:8] = 8'b00000101; outputreg[7:0] = 8'b00000000; end  // ADDAC
//            7'd006: begin outputreg[15:8] = 8'b00001001; outputreg[7:0] = 8'b00000000; end  // OUT
//            7'd008: begin outputreg[15:8] = 8'b00001010; outputreg[7:0] = 8'b00000000; end  // HLT
//            7'd010: begin outputreg[15:8] = 8'b00010010; outputreg[7:0] = 8'b11011010; end  // 12DA
//            7'd012: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00010100; end  // 14

            // Test 5
//            7'd000: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00001010; end  // LDA $10
//            7'd002: begin outputreg[15:8] = 8'b00000001; outputreg[7:0] = 8'b00001100; end  // LDB $12
//            7'd004: begin outputreg[15:8] = 8'b00000110; outputreg[7:0] = 8'b00000000; end  // SUBAB
//            7'd006: begin outputreg[15:8] = 8'b00001001; outputreg[7:0] = 8'b00000000; end  // OUT
//            7'd008: begin outputreg[15:8] = 8'b00001010; outputreg[7:0] = 8'b00000000; end  // HLT
//            7'd010: begin outputreg[15:8] = 8'b00010010; outputreg[7:0] = 8'b11011010; end  // 12DA
//            7'd012: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00010100; end  // 14

            //  Test 6
//            7'd000: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00001010; end  // LDA $10
//            7'd002: begin outputreg[15:8] = 8'b00010001; outputreg[7:0] = 8'b00000000; end  // NOP
//            7'd004: begin outputreg[15:8] = 8'b00000111; outputreg[7:0] = 8'b00010100; end  // SUBAL 14h
//            7'd006: begin outputreg[15:8] = 8'b00001001; outputreg[7:0] = 8'b00000000; end  // OUT
//            7'd008: begin outputreg[15:8] = 8'b00001010; outputreg[7:0] = 8'b00000000; end  // HLT
//            7'd0010: begin outputreg[15:8] = 8'b00010010; outputreg[7:0] = 8'b11011010; end  // 12DA

            // Test 7
//            7'd000: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00001010; end  // LDA $10
//            7'd002: begin outputreg[15:8] = 8'b00000010; outputreg[7:0] = 8'b00001100; end  // LDC $12
//            7'd004: begin outputreg[15:8] = 8'b00001000; outputreg[7:0] = 8'b00000000; end  // SUBAC
//            7'd006: begin outputreg[15:8] = 8'b00001001; outputreg[7:0] = 8'b00000000; end  // OUT
//            7'd008: begin outputreg[15:8] = 8'b00001010; outputreg[7:0] = 8'b00000000; end  // HLT
//            7'd010: begin outputreg[15:8] = 8'b00010010; outputreg[7:0] = 8'b11011010; end  // 12DA
//            7'd012: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00010100; end  // 14

            // Test 8
//            7'd000: begin outputreg[15:8] = 8'b00001100; outputreg[7:0] = 8'b00000110; end  // JMP $6
//            7'd002: begin outputreg[15:8] = 8'b00010001; outputreg[7:0] = 8'b00000000; end  // NOP
//            7'd004: begin outputreg[15:8] = 8'b00010001; outputreg[7:0] = 8'b00000000; end  // NOP
//            7'd006: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00001100; end  // LDA $12
//            7'd008: begin outputreg[15:8] = 8'b00001001; outputreg[7:0] = 8'b00000000; end  // OUT
//            7'd010: begin outputreg[15:8] = 8'b00001010; outputreg[7:0] = 8'b00000000; end  // HLT
//            7'd012: begin outputreg[15:8] = 8'b00010010; outputreg[7:0] = 8'b11011010; end  // 12DA

            // Test 9
//            7'd000: begin outputreg[15:8] = 8'b00001101; outputreg[7:0] = 8'b00001010; end  // CALL $2
//            7'd002: begin outputreg[15:8] = 8'b00010001; outputreg[7:0] = 8'b00000000; end  // NOP
//            7'd004: begin outputreg[15:8] = 8'b00001001; outputreg[7:0] = 8'b00000000; end  // OUT
//            7'd006: begin outputreg[15:8] = 8'b00001010; outputreg[7:0] = 8'b00000000; end  // HLT
//            7'd008: begin outputreg[15:8] = 8'b00010001; outputreg[7:0] = 8'b00000000; end  // NOP
//            7'd010: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00001110; end  // LDA $14
//            7'd012: begin outputreg[15:8] = 8'b00001110; outputreg[7:0] = 8'b00000000; end  // RET
//            7'd014: begin outputreg[15:8] = 8'b00010010; outputreg[7:0] = 8'b11011010; end  // 12DA

            // Test 10
//            7'd000: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000110; end  // LDA $6
//            7'd002: begin outputreg[15:8] = 8'b00001111; outputreg[7:0] = 8'b00000000; end  // MOVAB
//            7'd004: begin outputreg[15:8] = 8'b00001010; outputreg[7:0] = 8'b00000000; end  // HLT
//            7'd006: begin outputreg[15:8] = 8'b00010010; outputreg[7:0] = 8'b11011010; end  // 12DA
            
            //  Test 11
//            7'd000: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000110; end  // LDA $6
//            7'd002: begin outputreg[15:8] = 8'b00010000; outputreg[7:0] = 8'b00000000; end  // MOVAC
//            7'd004: begin outputreg[15:8] = 8'b00001010; outputreg[7:0] = 8'b00000000; end  // HLT
//            7'd006: begin outputreg[15:8] = 8'b00010010; outputreg[7:0] = 8'b11011010; end  // 12DA

            // Test 12
//            7'd000: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00001000; end  // LDA $8
//            7'd002: begin outputreg[15:8] = 8'b00010010; outputreg[7:0] = 8'b00000000; end  // NOT
//            7'd004: begin outputreg[15:8] = 8'b00001001; outputreg[7:0] = 8'b00000000; end  // OUT
//            7'd006: begin outputreg[15:8] = 8'b00001010; outputreg[7:0] = 8'b00000000; end  // HLT
//            7'd008: begin outputreg[15:8] = 8'b00010010; outputreg[7:0] = 8'b11011010; end  // 12DA

            // Test 13
//            7'd000: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00001010; end  // LDA $10
//            7'd002: begin outputreg[15:8] = 8'b00000001; outputreg[7:0] = 8'b00001100; end  // LDB $12
//            7'd004: begin outputreg[15:8] = 8'b00010011; outputreg[7:0] = 8'b00000000; end  // ANDAB
//            7'd006: begin outputreg[15:8] = 8'b00001001; outputreg[7:0] = 8'b00000000; end  // OUT
//            7'd008: begin outputreg[15:8] = 8'b00001010; outputreg[7:0] = 8'b00000000; end  // HLT
//            7'd010: begin outputreg[15:8] = 8'b00010010; outputreg[7:0] = 8'b11011010; end  // 12DA
//            7'd012: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000010; end  // 2

//            // Test 14
//            7'd000: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00001010; end  // LDA $10
//            7'd002: begin outputreg[15:8] = 8'b00000001; outputreg[7:0] = 8'b00001100; end  // LDB $12
//            7'd004: begin outputreg[15:8] = 8'b00010100; outputreg[7:0] = 8'b00000000; end  // ORAB
//            7'd006: begin outputreg[15:8] = 8'b00001001; outputreg[7:0] = 8'b00000000; end  // OUT
//            7'd008: begin outputreg[15:8] = 8'b00001010; outputreg[7:0] = 8'b00000000; end  // HLT
//            7'd010: begin outputreg[15:8] = 8'b00010010; outputreg[7:0] = 8'b11011010; end  // 12DA
//            7'd012: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000101; end  // 5

            // Test 15
//            7'd000: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00001010; end  // LDA $10
//            7'd002: begin outputreg[15:8] = 8'b00000001; outputreg[7:0] = 8'b00001100; end  // LDB $12
//            7'd004: begin outputreg[15:8] = 8'b00010101; outputreg[7:0] = 8'b00000000; end  // XOR
//            7'd006: begin outputreg[15:8] = 8'b00001001; outputreg[7:0] = 8'b00000000; end  // OUT
//            7'd008: begin outputreg[15:8] = 8'b00001010; outputreg[7:0] = 8'b00000000; end  // HLT
//            7'd010: begin outputreg[15:8] = 8'b00010010; outputreg[7:0] = 8'b11011010; end  // 12DA
//            7'd012: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00000111; end  // 7

            // Test 16
            7'd000: begin outputreg[15:8] = 8'b00000000; outputreg[7:0] = 8'b00001000; end  // LDA $8
            7'd002: begin outputreg[15:8] = 8'b00001011; outputreg[7:0] = 8'b10000000; end  // STA $81
            7'd004: begin outputreg[15:8] = 8'b00001001; outputreg[7:0] = 8'b00000000; end  // OUT 
            7'd006: begin outputreg[15:8] = 8'b00001010; outputreg[7:0] = 8'b00000000; end  // HLT
            7'd008: begin outputreg[15:8] = 8'b00010010; outputreg[7:0] = 8'b11011010; end  // 12DA
            
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
