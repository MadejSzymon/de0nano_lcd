
module cnt_rx(i_clk, i_ce, i_rst, o_cnt);
	
	input i_clk;
	input i_ce;
	input i_rst;
	
	output logic [5:0] o_cnt = 0;
	
	always@(posedge i_clk) begin
		if(i_ce)
			o_cnt <= o_cnt + 1'b1;
		else if(i_rst)
			o_cnt <= 1'b0;
	end
		
endmodule 