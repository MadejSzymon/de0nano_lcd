package pkg;
	
	typedef enum {PWR_UP, PWR_UP_DELAY, OFF_PWR_UP_DELAY, READ_DATA, WRITE_DATA, DATA_SETUP_DELAY, E_PULSE_HI, E_HI_TIME, E_PULSE_LO, PROC_COMP_DELAY, LOAD_NEXT_DATA} fsm_states;
	
	parameter [8:0] RS_DATA_0 = {1'b0,8'h38};
	parameter [8:0] RS_DATA_1 = {1'b0,8'h38};
	parameter [8:0] RS_DATA_2 = {1'b0,8'h38};
	parameter [8:0] RS_DATA_3 = {1'b0,8'h38};
	parameter [8:0] RS_DATA_4 = {1'b0,8'h0F};
	parameter [8:0] RS_DATA_5 = {1'b0,8'h01};
	parameter [8:0] RS_DATA_6 = {1'b0,8'h06};
	parameter [8:0] RS_DATA_22 = {1'b0,8'hC0};
	
	parameter [17:0] DELAY_0 = 18'b111111111111111111;
	parameter [17:0] DELAY_1 = 18'b000001111111111111;
	parameter [17:0] DELAY_2 = 18'b000000011111111111;
	parameter [17:0] DELAY_3 = 18'b000000011111111111;
	parameter [17:0] DELAY_4 = 18'b000000011111111111;
	parameter [17:0] DELAY_5 = 18'b011111111111111111;
	parameter [17:0] DELAY_6 = 18'b000000011111111111;
	parameter [17:0] DELAY_7 = 18'b000000011111111111;
	parameter [17:0] DELAY_8 = 18'b000000011111111111;
	parameter [17:0] DELAY_9 = 18'b000000011111111111;
	parameter [17:0] DELAY_10 = 18'b000000011111111111;
	parameter [17:0] DELAY_11 = 18'b000000011111111111;
	parameter [17:0] DELAY_12 = 18'b000000011111111111;
	parameter [17:0] DELAY_13 = 18'b000000011111111111;
	parameter [17:0] DELAY_14 = 18'b000000011111111111;
	parameter [17:0] DELAY_15 = 18'b000000011111111111;
	parameter [17:0] DELAY_16 = 18'b000000011111111111;
	parameter [17:0] DELAY_17 = 18'b000000011111111111;
	parameter [17:0] DELAY_18 = 18'b000000011111111111;
	parameter [17:0] DELAY_19 = 18'b000000011111111111;
	parameter [17:0] DELAY_20 = 18'b000000011111111111;
	parameter [17:0] DELAY_21 = 18'b000000011111111111;
	parameter [17:0] DELAY_22 = 18'b000000011111111111;
	parameter [17:0] DELAY_23 = 18'b000000011111111111;
	// UART ///////////////////////////////////////////////
	parameter DATA_BITS = 8;
	parameter STOP_BITS = 1;
	parameter integer CLK_FREQ = 50_000_000;
	parameter integer BAUD_RATE = 9600;
	parameter integer TICK_NBR = CLK_FREQ/BAUD_RATE;
	
	typedef enum {RX_IDLE,RX_START,RX_DATA,RX_STOP} rx_state;	
	
endpackage 