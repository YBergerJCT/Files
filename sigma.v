/*
The key addition sigma[k]

The affine key addition sigma[k]:
M{Nx4}[GF(2^8)] -> M{Nx4}[GF(2^8)], 4 <= N <= 10,
consists of the bitwise addition (xor) of a key matrix,
k in M{Nx4}[GF(2^8)]
sigma[k](a) = b <=> b{i,j} = a{i,j} xor k{i,j},
0 <= i <= N-1, 0 <= j <= 3 .

This mapping is also used to introduce round constants in the key
schedule, and is obviously an involution.

this module make xor between 2 values of 128 bit each
one of the way we use it is between the data and the round key
*/

module sigma
(
	input [127:0] data_in,
	input [127:0] round_key,
	output [127:0] data_out
);

assign data_out = data_in^round_key;

endmodule