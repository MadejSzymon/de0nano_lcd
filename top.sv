import pkg::*;
module top(i_board_clk, i_data_rx, o_RS, o_data, o_E);
	
	input i_board_clk;
	input i_data_rx;
	////////////////////////
	logic w_delay_TO;
	logic [5:0] w_inst_cnt;
	logic [20:0] w_cnt_21;
	logic [1:0] w_cnt_2;
	logic [3:0] w_cnt_4;
	logic w_cnt_21_ce;
	logic w_cnt_2_ce;
	logic w_cnt_4_ce;
	logic w_next_data;
	logic w_delay_enb;
	logic w_enb_rx;
	logic [DATA_BITS-1:0] w_data_rx;
	logic w_ready_rx;
	logic [5:0] w_ready_cnt;
	logic w_rst_cnt_rx;
	logic [255:0] w_data;
	logic r_ready_rx_del = 0;
	logic w_rst_inst;
	///////////////////////
	
	output o_RS;
	output [7:0] o_data;
	output o_E;
	
	
	fsm fsm(
	.i_clk(i_board_clk),
	.i_delay_TO(w_delay_TO),
	.i_inst_cnt(w_inst_cnt),
	.i_cnt_21(w_cnt_21),
	.i_cnt_2(w_cnt_2),
	.i_cnt_4(w_cnt_4),
	.i_ready_cnt(w_ready_cnt),
	.o_cnt_21_ce(w_cnt_21_ce),
	.o_cnt_2_ce(w_cnt_2_ce),
	.o_cnt_4_ce(w_cnt_4_ce),
	.o_next_data(w_next_data),
	.o_E(o_E),
	.o_delay_enb(w_delay_enb),
	.o_rst_cnt_rx(w_rst_cnt_rx),
	.o_enb_rx(w_enb_rx),
	.o_rst_inst(w_rst_inst)
	);
	
	cnt #(.BIT_SIZE(21)) cnt_21(
	.i_clk(i_board_clk),
	.i_ce(w_cnt_21_ce),
	.o_cnt(w_cnt_21)
	);
	
	cnt #(.BIT_SIZE(2)) cnt_2(
	.i_clk(i_board_clk),
	.i_ce(w_cnt_2_ce),
	.o_cnt(w_cnt_2)
	);
	
	cnt #(.BIT_SIZE(4)) cnt_4(
	.i_clk(i_board_clk),
	.i_ce(w_cnt_4_ce),
	.o_cnt(w_cnt_4)
	);
	
	cnt_inst #(.BIT_SIZE(6)) inst_cnt(
	.i_clk(i_board_clk),
	.i_ce(w_next_data),
	.o_cnt(w_inst_cnt),
	.i_rst_inst(w_rst_inst)
	);
	
	data_mux	data_mux (
	.clock ( i_board_clk ),
	.data0x ( RS_DATA_0 ),
	.data1x ( RS_DATA_1 ),
	.data2x ( RS_DATA_2 ),
	.data3x ( RS_DATA_3 ),
	.data4x ( RS_DATA_4 ),
	.data5x ( RS_DATA_5 ),
	.data6x ( RS_DATA_6 ),
	.data7x ( {1'b1,w_data[7:0]} ),
	.data8x ( {1'b1,w_data[15:8]} ),
	.data9x ( {1'b1,w_data[23:16]} ),
	.data10x ( {1'b1,w_data[31:24]} ),
	.data11x ( {1'b1,w_data[39:32]} ),
	.data12x ( {1'b1,w_data[47:40]} ),
	.data13x ( {1'b1,w_data[55:48]} ),
	.data14x ( {1'b1,w_data[63:56]} ),
	.data15x ( {1'b1,w_data[71:64]} ),
	.data16x ( {1'b1,w_data[79:72]} ),
	.data17x ( {1'b1,w_data[87:80]} ),
	.data18x ( {1'b1,w_data[95:88]} ),
	.data19x ( {1'b1,w_data[103:96]} ),
	.data20x ( {1'b1,w_data[111:104]} ),
	.data21x ( {1'b1,w_data[119:112]} ),
	.data22x ( {1'b1,w_data[127:120]} ),
	.data23x ( RS_DATA_22 ),
	.data24x ( {1'b1,w_data[135:128]} ),
	.data25x ( {1'b1,w_data[143:136]} ),
	.data26x ( {1'b1,w_data[151:144]} ),
	.data27x ( {1'b1,w_data[159:152]} ),
	.data28x ( {1'b1,w_data[167:160]} ),
	.data29x ( {1'b1,w_data[175:168]} ),
	.data30x ( {1'b1,w_data[183:176]} ),
	.data31x ( {1'b1,w_data[191:184]} ),
	.data32x ( {1'b1,w_data[199:192]} ),
	.data33x ( {1'b1,w_data[207:200]} ),
	.data34x ( {1'b1,w_data[215:208]} ),
	.data35x ( {1'b1,w_data[223:216]} ),
	.data36x ( {1'b1,w_data[231:224]} ),
	.data37x ( {1'b1,w_data[239:232]} ),
	.data38x ( {1'b1,w_data[247:240]} ),
	.data39x ( {1'b1,w_data[255:248]} ),
	.sel ( w_inst_cnt ),
	.result ( {o_RS, o_data} )
	);
	
	delay_block delay_block(
	.i_clk(i_board_clk),
	.i_inst_cnt(w_inst_cnt),
	.i_delay_enb(w_delay_enb),
	.o_delay_TO(w_delay_TO)
	);
	
	uart_rx uart_rx(
	.i_clk(i_board_clk),
	.i_data_rx(i_data_rx),
	.i_enb_rx(w_enb_rx),
	.o_data_rx(w_data_rx),
	.o_ready_rx(w_ready_rx)
	);
	
	cnt_rx cnt_rx(
	.i_clk(i_board_clk),
	.i_ce(w_ready_rx),
	.i_rst(w_rst_cnt_rx),
	.o_cnt(w_ready_cnt)
	);
	
	data_reg data_reg(
	.i_clk(i_board_clk),
	.i_ready_rx(r_ready_rx_del),
	.i_ready_cnt(w_ready_cnt),
	.i_data(w_data_rx),
	.o_data(w_data)
	);
	
	always@(posedge i_board_clk)
		r_ready_rx_del <= w_ready_rx;

endmodule 