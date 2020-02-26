
//Program for blinking LED
module example(clk, A, duty_cyc);
	input clk;
	input wire[3:0] duty_cyc;
	output reg A;


reg[26:0] delay;

always@(posedge clk) begin
if(A==0)
begin
		delay = delay+1;
		if(delay==10000000*duty_cyc)
		begin
			delay=27'b0;
			A=!A;
		end
end 

if(A==1)
begin
		delay = delay+1;
		if(delay==10000000*(15-duty_cyc))
		begin
			delay=27'b0;
			A=!A;
		end
end

end
endmodule
