module tail_lamp_controller(
    input turn_left, turn_right, emergency, clk, rst,
    output reg [2:0] left_indicator_lamp, right_indicator_lamp
);
    localparam s0 = 4'b0000, s1 = 4'b0001, s2 = 4'b0010, s3 = 4'b0011;
    localparam s4 = 4'b0100, s5 = 4'b0101, s6 = 4'b0110, s7 = 4'b0111;
    localparam s8 = 4'b1000, s9 = 4'b1001, s10 = 4'b1010, s11 = 4'b1011;
    localparam s12 = 4'b1100, s13 = 4'b1101, s14 = 4'b1110;

    reg [3:0] pst_state, nxt_state;

    // sequentail block for turn_left and turn_right
    always @(posedge clk) begin
        if (rst)
            pst_state <= s0;
        else
            pst_state <= nxt_state;
    end

    // sequentail block for emergency
    always @(clk, emergency) begin
        if (emergency) begin
            if (rst)
                pst_state <= s0;
            else
                pst_state <= nxt_state;
        end
    end

    // combinational block for turning left or right
    always @(turn_left, turn_right, emergency, pst_state) begin
        case (pst_state)
            s0: begin
                if (emergency)
                    nxt_state = s9;
                else if (turn_left && turn_right)
                    nxt_state = s0;
                else
                    nxt_state = turn_left ? s1 : (turn_right ? s5 : s0);
            end

            // TURN_LEFT
            s1: begin
                if (emergency)
                    nxt_state = s9;
                else if (turn_right)
                    nxt_state = s0;
                else
                    nxt_state = turn_left ? s2 : s0; 
            end
            s2: begin
                if (emergency)
                    nxt_state = s9;
                else if (turn_right)
                    nxt_state = s0;
                else
                    nxt_state = turn_left ? s3 : s0; 
            end
            s3: begin
                if (emergency)
                    nxt_state = s9;
                else if (turn_right)
                    nxt_state = s0;
                else
                    nxt_state = turn_left ? s4 : s0; 
            end
            s4: begin
                if (emergency)
                    nxt_state = s9;
                else if (turn_right)
                    nxt_state = s0;
                else
                    nxt_state = turn_left ? s1 : s0; 
            end

            // TURN_RIGHT
            s5: begin
                if (emergency)
                    nxt_state = s9;
                else if (turn_left)
                    nxt_state = s0;
                else
                    nxt_state = turn_right ? s6 : s0; 
            end
            s6: begin
                if (emergency)
                    nxt_state = s9;
                else if (turn_left)
                    nxt_state = s0;
                else
                    nxt_state = turn_right ? s7 : s0; 
            end
            s7: begin
                if (emergency)
                    nxt_state = s9;
                else if (turn_left)
                    nxt_state = s0;
                else
                    nxt_state = turn_right ? s8 : s0; 
            end
            s8: begin
                if (emergency)
                    nxt_state = s9;
                else if (turn_left)
                    nxt_state = s0;
                else
                    nxt_state = turn_right ? s5 : s0; 
            end

            // EMERGENCY
            s9: nxt_state = emergency ? s10 : s0;
            s10: nxt_state = emergency ? s11 : s0;
            s11: nxt_state = emergency ? s12 : s0;
            s12: nxt_state = emergency ? s13 : s0;
            s13: nxt_state = emergency ? s14 : s0;
            s14: nxt_state = emergency ? s9 : s0;

            default: nxt_state = s0;
        endcase
    end

    // output block
    always @(pst_state) begin
        case (pst_state)
            s0: begin
                left_indicator_lamp = 0;
                right_indicator_lamp = 0;
            end

            // TURN_LEFT
            s1: begin
                left_indicator_lamp = 0;
                right_indicator_lamp = 0;
            end
            s2: begin
                right_indicator_lamp = 0;
                left_indicator_lamp = 3'b001;
            end
            s3: begin
                right_indicator_lamp = 0;
                left_indicator_lamp = 3'b011;
            end
            s4: begin
                right_indicator_lamp = 0;
                left_indicator_lamp = 3'b111;
            end

            // TURN_RIGHT
            s5: begin
                left_indicator_lamp = 0;
                right_indicator_lamp = 0;
            end
            s6: begin
                left_indicator_lamp = 0;
                right_indicator_lamp = 3'b001;
            end
            s7: begin
                left_indicator_lamp = 0;
                right_indicator_lamp = 3'b011;
            end
            s8: begin
                left_indicator_lamp = 0;
                right_indicator_lamp = 3'b111;
            end

            // EMERGENCY
            s9: begin
                left_indicator_lamp = 0;
                right_indicator_lamp = 0;
            end
            s10: begin
                left_indicator_lamp = 3'b001;
                right_indicator_lamp = 3'b001;
            end
            s11: begin
                left_indicator_lamp = 3'b011;
                right_indicator_lamp = 3'b011;
            end
            s12: begin
                left_indicator_lamp = 3'b111;
                right_indicator_lamp = 3'b111;
            end
            s13: begin
                left_indicator_lamp = 3'b011;
                right_indicator_lamp = 3'b011;
            end
            s14: begin
                left_indicator_lamp = 3'b001;
                right_indicator_lamp = 3'b001;
            end

            default: begin
                left_indicator_lamp = 0;
                right_indicator_lamp = 0;
            end
        endcase
    end
endmodule