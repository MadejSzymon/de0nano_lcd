
module delay (i_clk, i_ce, i_end, o_delay_TO);
	
	input i_clk;
	input i_ce;
	input [17:0] i_end;
	
	logic [17:0] w_cnt = 0;
	
	output logic o_delay_TO = 0;
	
	always@(posedge i_clk) begin
		if(i_ce && w_cnt < i_end)  begin
			w_cnt <= w_cnt + 1'b1;
		end
		else if (i_ce && w_cnt == i_end) begin
			o_delay_TO <= 1'b1;
		end
		else begin
			o_delay_TO <= 1'b0;
			w_cnt <= 1'b0;
		end
	end
		
endmodule 