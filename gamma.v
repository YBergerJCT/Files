/*the data in the algorithm is 128 bits. but the sbox is for 8 bits numbers
therefore we need a module that will get 128, and part them to 8 bits numbers 
so we could use sbox.
we will use nested modules. 
*/
module gamma(
	input [127:0] data_in,
	output [127:0] data_out
);

// nested module sbox
sbox s1(data_in[7:0],data_out[7:0]);
sbox s2(data_in[15:8],data_out[15:8]);
sbox s3(data_in[23:16],data_out[23:16]);
sbox s4(data_in[31:24],data_out[31:24]);
sbox s5(data_in[39:32],data_out[39:32]);
sbox s6(data_in[47:40],data_out[47:40]);
sbox s7(data_in[55:48],data_out[55:48]);
sbox s8(data_in[63:56],data_out[63:56]);
sbox s9(data_in[71:64],data_out[71:64]);
sbox s10(data_in[79:72],data_out[79:72]);
sbox s11(data_in[87:80],data_out[87:80]);
sbox s12(data_in[95:88],data_out[95:88]);
sbox s13(data_in[103:96],data_out[103:96]);
sbox s14(data_in[111:104],data_out[111:104]);
sbox s15(data_in[119:112],data_out[119:112]);
sbox s16(data_in[127:120],data_out[127:120]);

endmodule


