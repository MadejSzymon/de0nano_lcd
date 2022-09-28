import pkg::*;
module delay_block(i_clk, i_inst_cnt, i_delay_enb, o_delay_TO);
	
	input i_clk;
	input [5:0] i_inst_cnt;
	input i_delay_enb;
	
	logic [17:0] w_delay_mux_out;
	output o_delay_TO;
	
	delay_mux_in	delay_mux_in (
	.clock ( i_clk ),
	.data0x ( DELAY_0 ),
	.data1x ( DELAY_1 ),
	.data2x ( DELAY_2 ),
	.data3x ( DELAY_3 ),
	.data4x ( DELAY_4 ),
	.data5x ( DELAY_5 ),
	.data6x ( DELAY_6 ),
	.data7x ( DELAY_7 ),
	.data8x ( DELAY_8 ),
	.data9x ( DELAY_9 ),
	.data10x ( DELAY_10 ),
	.data11x ( DELAY_11 ),
	.data12x ( DELAY_12 ),
	.data13x ( DELAY_13 ),
	.data14x ( DELAY_14 ),
	.data15x ( DELAY_15 ),
	.data16x ( DELAY_16 ),
	.data17x ( DELAY_17 ),
	.data18x ( DELAY_18 ),
	.data19x ( DELAY_19 ),
	.data20x ( DELAY_20 ),
	.data21x ( DELAY_21 ),
	.data22x ( DELAY_22 ),
	.data23x ( DELAY_23 ),
	.data24x ( DELAY_23 ),
	.data25x ( DELAY_23 ),
	.data26x ( DELAY_23 ),
	.data27x ( DELAY_23 ),
	.data28x ( DELAY_23 ),
	.data29x ( DELAY_23 ),
	.data30x ( DELAY_23 ),
	.data31x ( DELAY_23 ),
	.data32x ( DELAY_23 ),
	.data33x ( DELAY_23 ),
	.data34x ( DELAY_23 ),
	.data35x ( DELAY_23 ),
	.data36x ( DELAY_23 ),
	.data37x ( DELAY_23 ),
	.data38x ( DELAY_23 ),
	.data39x ( DELAY_23 ),
	.sel ( i_inst_cnt ),
	.result ( w_delay_mux_out )
	);
	
	delay delay(
	.i_clk(i_clk),
	.i_ce(i_delay_enb),
	.i_end(w_delay_mux_out),
	.o_delay_TO(o_delay_TO)
	);

	
endmodule 