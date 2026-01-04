module complex_trace (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout,
    output parity
);
    // --- PART 1: The Valid Logic (Ripple Carry Adder) ---
    // This creates a deep chain of dependencies (C0 -> C1 -> C2 -> C3)
    // ABC will try to flatten this chain (Tree Balancing).
    
    wire [4:0] c;
    assign c[0] = cin;

    // Bit 0
    assign sum[0] = a[0] ^ b[0] ^ c[0];
    assign c[1]   = (a[0] & b[0]) | (c[0] & (a[0] ^ b[0]));

    // Bit 1
    assign sum[1] = a[1] ^ b[1] ^ c[1];
    assign c[2]   = (a[1] & b[1]) | (c[1] & (a[1] ^ b[1]));

    // Bit 2
    assign sum[2] = a[2] ^ b[2] ^ c[2];
    assign c[3]   = (a[2] & b[2]) | (c[3] & (a[2] ^ b[2]));

    // Bit 3
    assign sum[3] = a[3] ^ b[3] ^ c[3];
    assign cout   = (a[3] & b[3]) | (c[3] & (a[3] ^ b[3]));


    // --- PART 2: The Redundant Logic (Merge Test) ---
    // This calculates parity using XORs. 
    // Notice that (a[0] ^ b[0]) was ALREADY calculated above for sum[0].
    // ABC should initially make new nodes, then '&strash' should MERGE them.
    assign parity = (a[0] ^ b[0]) ^ (a[1] ^ b[1]) ^ (a[2] ^ b[2]) ^ (a[3] ^ b[3]);


    // --- PART 3: The Dead Logic (Deletion Test) ---
    // This logic is valid, but nobody listens to 'dead_wire'.
    // '&sweep' should detect this is dangling and DELETE these nodes.
    wire dead_wire;
    assign dead_wire = (a[0] & a[1]) | (b[0] & b[1]);

endmodule
