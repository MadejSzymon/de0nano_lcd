
module cnt_inst #(BIT_SIZE = 21)(i_clk, i_ce, i_rst_inst, o_cnt);
	
	input i_clk;
	input i_ce;
	input i_rst_inst;
	
	output logic [BIT_SIZE-1:0] o_cnt = 0;
	
	always@(posedge i_clk) begin
		if(i_ce)
			o_cnt <= o_cnt + 1'b1;
		else if(i_rst_inst)
			o_cnt <= 1'b1;
	end
		
endmodule 