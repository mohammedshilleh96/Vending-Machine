module seven_Segment(inputs , out);
input inputs;
output out;

wire [3:0] inputs;
reg  [6:0] out;

always@(inputs)
begin
	case (inputs)
	0:out =7'b1000000;
	1:out =7'b1111001;
	2:out =7'b0100100;
	3:out =7'b0110000;
	4:out =7'b0011001;
	5:out =7'b0010010;
	6:out =7'b0000010;
	7:out =7'b1111000;
	8:out =7'b0000000;
	9:out =7'b0010000;
	10: out = 7'b1100001;
	11: out = 7'b0000011;
	12: out = 7'b0010010;

	endcase
end
endmodule
