
module data_reg(i_clk, i_ready_rx, i_ready_cnt, i_data, o_data);
	
	input i_clk;
	input i_ready_rx;
	input [5:0] i_ready_cnt;
	input [7:0] i_data; 
	
	output logic [255:0] o_data = 0;

	always@(posedge i_clk) begin
		if(i_ready_rx) begin
			case(i_ready_cnt)
			1: o_data[7:0] <= i_data;
			2: o_data[15:8] <= i_data;
			3: o_data[23:16] <= i_data;
			4: o_data[31:24] <= i_data;
			5: o_data[39:32] <= i_data;
			6: o_data[47:40] <= i_data;
			7: o_data[55:48] <= i_data;
			8: o_data[63:56] <= i_data;
			9: o_data[71:64] <= i_data;
			10: o_data[79:72] <= i_data;
			11: o_data[87:80] <= i_data;
			12: o_data[95:88] <= i_data;
			13: o_data[103:96] <= i_data;
			14: o_data[111:104] <= i_data;
			15: o_data[119:112] <= i_data;
			16: o_data[127:120] <= i_data;
			17: o_data[135:128] <= i_data;
			18: o_data[143:136] <= i_data;
			19: o_data[151:144] <= i_data;
			20: o_data[159:152] <= i_data;
			21: o_data[167:160] <= i_data;
			22: o_data[175:168] <= i_data;
			23: o_data[183:176] <= i_data;
			24: o_data[191:184] <= i_data;
			25: o_data[199:192] <= i_data;
			26: o_data[207:200] <= i_data;
			27: o_data[215:208] <= i_data;
			28: o_data[223:216] <= i_data;
			29: o_data[231:224] <= i_data;
			30: o_data[239:232] <= i_data;
			31: o_data[247:240] <= i_data;
			32: o_data[255:248] <= i_data;
			endcase
		end
	end	
	
endmodule 