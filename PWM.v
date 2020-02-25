`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2020 10:24:20 PM
// Design Name: 
// Module Name: PWM_Generator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PWM_Generator(
            input clk,
            output reg PWM_output);
            
   reg [2:0] state;
   
   parameter DUTY_100 = 100000000;
   
   parameter DC_100 = 0;
   parameter DC_75  = 1;
   parameter DC_50  = 2;
   parameter DC_25  = 3;
   parameter DC_0   = 4;
   
   reg [31:0] counter; 
   reg [1:0] counter1;
   reg flag; // 0 --> Forward; 1--> Reverse
   
   initial 
   begin
		flag = 0;
		state = DC_0;
		counter = 0;
		counter1 = 0;
   end

   always@(posedge clk)
   begin   
        case (state)
            DC_0:   begin
                        if(counter == DUTY_100)
                        begin
	                        state = DC_25;                           							
                            counter = 0;
							flag = 0;
                        end
                        else
                        begin
                            state = DC_0;
							counter = counter + 1;
                        end
                        PWM_output = 1'b0;
                    end
            DC_25:  begin
                        if(counter1 == 0)
						begin
							PWM_output = 1'b1;
						end
						else
						begin
							PWM_output = 1'b0;
						end
						
						counter1 = counter1 + 1;
						
						if(counter == DUTY_100)
						begin
							if(flag == 0)
							begin
								state = DC_50;
							end
							else
							begin
								state = DC_0;
							end
							counter = 0;
							counter1 = 0;
						end
						else
						begin
							state = DC_25;
							counter = counter + 1;
						end
                    end
            DC_50:  begin
                        if(counter1 == 0 || counter1 == 1)
						begin
							PWM_output = 1'b1;
						end
						else
						begin
							PWM_output = 1'b0;
						end
						
						counter1 = counter1 + 1;
						
						if(counter == DUTY_100)
						begin
							if(flag == 0)
							begin						
								state = DC_75;
							end
							else
							begin
								state = DC_25;
							end
							counter = 0;
							counter1 = 0;
						end
						else
						begin
							state = DC_50;
							counter = counter + 1;
						end
                    end
            DC_75:  begin
                        if(counter1 == 0)
						begin
							PWM_output = 1'b0;
						end
						else
						begin
							PWM_output = 1'b1;
						end
						
						counter1 = counter1 + 1;
						
						if(counter == DUTY_100)
						begin
							if(flag == 0)
							begin
								state = DC_100;
							end
							else
							begin
								state = DC_50;								
							end
							counter = 0;
							counter1 = 0;
						end
						else
						begin
							state = DC_75;
							counter = counter + 1;
						end
                    end
            DC_100:   begin
                        if(counter == DUTY_100)
                        begin
                            state = DC_75;                           
                            counter = 0;
							flag = 1;
                        end
                        else
                        begin
                            state = DC_100;
							counter = counter + 1;
                        end
                        PWM_output = 1'b1;
                    end
        endcase        
   end
    
    
endmodule
