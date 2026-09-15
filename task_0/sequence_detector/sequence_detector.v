// Verilog code for Sequence Detector
    // Define Sequence Detector module
    module sequence_detector (
        input clock,
        input [3:0] number, // Define input ports clock, number
        output reg pattern // Define output port patter
    );


	 //////////////////////////////////////////////
    // Define your State Machine Parameters Here
    parameter ST_IDLE = 0;
	 parameter SONE = 1;
	 parameter SONE_ZERO = 2;
	 parameter SONE_ZERO_NINE = 3;
	 parameter SONE_ZERO_NINE_FOUR =4;
	 //////////////////////////////////////////////

    // defining 2-bit register
    reg [2:0] state = ST_IDLE;

    initial begin // define initial state output register
        pattern = 0;
    end

    always @(posedge clock) begin
        pattern = 0;
        case (state)
			   ///////////////////////////////////////
				// Do not modify above part of the code
            // Write your state machine here
				ST_IDLE: begin
					// you can read input inside always block like this
					 if (number == 1) state = SONE;
				end
				SONE: begin
				    if (number==0) state = SONE_ZERO;
					 else if (number==1) state = SONE;
					 else state = ST_IDLE;
				end
			   SONE_ZERO: begin
				    if (number==9) state = SONE_ZERO_NINE;
					 else if (number==1) state = SONE;
					 else state = ST_IDLE;
				end
				SONE_ZERO_NINE: begin
				    if (number==4) begin
					 state = SONE_ZERO_NINE_FOUR;
					 pattern=1;
					 end
					 else if (number==1) state = SONE;
					 else state = ST_IDLE;
				end
				SONE_ZERO_NINE_FOUR: begin
				    if (number == 1) state = SONE;
					 else state = ST_IDLE;
				end
			       // write your own logic here
					 // Do not modify below part of the code
					 ///////////////////////////////////////
        endcase
    end

    endmodule