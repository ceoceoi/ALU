module sev_seg_top(
    input wire CLK100MHZ,    // using the same name as pin names
    input wire CPU_RESETN,   
    output wire CA, CB, CC, CD, CE, CF, CG, DP,
    output wire [7:0] AN,    
    input wire [15:0] SW     
);
   
logic reset_n;
logic clk;

assign reset_n = CPU_RESETN;
assign clk = CLK100MHZ;


// Design Start here
logic [3:0] a,b,f;
logic [1:0] s;

assign a = SW[3:0];
assign b = SW[7:4];
assign s = SW[9:8];
//assign f = SW[3:0];

ALU d (
        .a(a),
        .b(b),
        .s(s),
        .f(f)
       [3:0] 
    ); 
// Design ends here 


// Seven segments Controller
wire [6:0] Seg;
wire [3:0] digits[0:7];

assign digits[0] = f;
assign digits[1] = b;
assign digits[2] = a;
assign digits[3] = s;
assign digits[4] = 4'b1111;
assign digits[5] = 4'b1111;
assign digits[6] = 4'b1111;
assign digits[7] = 4'b1111;


sev_seg_controller ssc(
    .clk(clk),
    .resetn(reset_n),
    .digits(digits),
    .Seg(Seg),
    .AN(AN)
);


assign CA = Seg[0];
assign CB = Seg[1];
assign CC = Seg[2];
assign CD = Seg[3];
assign CE = Seg[4];
assign CF = Seg[5];
assign CG = Seg[6];
assign DP = 1'b1; // turn off the dot point on seven segs


endmodule : sev_seg_top