`timescale 1ns / 1ps

// The finite state machine for the contorl matrix is setup for the instructions.
// However only the LDA instruction has been implemented in the current version.

// Implementation of the rest of the instruction set can be done by adding to the case statements and making it inline with
// the microoperations from the design document.

module CONTROL_UNIT(
    output [2:0] pcopsel,
    output [2:0] aluopsel,
    output [1:0] regsel,
    output [3:0] destsel,
    output [2:0] sourcesel,
    output rd,
    input [7:0] opcode,
    input clk,
    input res,
    
    // State Testbench connections
    output [2:0] state_tb,
    output [1:0] statedelay_tb
    );
    
reg [2:0] state;
reg [2:0] pcopselreg;
reg [2:0] aluopselreg;
reg [1:0] regselreg;
reg [3:0] destselreg;
reg [2:0] sourceselreg;
reg rdreg;

reg [1:0] statedelay;

always @(posedge clk)
begin
    if (res)
    begin
        state = 0;
        pcopselreg = 0;
        aluopselreg = 0;
        regselreg = 0;
        destselreg = 0;
        sourceselreg = 0;
        rdreg = 0;
        
        statedelay = 0;
    end
    else
    begin
        case (state)
            3'h0:   //T0 - Fetch Cycle
            begin
                pcopselreg = 3'b111;
                destselreg = 4'b0101;
                sourceselreg = 3'b011;
                rdreg = 1'b0;              
                aluopselreg = 3'b111;
                regselreg = 2'b00;
                
                statedelay = statedelay + 1;
                if (statedelay == 2'b11)
                begin
                    state = state + 1;
                    statedelay = 0;
                end
                
            end
            
            3'h1:   //T1 - Fetch Cycle
            begin
                
                destselreg = 4'b0011;
                sourceselreg = 3'b010;
                rdreg = 1'b1;              
                aluopselreg = 3'b111;
                regselreg = 2'b00;
                 
                statedelay = statedelay + 1;
                if (statedelay == 2'b11)
                begin
                    pcopselreg = 3'b001;
                    state = state + 1;
                    statedelay = 0;
                end
            end
            
            3'h2:   // T2
            begin
                case (opcode)
                    7'd0:   // LDA
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0101;
                        sourceselreg = 3'b001;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b111;
                        regselreg = 2'b00;
                         
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b11)
                        begin
                            state = state + 1;
                            statedelay = 0;
                        end    
                    end 
            
                    7'd1:   // LDB
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0101;
                        sourceselreg = 3'b0001;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b111;
                        regselreg = 2'b00;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b11)
                        begin
                            state = state + 1;
                            statedelay = 0;
                        end
                    end 
                    
                    7'd2:   // LDC
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0101;
                        sourceselreg = 3'b001;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b111;
                        regselreg = 2'b00;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b11)
                        begin
                            state = state + 1;
                            statedelay = 0;
                        end
                    end
                    
                    7'd3:   // ADDAB
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b10)
                        begin
                            state = 0;
                            statedelay = 0;
                        end
                    end
                    
                    7'd4:   // ADDAL
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0100;
                        sourceselreg = 3'b001;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b111;
                        regselreg = 2'b00;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b11)
                        begin
                            state = state + 1;
                            statedelay = 0;
                        end
                    end
                    
                    7'd5:   // ADDAC
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b01;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b10)
                        begin
                            state = 0;
                            statedelay = 0;
                        end
                    end
                    
                    7'd6:   // SUBAB
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b001;
                        regselreg = 2'b00;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b10)
                        begin
                            state = 0;
                            statedelay = 0;
                        end
                    end
                    
                    7'd7:   // SUBAL
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0100;
                        sourceselreg = 3'b001;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b111;
                        regselreg = 2'b00;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b11)
                        begin
                            state = state + 1;
                            statedelay = 0;
                        end
                    end
                    
                    7'd8:   // SUBAC
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b001;
                        regselreg = 2'b01;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b10)
                        begin
                            state = 0;
                            statedelay = 0;
                        end
                    end
                    
                    7'd9:   // OUT
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0111;
                        sourceselreg = 3'b100;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b111;
                        regselreg = 2'b00;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b11)
                        begin
                            state = 0;
                            statedelay = 0;
                        end
                    end
                    
                    7'd10:   // HLT
                    begin
                        state = 3'b111;
                        pcopselreg = 3'b111;
                    end
                        
                    7'd11:   // STA
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0101;
                        sourceselreg = 3'b001;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b111;
                        regselreg = 2'b00;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b11)
                        begin
                            state = state + 1;
                            statedelay = 0;
                        end
                    end
                    
                    7'd12:   // JMP
                    begin
                        pcopselreg = 3'b010;
                        destselreg = 4'b1111;
                        sourceselreg = 3'b001;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b111;
                        regselreg = 2'b00;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b11)
                        begin
                            state = 0;
                            statedelay = 0;
                        end
                    end
                    
                    7'd13:   // CALL
                    begin
                        pcopselreg = 3'b011;
                        destselreg = 4'b1111;
                        sourceselreg = 3'b011;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b111;
                        regselreg = 2'b00;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b11)
                        begin
                            state = state + 1;
                            statedelay = 0;
                        end
                    end
                    
                    7'd14:   // RET
                    begin
                        pcopselreg = 3'b100;
                        destselreg = 4'b1111;
                        sourceselreg = 3'b111;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b111;
                        regselreg = 2'b00;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b11)
                        begin
                            state = 0;
                            statedelay = 0;
                        end
                    end
                    
                    7'd15:   // MOVAB
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0001;
                        sourceselreg = 3'b100;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b111;
                        regselreg = 2'b00;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b11)
                        begin
                            state = 0;
                            statedelay = 0;
                        end
                    end
                    
                    7'd16:   // MOVAC
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0010;
                        sourceselreg = 3'b100;
                        rdreg = 1'b0;             
                        aluopselreg = 3'b111;
                        regselreg = 2'b00;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b11)
                        begin
                            state = 0;
                            statedelay = 0;
                        end
                    end
                    
                    7'd17:   // NOP
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b1111;
                        sourceselreg = 3'b111;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b111;
                        regselreg = 2'b00;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b11)
                        begin
                            state = 0;
                            statedelay = 0;
                        end
                    end
                    
                    7'd18:   // NOTA
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b010;
                        regselreg = 2'b00;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b10)
                        begin
                            state = 0;
                            statedelay = 0;
                        end
                    end
                    
                    7'd19:   // AND
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b011;
                        regselreg = 2'b00;
                         
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b10)
                        begin
                            state = 0;
                            statedelay = 0;
                        end    
                    end 
                    
                    7'd20:   // OR
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b100;
                        regselreg = 2'b00;
                         
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b10)
                        begin
                            state = 0;
                            statedelay = 0;
                        end       
                    end 
                    
                    7'd21:   // XOR
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b101;
                        regselreg = 2'b00;
                         
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b10)
                        begin
                            state = 0;
                            statedelay = 0;
                        end      
                    end 
                                         
                endcase
            end
            
            3'h3:   // T3
            begin 
                case (opcode)
                    7'd0:   // LDA
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b010;
                        rdreg = 1'b1;              
                        aluopselreg = 3'b111;
                        regselreg = 2'b00;
                         
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b11)
                        begin
                            state = 0;
                            statedelay = 0;
                        end 
                    end
                    
                    7'd1:   // LDB
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0001;
                        sourceselreg = 3'b010;
                        rdreg = 1'b1;              
                        aluopselreg = 3'b111;
                        regselreg = 2'b00;
                         
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b11)
                        begin
                            state = 0;
                            statedelay = 0;
                        end 
                    end
                    
                    7'd2:   // LDC
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0010;
                        sourceselreg = 3'b010;
                        rdreg = 1'b1;              
                        aluopselreg = 3'b111;
                        regselreg = 2'b00;
                         
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b11)
                        begin
                            state = 0;
                            statedelay = 0;
                        end 
                    end
                    
                    7'd4:   // ADDAL
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b10;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b10)
                        begin
                            state = 0;
                            statedelay = 0;
                        end
                    end
                    
                    7'd7:   // SUBAL
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b001;
                        regselreg = 2'b10;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b10)
                        begin
                            state = 0;
                            statedelay = 0;
                        end
                    end
                    
                    7'd11:  // STA
                    begin
                        pcopselreg = 3'b111;
                        destselreg = 4'b0110;
                        sourceselreg = 3'b100;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b111;
                        regselreg = 2'b00;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b11)
                        begin
                            state = 0;
                            statedelay = 0;
                        end
                    end
                    
                    7'd13:  // CALL
                    begin
                        pcopselreg = 3'b010;
                        destselreg = 4'b1111;
                        sourceselreg = 3'b001;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b111;
                        regselreg = 2'b00;
                        
                        statedelay = statedelay + 1;
                        if (statedelay == 2'b11)
                        begin
                            state = 0;
                            statedelay = 0;
                        end
                    end

                endcase
            end
            
            3'h4:;
            
            3'h5:;
            
            default:;            
        endcase
    end
end

assign pcopsel = pcopselreg;
assign aluopsel = aluopselreg;
assign regsel = regselreg;
assign destsel = destselreg;
assign sourcesel = sourceselreg;
assign rd = rdreg;

assign state_tb = state;    
assign statedelay_tb = statedelay;
    
endmodule
