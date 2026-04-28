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
  
module fifo (
    input clk,
    input reset,
    input write_en,
    input read_en,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output full,
    output empty
);

reg [7:0] mem [0:3];
reg [2:0] write_ptr;
reg [2:0] read_ptr;
reg [2:0] count;

assign full = (count == 4);
assign empty = (count == 0);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        write_ptr <= 0;
        read_ptr <= 0;
        count <= 0;
        data_out <= 0;
    end else begin
        if (write_en && !full) begin
            mem[write_ptr] <= data_in;
            write_ptr <= write_ptr + 1;
            count <= count + 1;
        end

        if (read_en && !empty) begin
            data_out <= mem[read_ptr];
            read_ptr <= read_ptr + 1;
            count <= count - 1;
        end
    end
end

endmodule
