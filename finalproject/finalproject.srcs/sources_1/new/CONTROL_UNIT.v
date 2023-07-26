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
    input res
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
            
                    7'd1:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd2:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd3:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                                        
                    7'd4:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd5:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd6:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd7:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd8:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd9:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd10:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd11:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd12:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd13:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd14:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd15:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd16:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd17:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd18:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd19:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd20:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd21:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
                    end 
                    
                    7'd22:
                    begin
                        pcopselreg = 3'b000;
                        destselreg = 4'b0000;
                        sourceselreg = 3'b000;
                        rdreg = 1'b0;              
                        aluopselreg = 3'b000;
                        regselreg = 2'b00;
                         
                        state = state + 1;
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
                endcase
            end
            
            3'h4:
            begin 
                
            end
            
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
    
endmodule
