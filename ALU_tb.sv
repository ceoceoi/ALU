module ALU_tb;

    logic [3:0] a;
    logic [7:4] b;
    logic [9:8] s;;
    logic [3:0] f;
    logic carry;

    // Instantiate the ALU module
    ALU dut (
        .a(a),
        .b(b),
        .s(s),
        .f(f)
    );

    initial begin
//        $monitor("Time=%0t | a=%b, b=%b, s=%b | f=%b, w1=%b, cout=%b, shiftand_result=%b", 
//                 $time, a, b, s, f);

        // Test cases
        a = 4'b0101; b = 4'b1100; carry = 1'b0; s = 2'b00; // Add
        #10;

        a = 4'b1001; b = 4'b0111; carry = 1'b1; s = 2'b01; // Sub
        #10;

        a = 4'b0011; b = 4'b1010; carry = 1'b0; s = 2'b10; // Shift
        #10;

        a = 4'b1111; b = 4'b1100; s = 2'b11;              // AND
        #10;

        $finish;
    end

endmodule
