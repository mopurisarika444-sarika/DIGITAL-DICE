`timescale 1ns/1ps

module digital_dice_tb;

    reg       clk;
    reg       reset;
    reg       roll;

    wire [2:0] dice_value;

    // --------------------------------
    // Instantiate DUT
    // --------------------------------
    digital_dice uut (
        .clk        (clk),
        .reset      (reset),
        .roll       (roll),
        .dice_value (dice_value)
    );

    // --------------------------------
    // Clock generation
    // --------------------------------
    initial begin
        clk = 1'b0;

        forever #5 clk = ~clk;
    end

    // --------------------------------
    // Generate VCD waveform
    // --------------------------------
    initial begin
        $dumpfile("digital_dice.vcd");
        $dumpvars(0, digital_dice_tb);
    end

    // --------------------------------
    // Test sequence
    // --------------------------------
    initial begin

        $display("======================================");
        $display("       DIGITAL DICE TESTBENCH         ");
        $display("======================================");

        // Initial state
        reset = 1'b1;
        roll  = 1'b0;

        #20;

        // Release reset
        reset = 1'b0;

        // --------------------------------
        // Roll 1
        // --------------------------------
        $display("Rolling Dice - Attempt 1");

        #20;
        roll = 1'b1;
        #10;
        roll = 1'b0;

        #150;

        $display("Dice Result = %d", dice_value);

        // --------------------------------
        // Roll 2
        // --------------------------------
        $display("Rolling Dice - Attempt 2");

        #30;
        roll = 1'b1;
        #10;
        roll = 1'b0;

        #150;

        $display("Dice Result = %d", dice_value);

        // --------------------------------
        // Roll 3
        // --------------------------------
        $display("Rolling Dice - Attempt 3");

        #30;
        roll = 1'b1;
        #10;
        roll = 1'b0;

        #150;

        $display("Dice Result = %d", dice_value);

        // --------------------------------
        // Roll 4
        // --------------------------------
        $display("Rolling Dice - Attempt 4");

        #30;
        roll = 1'b1;
        #10;
        roll = 1'b0;

        #150;

        $display("Dice Result = %d", dice_value);

        // --------------------------------
        // Finish
        // --------------------------------
        $display("======================================");
        $display("       SIMULATION COMPLETED           ");
        $display("======================================");

        $finish;

    end

    // --------------------------------
    // Monitor
    // --------------------------------
    initial begin
        $monitor(
            "Time=%0t | Reset=%b | Roll=%b | Counter=%d | Rolling=%b | Dice=%d",
            $time,
            reset,
            roll,
            uut.counter,
            uut.rolling,
            dice_value
        );
    end

endmodule