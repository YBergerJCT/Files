module other_theta(
	input [127:0] data_in,
	output [127:0] deffused_data
);

localparam primitive_polynom = 12'h11d;
assign deffused_data[31:24] = (data_in[31:24] + 2*(data_in[23:16] + data_in[7:0]) + 4*(data_in[15:8] + data_in[7:0]))%primitive_polynom;   // a1 + 2*(a2 + a4) + 4*(a3 + a4)
assign deffused_data[23:16] = (data_in[23:16] + 2*(data_in[31:24] + data_in[15:8]) + 4*(data_in[15:8] + data_in[7:0]))%primitive_polynom;  // a2 + 2*(a1 + a3) + 4*(a3 + a4)
assign deffused_data[15:8]  = (data_in[15:8] + 2*(data_in[23:16] + data_in[7:0]) + 4*(data_in[31:24] + data_in[23:16]))%primitive_polynom; // a3 + 2*(a2 + a4) + 4*(a1 + a2)
assign deffused_data[7:0]   = (data_in[7:0] + 2*(data_in[31:24] + data_in[15:8]) + 4*(data_in[31:24] + data_in[23:16]))%primitive_polynom; // a4 + 2*(a1 + a3) + 4*(a1 + a2)

assign deffused_data[63:56] = (data_in[63:56] + 2*(data_in[55:48] + data_in[39:32]) + 4*(data_in[47:40] + data_in[39:32]))%primitive_polynom;   // a1 + 2*(a2 + a4) + 4*(a3 + a4)
assign deffused_data[55:48] = (data_in[55:48] + 2*(data_in[63:56] + data_in[47:40]) + 4*(data_in[47:40] + data_in[39:32]))%primitive_polynom;  // a2 + 2*(a1 + a3) + 4*(a3 + a4)
assign deffused_data[47:40]  = (data_in[47:40] + 2*(data_in[55:48] + data_in[39:32]) + 4*(data_in[63:56] + data_in[55:48]))%primitive_polynom; // a3 + 2*(a2 + a4) + 4*(a1 + a2)
assign deffused_data[39:32]   = (data_in[39:32] + 2*(data_in[63:56] + data_in[47:40]) + 4*(data_in[63:56] + data_in[55:48]))%primitive_polynom;

assign deffused_data[95:88] = (data_in[95:88] + 2*(data_in[87:80] + data_in[71:64]) + 4*(data_in[79:72] + data_in[71:64]))%primitive_polynom;   // a1 + 2*(a2 + a4) + 4*(a3 + a4)
assign deffused_data[87:80] = (data_in[87:80] + 2*(data_in[95:88] + data_in[79:72]) + 4*(data_in[79:72] + data_in[71:64]))%primitive_polynom;  // a2 + 2*(a1 + a3) + 4*(a3 + a4)
assign deffused_data[79:72]  = (data_in[79:72] + 2*(data_in[87:80] + data_in[71:64]) + 4*(data_in[95:88] + data_in[87:80]))%primitive_polynom; // a3 + 2*(a2 + a4) + 4*(a1 + a2)
assign deffused_data[71:64]   = (data_in[71:64] + 2*(data_in[95:88] + data_in[79:72]) + 4*(data_in[95:88] + data_in[87:80]))%primitive_polynom;

assign deffused_data[127:120] = (data_in[127:120] + 2*(data_in[119:112] + data_in[103:96]) + 4*(data_in[111:104] + data_in[103:96]))%primitive_polynom;   // a1 + 2*(a2 + a4) + 4*(a3 + a4)
assign deffused_data[119:112] = (data_in[119:112] + 2*(data_in[127:120] + data_in[111:104]) + 4*(data_in[111:104] + data_in[103:96]))%primitive_polynom;  // a2 + 2*(a1 + a3) + 4*(a3 + a4)
assign deffused_data[111:104]  = (data_in[111:104] + 2*(data_in[119:112] + data_in[103:96]) + 4*(data_in[127:120] + data_in[119:112]))%primitive_polynom; // a3 + 2*(a2 + a4) + 4*(a1 + a2)
assign deffused_data[103:96]   = (data_in[103:96] + 2*(data_in[127:120] + data_in[111:104]) + 4*(data_in[127:120] + data_in[119:112]))%primitive_polynom;
endmodule