module traffic_fsm(clk, reset, count, light);

input clk;
input reset;

output reg [6:0] count;
output reg [1:0] light;

reg [1:0] state, next_state;
parameter C30 = 2'b00;
parameter C5 = 2'b01;
parameter C90 = 3'b10;

parameter RED = 2'b00;
parameter YELLOW = 2'b01;
parameter GREEN = 2'b10;

always @ (posedge clk or posedge reset) begin
	if(reset) begin
		count <= 0;
		state <= C30;
	end
	else begin
		count <= count+1'b1;
		state <= next_state;
	end
end

always @ (state or count) begin
	case (state)
	C30: if(count == 7'b001_1101) begin
		next_state = C90;
		count = 7'b0;
	    end
	    else next_state = C30;
	C5: if(count == 7'b000_0101) begin
		next_state = C30;
		count = 7'b0;
	    end
	    else next_state = C5;
	C90: if(count == 7'b101_1010) begin
		next_state = C5;
		count = 7'b0;
	    end
	    else next_state = C90;
	endcase
end

always @ (state) begin
	if(state == C30) light = RED;
	else if(state == C5) light = YELLOW;
	else if(state == C90) light = GREEN;
end
endmodule
