`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2024 01:19:55 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
 input  logic [3:0] a,
    input  logic [7:4] b,
    //input  logic carry,
    input  logic [9:8] s,
    //output logic [3:0] w1,
    output logic [3:0] f);
    //output logic cout,
    
 logic [3:0] w1;  
 logic mode,cout;
 assign mode = s[8];
 
 
    FourBitAddSub inst1(
        .a(a[3:0]),
        .b(b[7:4]),
        .sum(w1[3:0]),
        .carry(mode),
        .cout(cout)
        );
 
    
     logic [3:0] shiftand_result;
      always@ (a,b,shiftand_result)
    case (s[8])
        1'b0: shiftand_result = a << b;  // Shift
        1'b1: shiftand_result = a & b;  // AND
    endcase
    
    
always@ (*)
    case (s[9])
        1'b0: f =  w1; 
        1'b1: f = shiftand_result;  
    endcase

    
    
    
endmodule
