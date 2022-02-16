/* The transposition tau:

tau function is matrix transpose 
tau(a)=b <=> b(i,j)=a(j,i), 0 <= i,j <= 3
for example:
original Matrix is:
   1  2  3  4
   5  6  7  8
   9  10 11 12
   13 14 15 16
the transposed(tau) matrix will be:
   1  5  9  13
   2  6  10 14
   3  7  11 15
   4  8  12 16
vector form of the original matrix: 
   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 
therefore, the vector for transpose matrix will be:
   1 5 9 13 2 6 10 14 3 7 11 15 4 8 12 16
*/
module tau(
	input [127:0] matrix,
	output [127:0] T_matrix
);

assign T_matrix [127:120] = matrix[127:120];
assign T_matrix [119:112] = matrix[95:88];
assign T_matrix [111:104] = matrix[63:56];
assign T_matrix [103:96]  = matrix[31:24];
assign T_matrix [95:88]   = matrix[119:112];
assign T_matrix [87:80]   = matrix[87:80];
assign T_matrix [79:72]   = matrix[55:48];
assign T_matrix [71:64]   = matrix[23:16];
assign T_matrix [63:56]   = matrix[111:104];
assign T_matrix [55:48]   = matrix[79:72];
assign T_matrix [47:40]   = matrix[47:40];
assign T_matrix [39:32]   = matrix[15:8];
assign T_matrix [31:24]   = matrix[130:96];
assign T_matrix [23:16]   = matrix[71:64];
assign T_matrix [15:8] 	  = matrix[39:32];
assign T_matrix [7:0]     = matrix[7:0];

endmodule