module medium_trace (
    a,b,c,d,out
);
    input a, b, c, d;
    output out;
    wire node_X,node_Y,dead_logic;
    assign node_X = a & b;
    assign node_Y = b & a;    // no GIA node (same to node_X)
    assign dead_logic = c & d;// no GIA node (!resursive out)
    assign out = node_X | node_Y;

endmodule


module vanishing (
     a, b,
     out
);
    output out;
    input a, b;
    wire impossible;
    assign impossible = a & ~a; // nothing on GIA
    assign out = b | impossible;// direct connection to b
endmodule

