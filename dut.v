
===============  Checks if any 2 consecutive bits are all 1s =================
module consecutive_ones_detector (
    input wire [31:0] in,
    output wire detected
);
    assign detected_2 = |(in & (in >> 1));
endmodule


===============  Checks if any 3 consecutive bits are all 1s =================
module consecutive_ones_detector (
    input wire [31:0] in,
    output wire detected_3
);
    assign detected_3 = |(in & (in >> 1) & (in >> 2));
endmodule


===============  Checks if any 4 consecutive bits are all 1s =================
module consecutive_ones_detector (
    input wire [31:0] in,
    output wire detected_4
);
    assign detected_4 = |(in & (in >> 1) & (in >> 2) & (in >> 3));
endmodule

===============  Checks if any 5 consecutive bits are all 1s =================
module consecutive_ones_detector (
    input wire [31:0] in,
    output wire detected_5
);
    assign detected_5 = |(in & (in >> 1) & (in >> 2) & (in >> 3) & (in >> 4));
endmodule

