module xor_blast (
     a, b, c,out
);
    input a, b, c;
    output out;
    wire w1,w2;
    assign w1 = a & b; 
    assign w2 = ~w1 & b;
    assign out = w2 & c;
endmodule
/*AGI
Object ID: 1, Name: a
Object ID: 2, Name: b
Object ID: 3, Name: c
Object ID: 4, Name: w1
Object ID: 5, Name: w2
Object ID: 6, Name: out
*/
