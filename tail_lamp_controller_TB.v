module testBench_tail_lamp_controller;
reg turn_left, turn_right, emergency, clk, rst;
wire [2:0] left_indicator_lamp, right_indicator_lamp;

tail_lamp_controller DUT(
    turn_left, turn_right, emergency, clk, rst,
    left_indicator_lamp, right_indicator_lamp
);

initial begin
    clk = 0;
    rst = 1;
    turn_left=0; turn_right=0; emergency=0;
    #10 rst = 0;
    repeat(25)
        @(posedge clk);
    $finish;
end

initial begin
    #15 turn_left=1; turn_right=0; emergency=0;
    #60 turn_left=0; turn_right=0; emergency=0;
    #10 turn_left=0; turn_right=1; emergency=0;
    #70 turn_left=0; turn_right=0; emergency=0;
    #10 turn_left=0; turn_right=0; emergency=1;
end

always #5 clk = ~clk;

initial begin
    $dumpfile("tail_lamp_controller_dumpfile.vcd");
	$dumpvars;
end
endmodule