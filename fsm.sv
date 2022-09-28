import pkg::*;
module fsm(i_clk, i_delay_TO, i_inst_cnt, i_cnt_21, i_cnt_2, i_cnt_4, i_ready_cnt,
o_cnt_21_ce, o_cnt_2_ce, o_cnt_4_ce, o_next_data, o_E, o_delay_enb, o_rst_cnt_rx, o_enb_rx, o_rst_inst);
	
	input i_clk;
	input i_delay_TO;
	input [5:0] i_inst_cnt;
	input [20:0] i_cnt_21;
	input [3:0] i_cnt_4;
	input [1:0] i_cnt_2;
	input [5:0] i_ready_cnt;
	
	output logic o_cnt_21_ce = 0;
	output logic o_cnt_2_ce = 0;
	output logic o_cnt_4_ce = 0;
	output logic o_next_data = 0;
	output logic o_E = 0;
	output logic o_delay_enb = 0;
	output logic o_rst_cnt_rx = 0;
	output logic o_enb_rx = 0;
	output logic o_rst_inst;
	///////////////////////////////
	fsm_states state;
	fsm_states next;
	//////////////////////////////
	
	always@(*) begin
		case(state)
			PWR_UP: begin
				next = PWR_UP_DELAY;
			end
			PWR_UP_DELAY: begin
				if(i_cnt_21 == {21{1'b1}})
					next = OFF_PWR_UP_DELAY;
				else
					next = PWR_UP_DELAY;
			end
			OFF_PWR_UP_DELAY: begin
				next = READ_DATA;
			end
			READ_DATA: begin
				if(i_ready_cnt == 32)
					next = WRITE_DATA;
				else
					next = READ_DATA;
			end
			WRITE_DATA: begin
				next = DATA_SETUP_DELAY;
			end
			DATA_SETUP_DELAY: begin
				if(i_cnt_2 == {2{1'b1}})
					next = E_PULSE_HI;
				else
					next = DATA_SETUP_DELAY;
			end
			E_PULSE_HI: begin
				next = E_HI_TIME;
			end
			E_HI_TIME: begin
				if(i_cnt_4 == 10)
					next = E_PULSE_LO;
				else
					next = E_HI_TIME;
			end
			E_PULSE_LO: begin
				next = PROC_COMP_DELAY;
			end
			PROC_COMP_DELAY: begin
				if(i_delay_TO)
					next = LOAD_NEXT_DATA;
				else
					next = PROC_COMP_DELAY;
			end
			LOAD_NEXT_DATA: begin
				if(i_inst_cnt < 39)
					next = WRITE_DATA;
				else
					next = READ_DATA;
			end
		endcase
	end
	
	always@(posedge i_clk) begin
		state <= next;
	end
	
	always@(posedge i_clk) begin
		case(state)
			PWR_UP: begin
				o_cnt_21_ce <= 1'b1;
			end
			PWR_UP_DELAY: begin
				o_cnt_21_ce <= 1'b1;
			end
			OFF_PWR_UP_DELAY: begin
				o_cnt_21_ce <= 1'b0;
			end
			READ_DATA: begin
				o_enb_rx <= 1'b1;
				o_next_data <= 1'b0;
				o_rst_inst <= 1'b1;
			end
			WRITE_DATA: begin
				o_rst_inst <= 1'b0;
				o_rst_cnt_rx <= 1'b1;
				o_enb_rx <= 1'b0;
				o_cnt_2_ce <= 1'b1;
				o_next_data <= 1'b0;
			end
			DATA_SETUP_DELAY: begin
				o_rst_cnt_rx <= 1'b0;
				o_cnt_2_ce <= 1'b1;
			end
			E_PULSE_HI: begin
				o_cnt_2_ce <= 1'b0;
				o_cnt_4_ce <= 1'b1;
				o_E <= 1'b1;
			end
			E_HI_TIME: begin
				o_cnt_4_ce <= 1'b1;
				o_E <= 1'b1;
			end
			E_PULSE_LO: begin
				o_cnt_4_ce <= 1'b0;
				o_E <= 1'b0;
				o_delay_enb <= 1'b1;
			end
			PROC_COMP_DELAY: begin
				o_delay_enb <= 1'b1;
			end
			LOAD_NEXT_DATA: begin
				o_next_data <= 1'b1;
				o_delay_enb <= 1'b0;
			end
		endcase
	end
	
endmodule 