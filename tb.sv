import pkg::*;
`timescale 1ns/100ps
module tb();
	
	logic i_board_clk;
	logic o_E;
	logic o_RS;
	logic [7:0] o_data;	
	logic w_delay_TO;
	logic [3:0] w_inst_cnt;
	logic [20:0] w_cnt_21;
	logic [1:0] w_cnt_2;
	logic [3:0] w_cnt_4;
	logic w_cnt_21_ce;
	logic w_cnt_2_ce;
	logic w_cnt_4_ce;
	logic w_next_data;
	logic w_delay_enb;
	fsm_states state;
	fsm_states next;
	logic [17:0] w_delay_mux_out;
	logic [17:0] w_cnt;
	
	initial begin
		i_board_clk <= 1'b0;	
	end
	
	always begin
		#10;
		i_board_clk <= !i_board_clk;
	end
	
	top DUT(
		.*
	);
endmodule 