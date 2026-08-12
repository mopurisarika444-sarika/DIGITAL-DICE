`timescale 1ns/1ps

module digital_dice (
    input  wire       clk,
    input  wire       reset,
    input  wire       roll,
    output reg  [2:0] dice_value
);

    reg [2:0] counter;
    reg [3:0] roll_count;
    reg       rolling;

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            counter    <= 3'd1;
            roll_count <= 4'd0;
            rolling    <= 1'b0;
            dice_value <= 3'd1;
        end

        else begin

            // Continuously cycle through 1 to 6
            if (counter == 3'd6)
                counter <= 3'd1;
            else
                counter <= counter + 3'd1;

            // Start dice roll
            if (roll && !rolling) begin
                rolling    <= 1'b1;
                roll_count <= 4'd0;
            end

            // Rolling operation
            else if (rolling) begin

                if (roll_count == 4'd9) begin
                    rolling    <= 1'b0;
                    dice_value <= counter;
                    roll_count <= 4'd0;
                end

                else begin
                    roll_count <= roll_count + 4'd1;
                end

            end
        end
    end

endmodule