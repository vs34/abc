module xor_blast (
     a, b, c,
     out
);
    input a, b, c;
    output out;
    // This looks simple, but in GIA it will be 9-10 AND gates.
    // Watch how 3 inputs create a huge list of nodes.
    assign out = a ^ b ^ c; 
endmodule
