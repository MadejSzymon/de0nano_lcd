
module cnt #(BIT_SIZE = 21)(i_clk, i_ce, o_cnt);
	
	input i_clk;
	input i_ce;
	
	output logic [BIT_SIZE-1:0] o_cnt = 0;
	
	always@(posedge i_clk) begin
		if(i_ce)
			o_cnt <= o_cnt + 1'b1;
		else
			o_cnt <= 1'b0;
	end
		
endmodule 