module fifo_tb;

reg clk;
reg reset;
reg write_en;
reg read_en;
reg [7:0] data_in;
wire [7:0] data_out;
wire full;
wire empty;

fifo dut (
    .clk(clk),
    .reset(reset),
    .write_en(write_en),
    .read_en(read_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
  $dumpvars(0, fifo_tb);

    clk = 0;
    reset = 1;
    write_en = 0;
    read_en = 0;
    data_in = 0;

    #10 reset = 0;

    // Write data
    write_en = 1;
    data_in = 8'd10; #10;
    data_in = 8'd20; #10;
    data_in = 8'd30; #10;
    data_in = 8'd40; #10;
    write_en = 0;

    // Read data
    read_en = 1; #10;
    $display("Read Data: %d", data_out);
    #10;
    $display("Read Data: %d", data_out);
    #10;
    $display("Read Data: %d", data_out);
    #10;
    $display("Read Data: %d", data_out);
    read_en = 0;

    $finish;
end

endmodule
